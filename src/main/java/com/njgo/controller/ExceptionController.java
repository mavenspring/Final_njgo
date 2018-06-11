package com.njgo.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@ControllerAdvice
public class ExceptionController {
	@ExceptionHandler(Exception.class)
	public String exception(Exception e, Model model){
		model.addAttribute("e", e.getMessage());
		
		System.out.println(e.getMessage());
		return "redirect:/errorPage";
	}
}
