package com.njgo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njgo.dao.RankingDAO;
import com.njgo.dto.RankingDTO;
import com.njgo.dto.RecipeDTO;
import com.njgo.util.ListInfo;


@Service
public class RankingService{

	@Autowired
	private RankingDAO rankingDAO;
	
	
	public void rankingtCount(RecipeDTO recipeDTO){
		int count = rankingDAO.selectCount(recipeDTO);
		if(count>0){
			rankingDAO.update(recipeDTO);
		}else{
			rankingDAO.insert(recipeDTO);
		}
	}
	//select1-3
	public List<RankingDTO> rankingHit(ListInfo listInfo){	
		return rankingDAO.selectHit(listInfo);
	}
	public List<RankingDTO> rankingScrap(ListInfo listInfo){	
		return rankingDAO.selectScrap(listInfo);
	}
	public List<RecipeDTO> rankingUpload(ListInfo listInfo){	
		return rankingDAO.selectUpload(listInfo);
	}
	
	//select all
	public List<RankingDTO> rankingHitAll(ListInfo listinfo){
		
		int count = rankingDAO.rankingCount(listinfo);
		listinfo.makePage(count, 10);
		return rankingDAO.selectHitAll(listinfo);
	}
	public List<RankingDTO> rankingScrapAll(ListInfo listinfo){
		int count = rankingDAO.rankingCount(listinfo);
		listinfo.makePage(count, 10);
		return rankingDAO.selectScrapAll(listinfo);
	}
	public List<RecipeDTO> rankingUploadAll(ListInfo listinfo){
		int count = rankingDAO.rankingCount(listinfo);
		listinfo.makePage(count, 10);
		return rankingDAO.selectUploadAll(listinfo);
	}
	public String StartDate(){
		return rankingDAO.startDate();
	}
	public String lastDate(){
		return rankingDAO.lastDate();
	}
	public int selectTotalHit(int num){
		return rankingDAO.selectTotalHit(num);
	}
	public int selectTotalScrap(int num){
		return rankingDAO.selectTotalScrap(num);
	}

}
