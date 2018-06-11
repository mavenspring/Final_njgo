package com.njgo.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.njgo.dto.P_recommendDTO;
@Repository
public class P_recommendDAO{
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="p_recommendMapper.";
	
	//select all
	public List<P_recommendDTO> recommend(String kind){
		System.out.println("dao");
		List<P_recommendDTO> aaa = sqlSession.selectList(NAMESPACE+"p_recommend", kind);
		System.out.println("dao, end");
		return aaa;
	}

}
