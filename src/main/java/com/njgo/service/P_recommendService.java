package com.njgo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njgo.dao.P_recommendDAO;
import com.njgo.dto.P_recommendDTO;



@Service
public class P_recommendService{

	@Autowired
	private P_recommendDAO recommendDAO;
	
	//Recommend1
	public List<P_recommendDTO> recommend(String kind){
		System.out.println("service");
		return recommendDAO.recommend(kind);
	}

}
