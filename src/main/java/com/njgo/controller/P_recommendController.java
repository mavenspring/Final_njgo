package com.njgo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.njgo.dto.P_recommendDTO;
import com.njgo.service.P_recommendService;



@Controller
@RequestMapping(value="/planner/**")
public class P_recommendController {

	@Autowired
	private P_recommendService recommendService;
	
	//Recommend
	@RequestMapping(value="recommend", method=RequestMethod.GET)
	public String recommend1(Model model, String kind) throws Exception{
		System.out.println("kind : "+kind);
		if(kind.equals("다이어트식단")){
			System.out.println("1");
			List<P_recommendDTO> Recommend1 = recommendService.recommend(kind);
			
			/*for(int i=0; i<Recommend1.size(); i++){
				System.out.println("num : "+Recommend1.get(i).getNum());
				System.out.println("아침 : "+Recommend1.get(i).getBreakfast());
				System.out.println("점심 : "+Recommend1.get(i).getLunch());
				System.out.println("저녁 : "+Recommend1.get(i).getDinner());
				System.out.println("간식 : "+Recommend1.get(i).getAddmenu());
				System.out.println("간식 : "+Recommend1.get(i).getKcal());
				System.out.println("NAME : "+Recommend1.get(i).getKind());
			}*/
			System.out.println("num : "+Recommend1.get(0).getNum());
			System.out.println("아침 : "+Recommend1.get(0).getBreakfast());
			System.out.println("점심 : "+Recommend1.get(0).getLunch());
			System.out.println("저녁 : "+Recommend1.get(0).getDinner());
			System.out.println("간식 : "+Recommend1.get(0).getAddmenu());
			System.out.println("간식 : "+Recommend1.get(0).getKcal());
			System.out.println("NAME : "+Recommend1.get(0).getKind());
			model.addAttribute("list", Recommend1);
			model.addAttribute("kind", kind);
		}else if(kind.equals("건강한식단")){
			List<P_recommendDTO> Recommend2 = recommendService.recommend(kind);
			model.addAttribute("list", Recommend2);
			model.addAttribute("kind", kind);
		}else if(kind.equals("균형잡힌식단")){
			List<P_recommendDTO> Recommend3 = recommendService.recommend(kind);
			model.addAttribute("list", Recommend3);
			model.addAttribute("kind", kind);
		}else if(kind.equals("칼로리폭탄식단")){
			List<P_recommendDTO> Recommend4 = recommendService.recommend(kind);
			model.addAttribute("list", Recommend4);
			model.addAttribute("kind", kind);
		}else{
			System.out.println("2");
			List<P_recommendDTO> Recommend5 = recommendService.recommend(kind);
			model.addAttribute("list", Recommend5);
		}
		System.out.println("3");
		
		return "planner/plannerInner";
	}

	
}