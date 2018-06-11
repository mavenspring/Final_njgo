package com.njgo.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.njgo.dto.ProductDTO;
import com.njgo.dto.ProductOrderDTO;
import com.njgo.service.ProductService;

@Controller
@RequestMapping(value = "/product/pay/**")
public class ProductPayController {
	@Autowired
	private ProductService productService;
	
	@RequestMapping(value = "payView")
	public String payView(@RequestParam(value="pNumList", required=true) List<String> pNumList, 
			@RequestParam(value="pAmountList", required=true) List<String> pAmountList, String memberid, Model model) throws Exception{
		
		List<ProductDTO> proList = new ArrayList<ProductDTO>();
		for(int i=0; i<pNumList.size(); i++){
			ProductDTO productDTO = new ProductDTO();
			productDTO = productService.productView(Integer.parseInt(pNumList.get(i)));
			proList.add(productDTO);
		}
		model.addAttribute("proList", proList).addAttribute("pAmountList", pAmountList);
		return "product/pay/productPay";
	}
	
	@RequestMapping(value = "payCardProcess")
	public String payCardProcess(){
		return "product/pay/productPayCard";
	}
	@RequestMapping(value = "payKakaoProcess")
	public String payKakaoProcess(){
		return "product/pay/productPayKaKao";
	}
	
	@RequestMapping(value = "paySuccess", method = RequestMethod.POST )
	public void paySuccess(){
		
	}
	
	
	@RequestMapping(value = "payOrderInsert", method = RequestMethod.POST )
	public String payOrderInsert(Model model, ProductOrderDTO orderDTO, String uPoint, String ordername, RedirectAttributes reAttributes){		
		reAttributes.addFlashAttribute("orderDTO", orderDTO).addFlashAttribute("uPoint", uPoint).addFlashAttribute("ordername", ordername);
		String path = "";
		if(orderDTO.getStatus().equals("card")){
			path = "redirect:/product/pay/payCardProcess";
		}else if(orderDTO.getStatus().equals("kakao")){
			path = "redirect:/product/pay/payKakaoProcess";
		}else{
			model.addAttribute("orderDTO", orderDTO).addAttribute("uPoint", uPoint).addAttribute("ordername", ordername);
			path = "product/pay/productPayForm";
		}
		
		return path;
	}
}
