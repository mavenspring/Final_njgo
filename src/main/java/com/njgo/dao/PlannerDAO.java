package com.njgo.dao;


import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.njgo.dto.PlannerDTO;
import com.njgo.dto.RecipeDTO;

@Repository
public class PlannerDAO{
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="PlannerMapper.";
	
	//selectList
	public List<PlannerDTO> selectList(String mid) throws Exception{
		/*System.out.println("mid : "+mid);*/
		List<PlannerDTO> qqq = new ArrayList<PlannerDTO>();
		qqq = sqlSession.selectList(NAMESPACE+"selectList", mid);
		return qqq;
	}
	
	//selectView
	public int selectView(PlannerDTO plannerDTO)throws Exception{
		int size = 0;
		plannerDTO = sqlSession.selectOne(NAMESPACE+"selectView", plannerDTO);
		if(plannerDTO!=null){
			size = 1;
		}
		return size;
	}
	//write
	public int insert(PlannerDTO plannerDTO) throws Exception{	
		 return sqlSession.insert(NAMESPACE+"insert", plannerDTO);		
	}
	//update
	public int plannerUpdate(PlannerDTO plannerDTO){
		return sqlSession.update(NAMESPACE+"update", plannerDTO);
	}
	
	
	//select
	public List<RecipeDTO> plannerMine(RecipeDTO recipeDTO)throws Exception{
		List<RecipeDTO> qqq = sqlSession.selectList(NAMESPACE+"searchmine", recipeDTO);
		return qqq;
	}
	public List<RecipeDTO> plannerAll(String foodname)throws Exception{
		List<RecipeDTO> qqq = sqlSession.selectList(NAMESPACE+"searchall", foodname);
		return qqq;
	}
	//minusSelect, plusSelect
	public List<PlannerDTO> minusplusSelect(String mid, String s_date){
		PlannerDTO plannerDTO = new PlannerDTO();
		plannerDTO.setMid(mid);
		plannerDTO.setRegdate(s_date);
		return sqlSession.selectList(NAMESPACE+"minusplusSelect", plannerDTO);
	}
	

}











