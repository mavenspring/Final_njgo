package com.njgo.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.njgo.dto.CategoryDTO;
import com.njgo.dto.HashtagDTO;
import com.njgo.dto.IngredientsDTO;
import com.njgo.dto.MemberDTO;
import com.njgo.dto.RecipeDTO;
import com.njgo.dto.RecipeReplyDTO;
import com.njgo.dto.RecipeReviewDTO;
import com.njgo.dto.RecommendDTO;
import com.njgo.dto.ScrapDTO;
import com.njgo.dto.StepsDTO;
import com.njgo.service.RecipeService;
import com.njgo.service.FileService;
import com.njgo.service.RankingService;
import com.njgo.util.CookieUtils;
import com.njgo.util.ListInfo;

@Controller
@RequestMapping(value="/recipe/**")
public class RecipeController {
	@Inject
	private RecipeService recipeService;
	
	@Inject
	private RankingService rankingService;
	
	@RequestMapping(value="recipeView", method=RequestMethod.GET)
	public String view(Integer num, String[] curIng, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception{
		HashMap<String, Object> results=recipeService.view(num);
		results.put("curIng", curIng);
		List<Integer> count = new ArrayList<Integer>();
		List<IngredientsDTO> inArray=(List<IngredientsDTO>)results.get("ingredients");
		
		
		//쿠키 추가
		CookieUtils cookieUtils = new CookieUtils();
		cookieUtils.setCookie("recipeClick", Integer.toString(num), 1, request, response);
		
		//랭킹테이블 업데이트		
		RecipeDTO recipeDTO = (RecipeDTO)results.get("recipeDTO");
		if(!recipeDTO.getWriter().equals("운영자")){
			System.out.println("운영자 레시피아님. 랭킹 go");
			rankingService.rankingtCount(recipeDTO);			
		}
		
		int tmp = 0;
		for(int i=0;i<inArray.size();i++) {	
			if(i+1 < inArray.size()) {
				if(inArray.get(i).getKind().equals(inArray.get(i+1).getKind())) {
					tmp++;
				} else {
					count.add(tmp);
					tmp = 0;
				}
			} else {
				count.add(tmp);
			}
		}
		
		model.addAttribute("count", count);
		model.addAttribute("ingredient", inArray);
		model.addAttribute("view", results);
		
		return "recipe/recipeView";
	}
	
	@RequestMapping(value="search", method=RequestMethod.GET)
	public String search(ListInfo listInfo, Model model) throws Exception{
		listInfo.setPerPage(9);
		model.addAttribute("list", recipeService.search(listInfo));
		//해시맵 타입, 키: "listInfo"-페이징을 위한 startNum, lastNum 받아옴 / "listPack"-List<RecipeDTO>받아옴
		HashMap<String, Object> map = recipeService.search(listInfo);
		System.out.println(((List<String>)map.get("snsprof")).get(0));
		return "recipe/recipeList";
	}

	@RequestMapping(value="catesearch", method=RequestMethod.GET)
	public String catesearch(CategoryDTO cdto, String[] curIng, ListInfo listInfo, Model model) throws Exception{
		List<IngredientsDTO> ings=new ArrayList<IngredientsDTO>();
		listInfo.setPerPage(9);
		for(int i=0;i<curIng.length;i++){
			IngredientsDTO idto=new IngredientsDTO();
			System.out.println("받아온것 "+curIng[i]);
			idto.setName(curIng[i]);
			ings.add(idto);
			System.out.println("보내기 "+ings.get(i).getName());
		}
		model.addAttribute("list", recipeService.catesearch(cdto, ings, listInfo));
		model.addAttribute("curIng", curIng);
		String url="";
		// 추가
		HashMap<String, Object> temp= recipeService.catesearch(cdto, ings, listInfo);
		
		List<RecipeDTO> ar = (List<RecipeDTO>) temp.get("listPack");
 	
		if(ar.size()==0){
			url="recipe/noresult";
		}else{
			url="recipe/recipeSearch";
		}
		return url;
		//해시맵 타입, 키: "listInfo"-페이징을 위한 startNum, lastNum 받아옴 / "listPack"-List<RecipeDTO>받아옴
	}
	
	@RequestMapping(value="inglist", method=RequestMethod.GET)
	public String inglist(String find, Model model) throws Exception{
		List<IngredientsDTO> ing=recipeService.ingList(find);
		model.addAttribute("ingList", ing);
		return "/recipe/ingList";
	}

	@RequestMapping(value="isearch", method=RequestMethod.GET)
	public String isearch(String[] ingredients, ListInfo listInfo, Model model) throws Exception{
		List<IngredientsDTO> ing=new ArrayList<IngredientsDTO>();
		listInfo.setPerPage(9);
		for(int i=0;i<ingredients.length;i++){
			IngredientsDTO idto=new IngredientsDTO();
			idto.setName(ingredients[i]);
			ing.add(idto);
		}
		model.addAttribute("list", recipeService.isearch(ing, listInfo));
		//해시맵 타입, 키: "listInfo"-페이징을 위한 startNum, lastNum 받아옴 / "listPack"-List<RecipeDTO>받아옴
		model.addAttribute("curIng", ingredients);
		
		return "recipe/recipeList";
	}

	@RequestMapping(value="writersearch", method=RequestMethod.GET)
	public String writersearch(String writer, ListInfo listInfo, Model model){
		listInfo.setPerPage(9);
		model.addAttribute("list", recipeService.writersearch(writer, listInfo));
		//해시맵 타입, 키: "listInfo"-페이징을 위한 startNum, lastNum 받아옴 / "listPack"-List<RecipeDTO>받아옴
		return "recipe/recipeSearch";
	}
	
	@RequestMapping(value="scrapsearch", method=RequestMethod.GET)
	public String scrapsearch(String nickname, ListInfo listInfo, Model model){
		listInfo.setPerPage(9);
		model.addAttribute("list", recipeService.scrapsearch(nickname, listInfo));
		//해시맵 타입, 키: "listInfo"-페이징을 위한 startNum, lastNum 받아옴 / "listPack"-List<RecipeDTO>받아옴
		return "recipe/recipeSearch";
	}
	
	@RequestMapping(value="recipeScrapI", method=RequestMethod.GET)
	public String scrapI(ScrapDTO scrapDTO, Model model) throws Exception{
		recipeService.scrapIncrease(scrapDTO);
		return "redirect:recipeView?num="+scrapDTO.getRecipenum();
	}
	
	@RequestMapping(value="recipeScrapD", method=RequestMethod.GET)
	public String scrapD(ScrapDTO scrapDTO, Model model) throws Exception{
		recipeService.scrapDecrease(scrapDTO);
		return "redirect:recipeView?num="+scrapDTO.getRecipenum();
	}
	
	@RequestMapping(value="replyList", method=RequestMethod.GET)
	public void replyList(ListInfo listInfo, Integer rnum, Model model) throws Exception{ //rnum은 해당 레시피의 글번호
		List<RecipeReplyDTO> replyList=recipeService.replyList(listInfo, rnum);
		model.addAttribute("list", replyList);
		model.addAttribute("listInfo", listInfo);
	}
	
	@RequestMapping(value="replyWrite", method=RequestMethod.POST)
	public String replyWrite(RecipeReplyDTO rreplyDTO) throws Exception{
		recipeService.replyWrite(rreplyDTO);
		return "redirect:replyList?rnum="+rreplyDTO.getRecipenum(); 
	}
	
	@RequestMapping(value="replyReply", method=RequestMethod.GET)
	public String replyReply(RecipeReplyDTO rreplyDTO) throws Exception{ //이 매개변수에서 rreplyDTO.setNum은 반드시 답글다는 댓글의 원댓글 번호를 가져와야 함!
		System.out.println("writer: " + rreplyDTO.getWriter());
		recipeService.replyReply(rreplyDTO);
		return "redirect:replyList?rnum="+rreplyDTO.getRecipenum();
	}
	
	@RequestMapping(value="replyUpdate", method=RequestMethod.GET)
	public String replyUpdate(Integer num, Model model) throws Exception{
		RecipeReplyDTO rrdto=recipeService.replyView(num);
		model.addAttribute("content", rrdto);
		return "/recipe/replyView";
	}
	
	@RequestMapping(value="replyUpdate", method=RequestMethod.POST)
	public String replyUpdate(RecipeReplyDTO rreplyDTO) throws Exception{
		recipeService.replyUpdate(rreplyDTO);
		return "redirect:replyList?rnum="+rreplyDTO.getRecipenum();
	}
	
	@RequestMapping(value="replyDelete", method=RequestMethod.GET)
	public String replyDelete(Integer num, Integer rnum) throws Exception{ //rnum은 해당 레시피의 글번호
		recipeService.replyDelete(num);
		return "redirect:replyList?rnum="+rnum;
	}
	
	@RequestMapping(value="reviewList", method=RequestMethod.GET)
	public void reviewList(ListInfo listInfo, Integer rnum, Model model) throws Exception{ //rnum은 해당 레시피의 글번호
		List<RecipeReviewDTO> reviewList=recipeService.reviewList(listInfo, rnum);
		model.addAttribute("list", reviewList);
		model.addAttribute("listInfo", listInfo);
	}
	
	@RequestMapping(value="reviewWrite", method=RequestMethod.POST)
	public String reviewWrite(RecipeReviewDTO rreviewDTO) throws Exception{
		recipeService.reviewWrite(rreviewDTO);
		return "redirect:reviewList?rnum="+rreviewDTO.getRecipenum(); 
	}
	
	@RequestMapping(value="reviewDelete", method=RequestMethod.GET)
	public String reviewDelete(Integer num, Integer rnum) throws Exception{ //rnum은 해당 레시피의 글번호
		recipeService.reviewDelete(num, rnum);
		return "redirect:reviewList?rnum="+rnum;
	}
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value="recipeWrite", method=RequestMethod.GET)
	public String recipeWrite(HttpSession session, Model model) {
		String url;
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("memberDTO");
		
		if(memberDTO != null) {
			url = "/recipe/recipeWrite";
		} else {
			url = "/tmp/result";
			model.addAttribute("message", "로그인 후 이용해주세요.");
			model.addAttribute("path", "../member/login");
		}
		
		return url;
	}
	
