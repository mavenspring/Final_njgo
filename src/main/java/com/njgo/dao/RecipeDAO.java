package com.njgo.dao;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.njgo.dto.CategoryDTO;
import com.njgo.dto.HashtagDTO;
import com.njgo.dto.IngredientsDTO;
import com.njgo.dto.MemberDTO;
import com.njgo.dto.RecipeDTO;
import com.njgo.dto.RecommendDTO;
import com.njgo.dto.ScrapDTO;
import com.njgo.dto.StepsDTO;
import com.njgo.util.ListInfo;

@Repository
public class RecipeDAO {
	
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="recipeMapper.";
	
	public HashMap<String, Object> view(Integer num) throws Exception{
		sqlSession.update(NAMESPACE+"hitup", num);
	      RecipeDTO recipeDTO=sqlSession.selectOne(NAMESPACE+"rview", num);
	      List<IngredientsDTO> ingredients=sqlSession.selectList(NAMESPACE+"iview", num);
	      List<StepsDTO> steps=sqlSession.selectList(NAMESPACE+"sview", num);
	      List<HashtagDTO> tags=sqlSession.selectList(NAMESPACE+"tview", num);
	      List<String> scrappers=sqlSession.selectList(NAMESPACE+"scrapLoad", num);
	      MemberDTO sender=new MemberDTO();
	      sender.setNickName(recipeDTO.getWriter());
	      MemberDTO prof=sqlSession.selectOne("MyPageMapper.userSearch", sender);
	      String rawprof=prof.getMyPhoto();
	      String snsprof=prof.getSns_photo();
	      HashMap<String, Object> recipe=new HashMap<String, Object>();
	      recipe.put("scrapload", scrappers);
	      recipe.put("recipeDTO", recipeDTO);
	      recipe.put("ingredients", ingredients);
	      recipe.put("steps", steps);
	      recipe.put("hashtags", tags);
	      recipe.put("rawprof", rawprof);
	      recipe.put("snsprof", snsprof);
	      return recipe;
	}
	
	private HashMap<String, Object> search(ListInfo listInfo, List<Integer> result){
	
		if(result.size()==0){
			result.add(0);
		}
		Integer totalCount=sqlSession.selectOne(NAMESPACE+"searchcount", result);
		listInfo.setRow(listInfo.getCurPage(), 9);
		listInfo.makePage(totalCount, 10);
		HashMap<String, Object> searchresult=new HashMap<String, Object>();
		searchresult.put("collection", result);
		searchresult.put("listInfo", listInfo);
		List<RecipeDTO> rdtoList=sqlSession.selectList(NAMESPACE+"search", searchresult);
		MemberDTO sender=null;
	      List<String> rawprof=new ArrayList<String>();
	      List<String> snsprof=new ArrayList<String>();
	      for(RecipeDTO recipeDTO:rdtoList){
	         sender=new MemberDTO();
	         sender.setNickName(recipeDTO.getWriter());
	         MemberDTO prof=sqlSession.selectOne("MyPageMapper.userSearch", sender);
	         rawprof.add(prof.getMyPhoto());
	         snsprof.add(prof.getSns_photo());
	      }
	      searchresult.put("rawprof", rawprof);
	      searchresult.put("snsprof", snsprof);
		searchresult.put("totalCount", totalCount);
		searchresult.put("listPack", rdtoList);
		
		return searchresult;
	}
	
	public HashMap<String, Object> search(ListInfo listInfo){
		List<Integer> result=sqlSession.selectList(NAMESPACE+"hsearch1", listInfo);
		List<Integer> tresult=sqlSession.selectList(NAMESPACE+"rsearch1", listInfo);
		List<Integer> iresult=sqlSession.selectList(NAMESPACE+"isearch1", listInfo);
		result.addAll(tresult);
		result.addAll(iresult);
		return this.search(listInfo, result);
	}
	
	public HashMap<String, Object> catesearch(CategoryDTO category, List<IngredientsDTO> collection, ListInfo listInfo){
		List<Integer> cresult=sqlSession.selectList(NAMESPACE+"catesearch", category);
		List<Integer> hresult=sqlSession.selectList(NAMESPACE+"hsearch1", listInfo);
		List<Integer> tresult=sqlSession.selectList(NAMESPACE+"rsearch1", listInfo);
		List<Integer> iresult=sqlSession.selectList(NAMESPACE+"isearch1", listInfo);
		List<Integer> ingresult=sqlSession.selectList(NAMESPACE+"isearch", collection);
		if(listInfo.getFind().equals("%%")&&!collection.get(0).getName().equals("%%")){
			hresult.clear();
			tresult.clear();
			iresult.clear();
		}else if(collection.get(0).getName().equals("%%")&&!listInfo.getFind().equals("%%")){
			ingresult.clear();
		}
		hresult.addAll(tresult);
		hresult.addAll(iresult);
		hresult.addAll(ingresult);
		List<Integer> result=new ArrayList<Integer>();
		String cresult_tostring="";
		for(int i=0;i<cresult.size();i++){
			cresult_tostring+=cresult.get(i)+",";
		}
		for(int i=0;i<hresult.size();i++){
			
			if(cresult_tostring.indexOf(hresult.get(i).toString())!=-1){
				result.add(hresult.get(i));
			}
		}
		if(result.size()==0){
			result.add(0);
		}
		return this.search(listInfo, result);
	}
	
