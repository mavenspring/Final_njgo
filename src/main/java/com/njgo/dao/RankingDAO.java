package com.njgo.dao;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.njgo.dto.RankingDTO;
import com.njgo.dto.RecipeDTO;
import com.njgo.util.ListInfo;

@Repository
public class RankingDAO{
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="RankingMapper.";
	
	//select insert or update
	public int selectCount(RecipeDTO recipeDTO) {
		return sqlSession.selectOne(NAMESPACE+"selectCount", recipeDTO);
	}
	public void insert(RecipeDTO recipeDTO) {		
		 sqlSession.insert(NAMESPACE+"insert", recipeDTO);		
	}
	public void update(RecipeDTO recipeDTO) {
		 sqlSession.update(NAMESPACE+"update", recipeDTO);
	}
	
	//select1-3
	public List<RankingDTO> selectHit(ListInfo listInfo){
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
		return sqlSession.selectList(NAMESPACE+"selectHit", date);
	}
	public List<RankingDTO> selectScrap(ListInfo listInfo){
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
		
		return sqlSession.selectList(NAMESPACE+"selectScrap", date);
	}
	public List<RecipeDTO> selectUpload(ListInfo listInfo){
		return sqlSession.selectList(NAMESPACE+"selectUpload", listInfo);
	}
	
	//select all
	public List<RankingDTO> selectHitAll(ListInfo listInfo){
		List<RankingDTO> ddd = sqlSession.selectList(NAMESPACE+"selectHitAll", listInfo);
		System.out.println("사이즈 : "+ ddd.size());
		return ddd;
	}
	
	public List<RankingDTO> selectScrapAll(ListInfo listInfo){
		return sqlSession.selectList(NAMESPACE+"selectScrapAll", listInfo);
	}
	public List<RecipeDTO> selectUploadAll(ListInfo listInfo){
		return sqlSession.selectList(NAMESPACE+"selectUploadAll", listInfo);
	}
	
	public int rankingCount(ListInfo listInfo) {
		return sqlSession.selectOne(NAMESPACE+"count", listInfo);
	}
	public String startDate(){
		return sqlSession.selectOne(NAMESPACE+"startDate");
	}
	public String lastDate(){
		return sqlSession.selectOne(NAMESPACE+"lastDate");
	}

	public int selectTotalHit(int num){
		return sqlSession.selectOne(NAMESPACE+"selectTotalHit", num);
	}
	public int selectTotalScrap(int num){
		return sqlSession.selectOne(NAMESPACE+"selectTotalScrap", num);
	}

}
