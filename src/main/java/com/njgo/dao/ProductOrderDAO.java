package com.njgo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.njgo.dto.ProductOrderDTO;
import com.njgo.util.RowMaker;

@Repository
public class ProductOrderDAO {
	@Autowired
	private SqlSession sqlSession;
	private static final String NAMESPACE = "ProductOrderMapper.";
	
	public List<ProductOrderDTO> orderList(RowMaker rowMaker){
		return sqlSession.selectList(NAMESPACE + "orderList", rowMaker);
	}
	
	public ProductOrderDTO orderViewMember(String memberid){
		return sqlSession.selectOne(NAMESPACE + "orderViewMember", memberid);
	}
	
	public List<ProductOrderDTO> orderMember(RowMaker rowMaker){
		return sqlSession.selectList(NAMESPACE + "orderMember", rowMaker);
	}
	
	public int orderInsert(ProductOrderDTO orderDTO){
		return sqlSession.insert(NAMESPACE + "orderInsert", orderDTO);
	}
	
	public int orderCount(RowMaker rowMaker){
		return sqlSession.selectOne(NAMESPACE + "orderCount", rowMaker);
	}
	
	public int orderCountMember(String memberid){
		return sqlSession.selectOne(NAMESPACE + "orderCountMember", memberid);
	}
}