	public List<IngredientsDTO> ingList(String find){
		return sqlSession.selectList(NAMESPACE+"inglist", find);
	}
	
	public HashMap<String, Object> isearch(List<IngredientsDTO> collection, ListInfo listInfo){
		List<Integer> result=sqlSession.selectList(NAMESPACE+"isearch", collection);
		return this.search(listInfo, result);
	}
	
	public HashMap<String, Object> writersearch(String writer, ListInfo listInfo){
		List<Integer> result=sqlSession.selectList(NAMESPACE+"writersearch", writer);
		return this.search(listInfo, result);
	}
	
	public HashMap<String, Object> scrapsearch(String nickname, ListInfo listInfo){
		List<Integer> result=sqlSession.selectList(NAMESPACE+"scrapsearch", nickname);
		return this.search(listInfo, result);
	}
	
	public int scrapIncrease(ScrapDTO scrapDTO){ //scrapDTO의 닉네임은 session에서 받아오고, RecipeNum은 해당 넘버의 타이틀을 받으면 됨. 정상적으로 돌아갔다면 리턴값은 2
		int result=sqlSession.insert(NAMESPACE+"scrapAdd", scrapDTO);
		result+=sqlSession.update(NAMESPACE+"scrapI", scrapDTO.getRecipenum());
		return result;
	}
	
	public int scrapDecrease(ScrapDTO scrapDTO){ //scrapDTO의 닉네임은 session에서 받아오고, RecipeNum은 해당 넘버의 타이틀을 받으면 됨. 정상적으로 돌아갔다면 리턴값은 2
		int result=sqlSession.delete(NAMESPACE+"scrapSub", scrapDTO);
		result+=sqlSession.update(NAMESPACE+"scrapD", scrapDTO.getRecipenum());
		return result;
	}
	
	@Transactional
	public int recipeWrite(HashMap<String, Object> recipeMap) throws Exception {
		int result = sqlSession.insert(NAMESPACE + "insertRecipeInfo", recipeMap.get("recipeInfo"));	// 요리 정보 넣기
		
		if(result > 0) {
			sqlSession.insert(NAMESPACE + "insertCategory", recipeMap.get("category"));		// 카테고리 넣기
		}
		if(result > 0) {
			for(IngredientsDTO i:(ArrayList<IngredientsDTO>)recipeMap.get("ingredient")) {	// 재료 넣기
				sqlSession.insert(NAMESPACE + "insertIngredient", i);
			}
		}
		if(result > 0) {
			for(StepsDTO s:(ArrayList<StepsDTO>)recipeMap.get("step")) {					// 요리 순서 넣기
				sqlSession.insert(NAMESPACE + "insertStep", s);
			}
		}
		if(result > 0) {
			if((ArrayList<HashtagDTO>)recipeMap.get("hashtag") != null) {
				for(HashtagDTO h:(ArrayList<HashtagDTO>)recipeMap.get("hashtag")) {				// 해쉬태그 넣기
					sqlSession.insert(NAMESPACE + "insertHashtag", h);
				}
			}
		}
		if(result > 0) {
			RecipeDTO recipeDTO = (RecipeDTO) recipeMap.get("recipeInfo");
			String writer = recipeDTO.getWriter();
			System.out.println(writer);
			sqlSession.update(NAMESPACE + "updateMemberPoint_insert", writer);
		}
		
		return result;
	}
	
	@Transactional
	public int recipeDelete(Integer recipeNum) throws Exception {
		int result = sqlSession.update(NAMESPACE + "updateMemberPoint_delete", recipeNum);
		
		if(result > 0) {
			sqlSession.delete(NAMESPACE + "deleteRecipeInfo", recipeNum);
		}
		if(result > 0) {
			sqlSession.delete(NAMESPACE + "deleteCategory", recipeNum);
		} 
		if(result > 0) {
			sqlSession.delete(NAMESPACE + "deleteIngredient", recipeNum);
		}
		if(result > 0) {
			sqlSession.delete(NAMESPACE + "deleteStep", recipeNum);
		}
		if(result > 0) {
			sqlSession.delete(NAMESPACE + "deleteHashtag", recipeNum);
		}
		
		return result;
	}
	