	@RequestMapping(value = "recipeWrite", method = RequestMethod.POST)
	   public String recipeWrite(RecipeDTO recipeDTO, CategoryDTO categoryDTO, String[] explain, 
	         String[] kind, Integer[] kind_count, String[] i_name, String[] i_amount, String[] hashtag,
	         MultipartHttpServletRequest request, HttpSession session, Model model) throws Exception {
	      
	      MemberDTO memberDTO = (MemberDTO) session.getAttribute("memberDTO");
	      recipeDTO.setWriter(memberDTO.getNickName());
	      
	      recipeDTO.setR_intro(recipeDTO.getR_intro().replaceAll("\r\n", "<br>"));
	      
	      String url;
	      List<String> stepFName = new ArrayList<String>();
	      List<MultipartFile> step_pic = request.getFiles("step_pic");
	      List<StepsDTO> stepsArray = new ArrayList<StepsDTO>();
	      List<IngredientsDTO> ingredientArray = new ArrayList<IngredientsDTO>();
	      List<HashtagDTO> hashtagArray = new ArrayList<HashtagDTO>();
	      
	      FileService fileService = new FileService();
	      
	      MultipartFile main_pic = request.getFile("main");
	      String mainFName = fileService.fileSave(main_pic, session);
	      recipeDTO.setRep_pic(mainFName);
	      
	      for(MultipartFile f:step_pic) {
	         String tmp = fileService.fileSave(f, session);
	         stepFName.add(tmp);
	      }
	      
	      for(int i=0;i<explain.length;i++) {
	         StepsDTO stepsDTO = new StepsDTO();
	         
	         stepsDTO.setStep(i);
	         stepsDTO.setExplain(explain[i]);
	         stepsDTO.setFname(stepFName.get(i));
	         
	         stepsArray.add(stepsDTO);
	      }
	      
	      int tmp = 0;
	      for(int i=0;i<kind_count.length;i++) {
	         if(i == 0) {
	            for(int j=0;j<kind_count[i];j++) {
	               IngredientsDTO ingredientsDTO = new IngredientsDTO();
	               
	               ingredientsDTO.setKind(kind[i]);
	               ingredientsDTO.setName(i_name[j]);
	               
	               if(i_amount[j] != null) {
	                  ingredientsDTO.setAmount(i_amount[j]);
	               } else {
	                  ingredientsDTO.setAmount("");
	               }
	               
	               ingredientArray.add(ingredientsDTO);
	            }
	         } else {
	            tmp += kind_count[i - 1];
	            for(int j=0;j<kind_count[i];j++) {
	               IngredientsDTO ingredientsDTO = new IngredientsDTO();
	               
	               ingredientsDTO.setKind(kind[i]);
	               ingredientsDTO.setName(i_name[tmp + j]);
	               
	               if(i_amount[tmp + j] != null) {
	                  ingredientsDTO.setAmount(i_amount[tmp + j]);
	               } else {
	                  ingredientsDTO.setAmount("");
	               }
	               
	               ingredientArray.add(ingredientsDTO);
	            }
	         }
	      }   
	      
	      if(hashtag != null) {
	         for(String h:hashtag) {
	            HashtagDTO hashtagDTO = new HashtagDTO();
	            hashtagDTO.setHashtag(h);
	            hashtagArray.add(hashtagDTO);
	         }
	      } else {
	         hashtagArray = null;
	      }
	      
	      HashMap<String, Object> recipeMap = new HashMap<String, Object>();
	      recipeMap.put("recipeInfo", recipeDTO);
	      recipeMap.put("category", categoryDTO);
	      recipeMap.put("ingredient", ingredientArray);
	      recipeMap.put("step", stepsArray);
	      recipeMap.put("hashtag", hashtagArray);
	      
	      int result = recipeService.recipeWrite(recipeMap);
	      
	      if(result > 0) {
	    	  model.addAttribute("message", "글 쓰기 성공! 100P 지급되었습니다.");
	    	  model.addAttribute("path", "../recipe/search");
	      } else {
	    	  model.addAttribute("message", "글 쓰기 실패했습니다. 다시 시도해주십시오.");
	    	  model.addAttribute("path", "/recipe/recipeWrite");
	      }
	      
	      return "/tmp/result";
	}
	
