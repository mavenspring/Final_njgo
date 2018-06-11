package com.njgo.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.njgo.dto.RankingDTO;
import com.njgo.dto.RecipeDTO;
import com.njgo.service.RankingService;
import com.njgo.util.ListInfo;

@Controller
@RequestMapping(value="/ranking/**")
public class RankingController {

	@Autowired
	private RankingService rankingService;
	
	//rankingCount
	@RequestMapping(value="rankingCount", method=RequestMethod.GET)
	public void rankingPage(RecipeDTO recipeDTO) throws Exception{
		rankingService.rankingtCount(recipeDTO);
	}
	//Page 들어가는 메서드
	@RequestMapping(value="hitPage", method=RequestMethod.GET)
	public String hitPage(Model model) throws Exception{
		model.addAttribute("kind", "hit");
		model.addAttribute("board", "조회수 랭킹");
		return "ranking/rankingPage";
	}	
	@RequestMapping(value="scrapPage", method=RequestMethod.GET)
	public String scrapPage(Model model) throws Exception{
		model.addAttribute("board", "스크랩수 랭킹");
		model.addAttribute("kind", "scrap");
		return "ranking/rankingPage";
	}
	@RequestMapping(value="uploadPage", method=RequestMethod.GET)
	public String uploadPage(Model model) throws Exception{
		model.addAttribute("board", "셰프 랭킹");
		model.addAttribute("kind", "upload");
		return "ranking/rankingPage";
	}
	//Page List
	@RequestMapping(value="rankingInner", method=RequestMethod.GET)
	public String rankingInner(Model model, @RequestParam(defaultValue="1") Integer curPage, String startDate, String kind) throws Exception{
		ListInfo listInfo = new ListInfo();
		if(startDate == "" || startDate == null){
			listInfo.setStartDate(rankingService.StartDate());
		}else{
			listInfo.setStartDate(startDate+"01");
			listInfo.setLastDate(startDate+"31");	
		}
		listInfo.setCurPage(curPage);
		listInfo.setRow(curPage, 10);
		if(kind.equals("hit")){
			List<RankingDTO> hit = rankingService.rankingHitAll(listInfo);
			List<Integer> thit= new ArrayList<Integer>(); 
			for(int i=0; i<hit.size(); i++){
				int totalNum = rankingService.selectTotalHit(hit.get(i).getNum());
				thit.add(totalNum);
			}
			model.addAttribute("listAll", hit);
			model.addAttribute("thit", thit);
			model.addAttribute("kind", "hit");
		}else if(kind.equals("scrap")){
			List<RankingDTO> scrap = rankingService.rankingScrapAll(listInfo);
			List<Integer> tscrap = new ArrayList<Integer>();
			for(int i=0; i<scrap.size(); i++){
				int totalNum = rankingService.selectTotalScrap(scrap.get(i).getNum());
				tscrap.add(totalNum);
			}
			model.addAttribute("listAll", scrap);
			model.addAttribute("tscrap", tscrap);
			model.addAttribute("kind", "scrap");
		}else{
			List<RecipeDTO> upload = rankingService.rankingUploadAll(listInfo);
			model.addAttribute("listAll", upload);
			model.addAttribute("kind", "upload");
		}
		model.addAttribute("listInfo", listInfo);		
		return "ranking/rankingInner";
	}	
	//Page1-3
	@ResponseBody
	@RequestMapping(value="rankingHit", method=RequestMethod.GET)
	public List<RankingDTO> rankingHit(RedirectAttributes rd) throws Exception{	
		ListInfo listInfo = new ListInfo();
		listInfo.setStartDate(rankingService.StartDate());
		listInfo.setLastDate(rankingService.lastDate());
		List<RankingDTO> hit = rankingService.rankingHit(listInfo);
		System.out.println(hit.size());
		rd.addFlashAttribute("list", hit);
		return hit;
	}
	@ResponseBody
	@RequestMapping(value="rankingScrap", method=RequestMethod.GET)
	public List<RankingDTO> rankingScrap(RedirectAttributes rd) throws Exception{	
		ListInfo listInfo = new ListInfo();
		listInfo.setStartDate(rankingService.StartDate());
		listInfo.setLastDate(rankingService.lastDate());
		List<RankingDTO> scrap = rankingService.rankingScrap(listInfo);
		rd.addFlashAttribute("list", scrap);
		return scrap;
	}
	@ResponseBody
	@RequestMapping(value="rankingUpload", method=RequestMethod.GET)
	public List<RecipeDTO> rankingUpload(RedirectAttributes rd) throws Exception{	
		System.out.println("upload1-3 여기 들어오는지 확인");
		ListInfo listInfo = new ListInfo();
		listInfo.setStartDate(rankingService.StartDate());
		listInfo.setLastDate(rankingService.lastDate());
		List<RecipeDTO> upload = rankingService.rankingUpload(listInfo);
		System.out.println("upload data writer : "+ upload.get(0).getWriter());
		System.out.println("upload data writer : "+ upload.get(0).getCt());
		System.out.println("upload data writer : "+ upload.get(0).getMyphoto());
		rd.addFlashAttribute("list", upload);
	return upload;
	}		
	

	
}