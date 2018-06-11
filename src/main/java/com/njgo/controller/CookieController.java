package com.njgo.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.njgo.dto.ProductDTO;
import com.njgo.dto.RecipeDTO;
import com.njgo.service.ProductService;
import com.njgo.service.RecipeService;
import com.njgo.util.CookieUtils;

@Controller
@RequestMapping(value = "/cookie/**")
public class CookieController {
	@Autowired
	private ProductService productService;
	
	@Autowired
	private RecipeService recipeService;
	
	@RequestMapping(value = "cookieList")
	public String cookieList(String key, HttpServletRequest request, Model model) throws Exception{
		CookieUtils cookieUtils = new CookieUtils();
		List<String> cList = cookieUtils.getValueList(key, request);
		
		if(key.equals("productClick")){
			//쇼핑몰 쿠키
			if(cList != null){
				List<ProductDTO> cookieList = new ArrayList<ProductDTO>();
				for(int i=0; i<cList.size(); i++){
					cookieList.add(productService.productView(Integer.parseInt(cList.get(cList.size()-i-1))));
				}
				model.addAttribute("cookieList", cookieList).addAttribute("key", "productClick");
			}
		}else{
			//레시피 쿠키
			List<RecipeDTO> cookieList = new ArrayList<RecipeDTO>();
			
			if(cList != null) {
				for(int i=0; i<cList.size(); i++){
					cookieList.add((RecipeDTO)((recipeService.recipeView(Integer.parseInt(cList.get(cList.size()-i-1)))).get("recipeInfo")));
				}
				model.addAttribute("cookieList", cookieList).addAttribute("key", "recipeClick");
				
			}
		}
		return "tmp/rightMenu";
	}
}