	@RequestMapping(value="recipeDelete")
	public String recipeDelete(Integer recipeNum, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String message = "삭제가 실패하였습니다. 다시 시도해주십시오.";
		int result = 0;
		
		result = recipeService.recipeDelete(recipeNum);
		
		if(result > 0) {
			message = "삭제 성공했습니다.";
			CookieUtils cookieUtils = new CookieUtils();
			cookieUtils.deleteCookie("recipeClick", Integer.toString(recipeNum), request, response);
		}
		
		model.addAttribute("message", message);
		model.addAttribute("path", "../recipe/search");
		
		return "/tmp/result";
	}
	
	@RequestMapping(value="recipeUpdateForm")
	public String recipeUpdateForm(Integer recipeNum, Model model,HttpSession session) throws Exception {
		HashMap<String, Object> recipeMap = recipeService.recipeView(recipeNum);
		RecipeDTO recipeDTO = (RecipeDTO) recipeMap.get("recipeInfo");
		List<IngredientsDTO> inArray = (List<IngredientsDTO>) recipeMap.get("ingredient");
		List<IngredientsDTO> newArray = new ArrayList<IngredientsDTO>();
		List<Integer> count = new ArrayList<Integer>();
		int tmp = 0;
		String url;
		
		for(int i=0;i<inArray.size();i++) {	
			if(i+1 < inArray.size()) {
				if(inArray.get(i).getKind().equals(inArray.get(i+1).getKind())) {
					tmp++;
				} else {
					count.add(tmp);
					tmp = 0;
				}
			} else {
				count.add(tmp);
			}
		}
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("memberDTO");
		 
		if(memberDTO.getNickName() != null && memberDTO.getNickName().equals(recipeDTO.getWriter())) {
			url = "/recipe/recipeUpdateForm";
		} else {
			url = "/recipe/search";
		}
		
		model.addAttribute("ingredient", inArray);
		model.addAttribute("count", count);
		model.addAttribute("map", recipeMap);
		
		return url;
	}
	
