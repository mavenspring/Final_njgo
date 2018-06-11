package com.njgo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.njgo.dto.MemberDTO;
import com.njgo.dto.ProductReviewDTO;
import com.njgo.service.MemberService;
import com.njgo.service.ProductReviewService;
import com.njgo.util.MakePage;
import com.njgo.util.PageMaker;
import com.njgo.util.RowMaker;

@Controller
@RequestMapping(value = "/product/review/**")
public class ProductReviewController {
	@Autowired
	private ProductReviewService reviewService;
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "reviewList")
	public String reviewList(Integer curPage, Integer pronum, Model model) throws Exception{
		PageMaker pageMaker = new PageMaker(10, curPage);
		RowMaker rowMaker = pageMaker.getRowMaker(pronum);
		int totalCount = reviewService.reviewCount(pronum);
		MakePage makePage = pageMaker.getMakePage(totalCount);
		List<ProductReviewDTO> reviewList = reviewService.reviewList(rowMaker);
		
		model.addAttribute("reviewList", reviewList).addAttribute("makePage", makePage);
		model.addAttribute("totalCount", totalCount).addAttribute("rowMaker", rowMaker).addAttribute("curPage", curPage);
		
		return "product/review/productReviewList";
	}
	
	@RequestMapping(value = "reviewInsert")
	@ResponseBody
	public void reviewInsert(ProductReviewDTO reviewDTO) throws Exception{
		reviewService.reviewInsert(reviewDTO);
		
		//포인트 적립
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setEmail(reviewDTO.getMemberid());
		memberDTO.setPoint(100);
		memberService.pointPlusUpdate(memberDTO);
	}
}
