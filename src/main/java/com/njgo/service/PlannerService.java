package com.njgo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njgo.dao.PlannerDAO;
import com.njgo.dto.PlannerDTO;
import com.njgo.dto.RecipeDTO;


@Service
public class PlannerService{

	@Autowired
	private PlannerDAO plannerDAO;
	
	//selectList
	public List<PlannerDTO> selectList(String mid)throws Exception{
		return plannerDAO.selectList(mid);
	}
	
	//selectView
	public int selectView(PlannerDTO plannerDTO)throws Exception{
		return plannerDAO.selectView(plannerDTO);
	}
	
	//write
	public int plannerInsert(PlannerDTO plannerDTO)throws Exception{
		return plannerDAO.insert(plannerDTO);
	}
	//update
	public int plannerUpdate(PlannerDTO plannerDTO)throws Exception{
		return plannerDAO.plannerUpdate(plannerDTO);
	}
	
	//search 2가지
	public List<RecipeDTO> plannerMine(RecipeDTO recipeDTO)throws Exception{
		return plannerDAO.plannerMine(recipeDTO);
	}
	public List<RecipeDTO> plannerAll(String foodname)throws Exception{
		return plannerDAO.plannerAll(foodname);
	}
	//minusSelect, plusSelect
	public List<PlannerDTO> minusplusSelect(String mid, String s_date){
		return plannerDAO.minusplusSelect(mid, s_date);
	}
	
	

}