	@RequestMapping(value="recipeUpdate", method=RequestMethod.POST)
	public String recipeUpdate(RecipeDTO recipeDTO, CategoryDTO categoryDTO, String[] explain, 
			String[] kind, Integer[] kind_count, String[] i_name, String[] i_amount, String[] hashtag,
			String main_check, String[] step_pic_check, MultipartHttpServletRequest request, HttpSession session, Model model) throws Exception {
		
		recipeDTO.setR_intro(recipeDTO.getR_intro().replaceAll("\r\n", "<br>"));
		
		List<String> stepFName = new ArrayList<String>();
		List<MultipartFile> step_pic = request.getFiles("step_pic");
		List<StepsDTO> stepsArray = new ArrayList<StepsDTO>();
		List<IngredientsDTO> ingredientArray = new ArrayList<IngredientsDTO>();
		List<HashtagDTO> hashtagArray = new ArrayList<HashtagDTO>();
		
		FileService fileService = new FileService();
		
		if(main_check.equals("yes")) {
			MultipartFile main_pic = request.getFile("main");
			
			String mainFName = fileService.fileSave(main_pic, session);
			recipeDTO.setRep_pic(mainFName);
		} else {
			recipeDTO.setRep_pic(main_check);
		}
		
		int index = 0;
		for(MultipartFile f:step_pic) {
			String tmp = "";
			
			if(step_pic_check[index].equals("yes")) {
				tmp = fileService.fileSave(f, session);
			} else {
				tmp = step_pic_check[index];
			}
			stepFName.add(tmp);
			index++;
		}
		
		for(int i=0;i<explain.length;i++) {
			StepsDTO stepsDTO = new StepsDTO();
			
			stepsDTO.setRecipenum(recipeDTO.getNum());
			stepsDTO.setStep(i);
			stepsDTO.setExplain(explain[i]);
			stepsDTO.setFname(stepFName.get(i));
			
			stepsArray.add(stepsDTO);
		}
		
		int tmp = 0;
		for(int i=0;i<kind_count.length;i++) {
			if(i == 0) {
				for(int j=0;j<kind_count[i];j++) {
					IngredientsDTO ingredientsDTO = new IngredientsDTO();
					
					ingredientsDTO.setRecipenum(recipeDTO.getNum());
					ingredientsDTO.setKind(kind[i]);
					ingredientsDTO.setName(i_name[j]);
					
					if(i_amount[j] != null) {
						ingredientsDTO.setAmount(i_amount[j]);
					} else {
						ingredientsDTO.setAmount("");
					}
					
					ingredientArray.add(ingredientsDTO);
				}
			} else {
				tmp += kind_count[i - 1];
				for(int j=0;j<kind_count[i];j++) {
					IngredientsDTO ingredientsDTO = new IngredientsDTO();
					
					ingredientsDTO.setRecipenum(recipeDTO.getNum());
					ingredientsDTO.setKind(kind[i]);
					ingredientsDTO.setName(i_name[tmp + j]);

					if(i_amount[tmp + j] != null) {
						ingredientsDTO.setAmount(i_amount[tmp + j]);
					} else {
						ingredientsDTO.setAmount("");
					}
					
					ingredientArray.add(ingredientsDTO);
				}
			}
		}
				
		if(hashtag != null) {
			for(String h:hashtag) {
				HashtagDTO hashtagDTO = new HashtagDTO();
				hashtagDTO.setRecipenum(recipeDTO.getNum());
				hashtagDTO.setHashtag(h);
				hashtagArray.add(hashtagDTO);
			}
		} else {
			hashtagArray = null;
		}
		
		HashMap<String, Object> recipeMap = new HashMap<String, Object>();
		
		recipeMap.put("recipeInfo", recipeDTO);
		recipeMap.put("category", categoryDTO);
		recipeMap.put("ingredient", ingredientArray);
		recipeMap.put("step", stepsArray);
		recipeMap.put("hashtag", hashtagArray);
		recipeMap.put("recipeNum", recipeDTO.getNum());
		
		int result = recipeService.recipeUpadate(recipeMap);
		
		if(result > 0) {
	    	  model.addAttribute("message", "수정 완료되었습니다.");
	    	  model.addAttribute("path", "../recipe/search");
		} else {
			model.addAttribute("message", "수정 실패했습니다. 다시 시도해주십시오.");
			model.addAttribute("path", "../recipe/search");
		}
	      
	    return "/tmp/result";
	}
	
