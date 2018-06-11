package com.njgo.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.njgo.dto.MemberDTO;
import com.njgo.dto.ProductDTO;
import com.njgo.dto.ProductOrderDTO;
import com.njgo.dto.ProductReviewDTO;
import com.njgo.service.MemberService;
import com.njgo.service.ProductOrderService;
import com.njgo.service.ProductReviewService;
import com.njgo.service.ProductService;
import com.njgo.util.MakePage;
import com.njgo.util.PageMaker;
import com.njgo.util.RowMaker;

@Controller
@RequestMapping(value = "/product/order/**")
public class ProductOrderController {
	@Autowired
	private ProductOrderService orderService;
	@Autowired
	private ProductService productService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private ProductReviewService reviewService;
	
	@RequestMapping(value = "orderList")
	public String orderList(Integer curPage, RowMaker rowInfo, Model model){		
		PageMaker pageMaker = new PageMaker(10, curPage);
		RowMaker rowMaker = pageMaker.getRowMaker(null, null);
		int totalCount = orderService.orderCount(rowMaker);
		MakePage makePage = pageMaker.getMakePage(totalCount);
		List<ProductOrderDTO> orderList = orderService.orderList(rowMaker);
		
		model.addAttribute("orderList", orderList);
		model.addAttribute("makePage", makePage);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("rowMaker", rowMaker);
		
		return "r";
	}
	
	@RequestMapping(value = "orderInsert")
	public String orderInsert(ProductOrderDTO orderDTO, String uPoint, String ordername, RedirectAttributes reAttributes, HttpSession session){
		System.out.println("====주문내역 저장 Controller====");
		System.out.println("사용포인트: " + uPoint);
		
		//주문내역 DB 저장
		orderService.orderInsert(orderDTO);
		
		//사용 포인트 차감
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setEmail(orderDTO.getMemberid());
		memberDTO.setPoint(Integer.parseInt(uPoint));
		memberService.pointMinusUpdate(memberDTO);
		
		MemberDTO modMemberDTO = memberService.emailCheck(orderDTO.getMemberid());
		session.setAttribute("memberDTO", modMemberDTO);
		
		reAttributes.addFlashAttribute("oriDTO", orderDTO);		
		
		return "redirect:/product/order/orderViewMember?memberid="+orderDTO.getMemberid();
	}
	
	@RequestMapping(value = "orderViewMember")
	public String orderViewMember(String memberid, Model model){		
		ProductOrderDTO orderDTO = orderService.orderViewMember(memberid);
		model.addAttribute("orderDTO", orderDTO);
		
		return "product/order/productOrder";
	}
	
	@RequestMapping(value = "orderMyPage")
	public String orderMyPage(String memberid, @RequestParam(defaultValue="1") Integer curPage, Model model) throws Exception{
		PageMaker pageMaker = new PageMaker(5, curPage);
		RowMaker rowMaker = pageMaker.getRowMaker(null, memberid);
		int totalCount = orderService.orderCountMember(memberid);
		MakePage makePage = pageMaker.getMakePage(totalCount);
		List<ProductOrderDTO> orderList = orderService.orderMember(rowMaker);
		List<ProductDTO[]> proList = new ArrayList<ProductDTO[]>();
		List<int[]> amountList = new ArrayList<int[]>();
		List<int[]> reviewList = new ArrayList<int[]>();
		ProductReviewDTO reviewDTO = new ProductReviewDTO();
		reviewDTO.setMemberid(memberid);
		
		for(int i = 0; i < orderList.size(); i++){
			String oList = orderList.get(i).getOrderlist();
			JSONParser jsonParser = new JSONParser();
			JSONArray array = (JSONArray)jsonParser.parse(oList);
			int[] amountArr = new int[array.size()];
			ProductDTO[] proArr = new ProductDTO[array.size()];
			int[] reviewArr = new int[array.size()];
			
			for(int j=0; j<array.size(); j++){
				int pronum = Integer.parseInt(((JSONObject)array.get(j)).get("pronum").toString());
				int amount = Integer.parseInt(((JSONObject)array.get(j)).get("amount").toString());
				proArr[j] = productService.productView(pronum);
				amountArr[j] = amount;
				reviewDTO.setPronum(pronum);
				reviewDTO.setOrdernum(orderList.get(i).getNum());
				reviewArr[j] = reviewService.reviewCountMember(reviewDTO);
			}
			proList.add(proArr);
			amountList.add(amountArr);
			reviewList.add(reviewArr);
		}
		model.addAttribute("orderList", orderList).addAttribute("proList", proList).addAttribute("amountList", amountList).addAttribute("reviewList", reviewList).addAttribute("makePage", makePage).addAttribute("curPage", curPage).addAttribute("rowMaker", rowMaker);
		
		return "product/order/myPageOrder";
	}
}
