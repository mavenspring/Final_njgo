package com.njgo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.njgo.dto.MultiFileDTO;
import com.njgo.dto.ProductDTO;
import com.njgo.service.FileService;
import com.njgo.service.ProductService;
import com.njgo.util.CookieUtils;
import com.njgo.util.MakePage;
import com.njgo.util.PageMaker;
import com.njgo.util.RowMaker;

@Controller
@RequestMapping(value = "/product/**")
public class ProductController {
	@Autowired
	private FileService fileService;
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping(value = "productList")
	public void productList() throws Exception{
		
	}
	
	
	@RequestMapping(value = "productList_wrap", method = RequestMethod.POST)
	public String productList_wrap(Model model, Integer curPage, RowMaker rowInfo) throws Exception{
		PageMaker pageMaker = new PageMaker(16, curPage);
		RowMaker rowMaker = pageMaker.getRowMaker(rowInfo.getCate_major(), rowInfo.getCate_minor(), null);
		int totalCount = productService.productCount(rowMaker);
		MakePage makePage = pageMaker.getMakePage(totalCount);
		List<ProductDTO> productList = productService.productList(rowMaker);

		model.addAttribute("productList", productList);
		model.addAttribute("makePage", makePage);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("rowMaker", rowMaker);
		model.addAttribute("curPage", curPage);
		return "product/productList_wrap";
	}
	
	@RequestMapping(value = "productView", method = RequestMethod.GET)
	public String productView(Model model, Integer pronum, HttpServletRequest request, HttpServletResponse response) throws Exception{
		if(pronum != null){			
			//productView Controller
			ProductDTO productDTO = productService.productView(pronum);
			
			
			if(productDTO != null){
				List<ProductDTO> cateList = productService.productCateList(productDTO);
				
				model.addAttribute("productDTO", productDTO);
				model.addAttribute("cateList", cateList);
				
				//쿠키 추가
				CookieUtils cookieUtils = new CookieUtils();
				cookieUtils.setCookie("productClick", pronum.toString(), 1, request, response);
				
				return "product/productView";				
			}else{
				return "redirect:/errorPage";
			}
		}else{
			return "redirect:/errorPage";
		}
	}
	
	@RequestMapping(value = "productWrite", method = RequestMethod.GET)
	public String productWrite(Model model) throws Exception{
		model.addAttribute("path", "Write");
		return "product/productWrite";
	}
	
	@RequestMapping(value = "productWrite", method = RequestMethod.POST)
	public ModelAndView productWrite(ProductDTO productDTO, MultiFileDTO multiFileDTO, HttpSession session, RedirectAttributes reAttributes) throws Exception{
		productDTO.setF_mainimg(fileService.fileSave(multiFileDTO.getF1(), session));
		productDTO.setO_mainimg(multiFileDTO.getF1().getOriginalFilename());
		productDTO.setF_detailimg(fileService.fileSave(multiFileDTO.getF2(), session));
		productDTO.setO_detailimg(multiFileDTO.getF2().getOriginalFilename());
		
		int result = productService.productWrite(productDTO);
		String message = "상품 등록에 실패했습니다.";
		if(result > 0){
			message = "상품 등록이 완료되었습니다.";
		}
		
		ModelAndView mv = new ModelAndView();
		reAttributes.addFlashAttribute("message", message);
		mv.setViewName("redirect:productList");
		return mv;
	}
	@RequestMapping(value = "productUpdate", method = RequestMethod.GET)
	public String productUpdate(Model model, Integer pronum) throws Exception{
		if(pronum != null){
			ProductDTO productDTO = productService.productView(pronum);
			model.addAttribute("productDTO", productDTO);
			model.addAttribute("path", "Update");
		}
		return "product/productWrite";
	}
	@RequestMapping(value = "productUpdate", method = RequestMethod.POST)
	public ModelAndView productUpdate(ProductDTO productDTO, MultiFileDTO multiFileDTO, HttpSession session, RedirectAttributes reAttributes) throws Exception{
		ProductDTO oDTO = productService.productView(productDTO.getPronum());
		if(multiFileDTO.getF1().getOriginalFilename() == ""){
			if(multiFileDTO.getF2().getOriginalFilename() == ""){
				//대표이미지, 상세이미지 둘다 안바꼈을 때
				productDTO.setF_mainimg(oDTO.getF_mainimg());
				productDTO.setO_mainimg(oDTO.getO_mainimg());
				productDTO.setF_detailimg(oDTO.getF_detailimg());
				productDTO.setO_detailimg(oDTO.getO_detailimg());
				
			}else{
				//상세이미지만 바꼈을 때
				productDTO.setF_mainimg(oDTO.getF_mainimg());
				productDTO.setO_mainimg(oDTO.getO_mainimg());
				productDTO.setF_detailimg(fileService.fileSave(multiFileDTO.getF2(), session));
				productDTO.setO_detailimg(multiFileDTO.getF2().getOriginalFilename());
				
			}
		}else{
			if(multiFileDTO.getF2().getOriginalFilename() == ""){
				//대표이미지만 바꼈을 때
				productDTO.setF_detailimg(oDTO.getF_detailimg());
				productDTO.setO_detailimg(oDTO.getO_detailimg());
				productDTO.setF_mainimg(fileService.fileSave(multiFileDTO.getF1(), session));
				productDTO.setO_mainimg(multiFileDTO.getF1().getOriginalFilename());
			}else{
				//대표이미지, 상세이미지 둘다 바꼈을 때
				productDTO.setF_mainimg(fileService.fileSave(multiFileDTO.getF1(), session));
				productDTO.setO_mainimg(multiFileDTO.getF1().getOriginalFilename());
				productDTO.setF_detailimg(fileService.fileSave(multiFileDTO.getF2(), session));
				productDTO.setO_detailimg(multiFileDTO.getF2().getOriginalFilename());
			}			
		}
		int result = productService.productUpdate(productDTO);
		String message = "상품 수정에 실패했습니다.";
		if(result > 0){
			message = "상품 수정이 완료되었습니다.";
		}
		ModelAndView mv = new ModelAndView();
		reAttributes.addFlashAttribute("message", message);
		mv.setViewName("redirect:productList");
		return mv;
	}
	
	@RequestMapping(value = "productDelete")
	public String productDelete(Integer pronum, RedirectAttributes reAttributes, HttpServletRequest request, HttpServletResponse response) throws Exception{
		int result = productService.productDelete(pronum);
		CookieUtils cookieUtils = new CookieUtils();
		if(cookieUtils.isExist("productClick", request)){
			cookieUtils.deleteCookie("productClick", pronum.toString(), request, response);
		}
		String message = "상품 삭제에 실패했습니다. 다시 시도해주세요.";
		if(result > 0){
			message = "상품 삭제가 완료되었습니다.";
		}
		reAttributes.addFlashAttribute("message", message);
		return "redirect:productList";
	}
}