	public HashMap<String, Object> recipeView(int recipeNum) {
		HashMap<String, Object> recipeMap = new HashMap<String, Object>();
		
		RecipeDTO recipeDTO = sqlSession.selectOne(NAMESPACE + "recipeInfoView", recipeNum);
		
		recipeDTO.setR_intro(recipeDTO.getR_intro().replaceAll("<br>","\r\n"));
		
		CategoryDTO categoryDTO = sqlSession.selectOne(NAMESPACE + "categoryView", recipeNum);
		List<IngredientsDTO> ingArray = sqlSession.selectList(NAMESPACE + "ingredientView", recipeNum);
		List<StepsDTO> stepsArray = sqlSession.selectList(NAMESPACE + "stepView", recipeNum);
		List<HashtagDTO> hashtagArray = sqlSession.selectList(NAMESPACE + "hashtagView", recipeNum);
		
		recipeMap.put("recipeInfo", recipeDTO);
		recipeMap.put("category", categoryDTO);
		recipeMap.put("ingredient", ingArray);
		recipeMap.put("step", stepsArray);
		recipeMap.put("hashtag", hashtagArray);
		
		return recipeMap;
	}
	
	@Transactional
	public int recipeUpdate(HashMap<String, Object> recipeMap) {
		int result = sqlSession.update(NAMESPACE + "recipeInfoUpdate", recipeMap.get("recipeInfo"));
		
		if(result > 0) {
			result = sqlSession.update(NAMESPACE + "categoryUpdate", recipeMap.get("category"));			
		} 
		if(result > 0) {
			result = sqlSession.delete(NAMESPACE + "deleteIngredient", recipeMap.get("recipeNum"));
		} 
		if(result > 0) {
			result = sqlSession.delete(NAMESPACE + "deleteStep", recipeMap.get("recipeNum"));
		} 
		if(result > 0) { 
			result = sqlSession.delete(NAMESPACE + "deleteHashtag", recipeMap.get("recipeNum"));
		}
		if(result > 0) {
			result = sqlSession.update(NAMESPACE + "categoryUpdate", recipeMap.get("category"));
		}
		if(result > 0) {
			for(IngredientsDTO i:(ArrayList<IngredientsDTO>)recipeMap.get("ingredient")) {		// 재료 넣기
				sqlSession.insert(NAMESPACE + "insertIngredient", i);
			}
		}
		
		if(result > 0) {
			for(StepsDTO s:(ArrayList<StepsDTO>)recipeMap.get("step")) {					// 요리 순서 넣기
				sqlSession.insert(NAMESPACE + "insertStep", s);
			}
		}
		if(result > 0) {
			if((ArrayList<HashtagDTO>)recipeMap.get("hashtag") != null) {
				for(HashtagDTO h:(ArrayList<HashtagDTO>)recipeMap.get("hashtag")) {				// 해쉬태그 넣기
					sqlSession.insert(NAMESPACE + "insertHashtag", h);
				}
			}
		}
		
		return result;
	}
	
	public List<RecommendDTO> recipeRecommend(RecommendDTO recommendDTO) throws Exception {
		List<RecommendDTO> result = sqlSession.selectList(NAMESPACE + "recipeRecommendSelect", recommendDTO);
		
		return result;
	}
	
	public int sWordInsert(RecommendDTO recommendDTO) throws Exception {
		return sqlSession.insert(NAMESPACE + "sWordInsert", recommendDTO);
	}
	
	public List<RecipeDTO> recommendRecipe(String recommendRecipe) throws Exception {
		return sqlSession.selectList(NAMESPACE + "selectRecommendRecipe", recommendRecipe);
	}
	
	public HashMap<String, Object> rank() throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		Calendar c = Calendar.getInstance();

		String year = Integer.toString(c.get(c.YEAR));
		String month = Integer.toString(c.get(c.MONTH));
		String lastDay = Integer.toString(c.getMaximum(c.DAY_OF_MONTH));
		
		String startDate = year + "0" + month + "01";
		String lastDate = year + "0" + month + lastDay;
		
		HashMap<String, String> date = new HashMap<String, String>();
		date.put("startDate", startDate);
		date.put("lastDate", lastDate);
		
		List<RecipeDTO> hit = sqlSession.selectList(NAMESPACE + "hitRank", date);
		List<RecipeDTO> scrap = sqlSession.selectList(NAMESPACE + "scrapRank", date);
		List<MemberDTO> upload = sqlSession.selectList(NAMESPACE + "uploadRank", date);
		
		map.put("hit", hit);
		map.put("scrap", scrap);
		map.put("upload", upload);
		
		return map;
	}
	
	public List<RecipeDTO> hitTop() throws Exception {
		return sqlSession.selectList(NAMESPACE + "selectHitTop");
	}
	
	public List<RecipeDTO> cookingAdvice() throws Exception {
		return sqlSession.selectList(NAMESPACE + "selectCookingAdvice");
	}
}
