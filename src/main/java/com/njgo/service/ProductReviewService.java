package com.njgo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njgo.dao.ProductReviewDAO;
import com.njgo.dto.ProductReviewDTO;
import com.njgo.util.RowMaker;

@Service
public class ProductReviewService {
	@Autowired
	private ProductReviewDAO reviewDAO;
	
	public List<ProductReviewDTO> reviewList(RowMaker rowMaker) throws Exception{
		return reviewDAO.reviewList(rowMaker);
	}
	
	public int reviewInsert(ProductReviewDTO reviewDTO) throws Exception{
		return reviewDAO.reviewInsert(reviewDTO);
	}
	
	public int reviewCount(Integer pronum) throws Exception{
		return reviewDAO.reviewCount(pronum);
	}
	
	public int reviewCountMember(ProductReviewDTO reviewDTO) throws Exception{
		return reviewDAO.reviewCountMember(reviewDTO);
	}
}
