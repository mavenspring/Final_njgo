package com.njgo.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.njgo.dto.MemberDTO;
import com.njgo.service.MessageService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private MessageService messageService;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value="messageCheck",method=RequestMethod.GET)
	   public String messageCheck(HttpSession session, Model model){
	      
	      MemberDTO memberDTO = (MemberDTO)session.getAttribute("memberDTO");
	      String message ="로그인해주세요.";
	      if(memberDTO ==null){
	         model.addAttribute("message", message);
	         return "home";
	      }else{
	    	  int result =0;
				if(Integer.parseInt(memberDTO.getGrade())>1){
					result =messageService.messageCheck("운영자");
				}else{
					 result =messageService.messageCheck(memberDTO.getNickName());
				}
				session.setAttribute("messageCheck", result);
	         System.out.println(" 쪽지 : "+result);
	         return "redirect:/";   
	      }
	   }
	
	@RequestMapping(value = "errorPage")
	public String errorPage(){
		return "error/errorPage";
	}
	
}
