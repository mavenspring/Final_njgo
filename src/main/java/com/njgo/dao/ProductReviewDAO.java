package com.njgo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.njgo.dto.ProductReviewDTO;
import com.njgo.util.RowMaker;

@Repository
public class ProductReviewDAO {
	@Autowired
	private SqlSession sqlSession;
	private static final String NAMESPACE = "ProductReviewMapper.";
	
	public List<ProductReviewDTO> reviewList(RowMaker rowMaker) throws Exception{
		return sqlSession.selectList(NAMESPACE + "reviewList", rowMaker);
	}
	
	public int reviewInsert(ProductReviewDTO reviewDTO) throws Exception{
		return sqlSession.insert(NAMESPACE + "reviewInsert", reviewDTO);
	}
	
	public int reviewCount(Integer pronum) throws Exception{
		return sqlSession.selectOne(NAMESPACE + "reviewCount", pronum);
	}
	
	public int reviewCountMember(ProductReviewDTO reviewDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE + "reviewCountMember", reviewDTO);
	}
}