	@RequestMapping(value="recommend", method = RequestMethod.POST)
	@ResponseBody
	public List<RecommendDTO> recommend(RecommendDTO recommendDTO) throws Exception {
		return recipeService.recipeRecommend(recommendDTO);
	}
	
	@RequestMapping(value="sWordInsert", method = RequestMethod.POST)
	public void sWordInsert(RecommendDTO recommendDTO) throws Exception {
		recipeService.sWordInsert(recommendDTO);
	}
	
	@RequestMapping(value="rank", method=RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Object> rank() throws Exception {
		return recipeService.rank();
	}
	
	@RequestMapping(value="recommendRecipe", method=RequestMethod.POST)
	@ResponseBody
	public List<RecipeDTO> recommendRecipe(String recommend) throws Exception {
		return recipeService.recommendRecipe(recommend);
	}
	
	@RequestMapping(value="hitTop", method=RequestMethod.GET)
	@ResponseBody
	public List<RecipeDTO> hitTop() throws Exception {
		return recipeService.hitTop();
	}
	
	@RequestMapping(value="cookingAdvice", method=RequestMethod.GET)
	@ResponseBody
	public List<RecipeDTO> cookingAdvice() throws Exception {
		return recipeService.cookingAdvice();
	}
	
	@RequestMapping(value="ingSearch")
	public void ingSearch(){
		
	}
	
	@RequestMapping(value="saveWeather", method=RequestMethod.POST)
	@ResponseBody
	public void saveWeather(String temperature, String weather, HttpSession session) throws Exception {
		
		session.setAttribute("temperature", temperature);
		session.setAttribute("weather", weather);
	}
	
}
