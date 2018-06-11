package com.njgo.controller;

import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.njgo.dto.PlannerDTO;
import com.njgo.dto.RecipeDTO;
import com.njgo.service.PlannerService;


@Controller
@RequestMapping(value="/planner/**")
public class PlannerController {

	@Autowired
	private PlannerService plannerService;
	
	@RequestMapping(value="plannerPage", method=RequestMethod.GET)
	public void plannerPage(Model model) throws Exception{
		Calendar calendar = Calendar.getInstance();
		Integer dd = calendar.get(Calendar.DAY_OF_MONTH);
		Integer year = calendar.get(Calendar.YEAR);
		Integer MM = (calendar.get(Calendar.MONTH) + 1);    
		String mm = null;
		String aa = null;
		String yyyyMMdd = null;
		
		
		if(MM<10){			
			mm = "0"+MM;
		}
		
		if(dd<10){
			aa = "0"+dd;
		}
		
		if(mm != null){
			yyyyMMdd = ""+year+mm+dd;
			if(aa != null){
				yyyyMMdd = ""+year+mm+aa;
			}else
				yyyyMMdd = ""+year+mm+dd;
		}else{
			yyyyMMdd = ""+year+MM+dd;
			if(aa != null){
				yyyyMMdd = ""+year+MM+aa;
			}else{
				yyyyMMdd = ""+year+MM+dd;
			}
		}
		model.addAttribute("standard", yyyyMMdd); //기준날짜, 오늘날짜
		model.addAttribute("kind", "today");
	}
	
	@RequestMapping(value="plannerWrite", method=RequestMethod.POST)
	public String plannerWrite(String[] breaks, String[] lunch, String[] dinner, String[] add, String[] regdate, String mid, RedirectAttributes rd) throws Exception{
		
		List<PlannerDTO> list = new ArrayList<PlannerDTO>();
		
		PlannerDTO plannerDTO = null;
		for(int i=0; i<7; i++){
			plannerDTO = new PlannerDTO();
			if(breaks[i]==null){
				breaks[i]="_";
			}
			if(lunch[i]==null){
				lunch[i]="_";
			}
			if(dinner[i]==null){
				dinner[i]="_";
			}
			if(add[i]==null){
				add[i]="_";
			}
			plannerDTO.setBreaks(breaks[i]);	
			plannerDTO.setLunch(lunch[i]);	
			plannerDTO.setDinner(dinner[i]);
			plannerDTO.setAddmenu(add[i]);
			plannerDTO.setRegdate(regdate[i]);
			plannerDTO.setMid(mid);
			list.add(plannerDTO);
		}	
		
		for(int i=0; i<list.size(); i++){		
			int[] size = new int[list.size()];
			size[i]=plannerService.selectView(list.get(i));
			if(size[i]==0){
				//insert
				plannerService.plannerInsert(list.get(i));
			}else{
				//update
				plannerService.plannerUpdate(list.get(i));
			}
		}
		
		
		
			/*int size0 = plannerService.selectView(list.get(0));
			
			if(size0==0){
				//insert
				plannerService.plannerInsert(list.get(0));
			}else{
				//update
				plannerService.plannerUpdate(list.get(0));
			}*/
			
	

			
		
	/*	String message = "FAIL";
		if(result>0){
			message="SUCCESS";
		}
		rd.addFlashAttribute("message", message);*/
		return "redirect:plannerPage";
	}
	
	//search
	@RequestMapping(value="plannerSearch", method=RequestMethod.GET)
	public String plannerSearch(Model model, String search, String foodname, String writer) throws Exception{
		
		if(search.equals("mine")){
			RecipeDTO recipeDTO = new RecipeDTO();
			recipeDTO.setFoodname(foodname);
			recipeDTO.setWriter(writer);
			List<RecipeDTO> list = plannerService.plannerMine(recipeDTO);	
			model.addAttribute("list", list);
		}else if(search.equals("all")){
			List<RecipeDTO> list = plannerService.plannerAll(foodname);	
			model.addAttribute("list", list);
		}
		return "planner/plannerInput";
	}
	
	
	
	
	@RequestMapping(value="plannerTable", method=RequestMethod.GET)
	public void plannerTable(Model model,String kind, String mid, String standard) throws Exception{
		System.out.println("kind: " + kind);
		System.out.println("standard " + standard);
		
		//standard == 보내온 날짜파라미터값(기준이되는 첫째날)
		Calendar calendar = Calendar.getInstance();
		Integer dd = calendar.get(Calendar.DAY_OF_MONTH);
		Integer year = calendar.get(Calendar.YEAR);
		Integer MM = (calendar.get(Calendar.MONTH) + 1);    
		String mm = null;
		String aa = null;
		String yyyyMMdd = null;
		List<Integer> regdate = new ArrayList<Integer>();
		List<String> date = new ArrayList<String>();
		
		PlannerDTO plannerDTO = new PlannerDTO();
		int yyyy;
		
		if(MM<10){			
			mm = "0"+MM;
		}
		
		if(dd<10){
			aa = "0"+dd;
		}
		
		if(mm != null){
			yyyyMMdd = ""+year+mm+dd;
			if(aa != null){
				yyyyMMdd = ""+year+mm+aa;
			}else
				yyyyMMdd = ""+year+mm+dd;
		}else{
			yyyyMMdd = ""+year+MM+dd;
			if(aa != null){
				yyyyMMdd = ""+year+MM+aa;
			}else{
				yyyyMMdd = ""+year+MM+dd;
			}
		}
		
		
		if(kind.equals("today")){
			System.out.println("today");
			for(int i=0; i<7; i++){
				yyyy = Integer.parseInt(yyyyMMdd)+i;	//int yyyy에 integer타입 오늘 날짜부터 일주일을 담았다.
				regdate.add(yyyy);						//List<Integer> regdate에 for문을 사용 yyyy(일주일 날짜)를 담았다.
			}
			for(int i=0; i<7; i++){
				String aaa=regdate.get(i).toString();	//String aaa에List<Integer>regdate를 for문을 사용 일주일을 담았다.
				date.add(aaa);							//jsp에 값을 뿌려주기 위해 List<String> date에 for문을 사용 일주일을 담았다.
			}
			
			
			
			List<PlannerDTO> list = new ArrayList<PlannerDTO>();
			List<PlannerDTO> list2 = new ArrayList<PlannerDTO>();
			list = plannerService.selectList(mid);
			/*for(int i=0; i<7; i++){
				System.out.println(list.get(i).getBreaks());
				System.out.println(list.get(i).getLunch());
				System.out.println(list.get(i).getDinner());
				System.out.println(list.get(i).getAddmenu());
			}*/
			
			
			
			/*for(int i=0; i<list.size(); i++){
				if(list.get(i).getBreaks().equals(null)){
					list.get(i).setBreaks(" ");
				}
				if(list.get(i).getLunch().equals(null)){
					list.get(i).setLunch(" ");
				}
				if(list.get(i).getDinner().equals(null)){
					list.get(i).setDinner(" ");
				}
				if(list.get(i).getAddmenu().equals(null)){
					list.get(i).setAddmenu(" ");
				}
			}*/
			
			
			int i=0;
			/*if(list.size()<7){*/
				for(String s: date){
					if(i<list.size() && s.equals(list.get(i).getRegdate())){
						list2.add(list.get(i));
						i++;
					}else{
						list2.add(plannerDTO);
					}
				}
			/*}*/
			
			/*
			 	자바에서 yyyyMMdd를 꺼내고, 그것을 db에서 가지고온 regdate(String)와 같은지 확인(if문 사용)
			 	같지 않으면 temp를 list.get(0).setRegdate(temp)담아서 세팅.
			 	결론은 자바단에서 현재날짜를 기준으로 현재날짜를 포함해서 7일간 세팅을 해서 뿌려주는 jsp파일에 전송한다.
			*/		
			
			
			model.addAttribute("date", date);
			model.addAttribute("list", list2);
			model.addAttribute("standard", yyyyMMdd); //기준날짜, 오늘날짜
		}
		
		//minus -7 계산된 날짜 세팅
		else if(kind.equals("minus")){ 
			System.out.println("minus");
			yyyy = Integer.parseInt(standard); //String standard = "20170808";
			SimpleDateFormat fomatter = new SimpleDateFormat("yyyyMMdd");
			Date date2 = (Date)fomatter.parse(standard);
			calendar.setTime(date2);
			calendar.add(Calendar.DATE, -7);
			String s = fomatter.format(calendar.getTime());
			
			
			Calendar cal = Calendar.getInstance();
			cal.setTime(calendar.getTime());
			String aaa = fomatter.format(cal.getTime());
			for(int i=1; i<=7; i++){
				date.add(aaa);
				cal.add(Calendar.DATE, 1);
				aaa = fomatter.format(cal.getTime());
			}
			model.addAttribute("standard", s);
			/*int ss = Integer.parseInt(s);
			ss = ss-7;*/
			List<PlannerDTO> minusplus= new ArrayList<PlannerDTO>();
			List<PlannerDTO> minusplus2= new ArrayList<PlannerDTO>();
			
			minusplus=plannerService.minusplusSelect(mid, s);
			
			int j=0;
			/*if(minusplus.size()<7){*/
				for(String st: date){
					if(j<minusplus.size() && st.equals(minusplus.get(j).getRegdate())){
						minusplus2.add(minusplus.get(j));
						j++;
					}else{
						minusplus2.add(plannerDTO);
					}
				}
			/*}*/
			System.out.println(minusplus2.size());
			model.addAttribute("date", date);
			model.addAttribute("list", minusplus2);
			
			
		//plus
		}else if(kind.equals("plus")){
			System.out.println("plus");
			yyyy = Integer.parseInt(standard); //String standard = "20170808";
			SimpleDateFormat fomatter = new SimpleDateFormat("yyyyMMdd");
			Date date2 = (Date)fomatter.parse(standard);
			calendar.setTime(date2);
			calendar.add(Calendar.DATE, +7);
			String s = fomatter.format(calendar.getTime());
			
			Calendar cal = Calendar.getInstance();
			cal.setTime(calendar.getTime());
			String aaa = fomatter.format(cal.getTime());
			for(int i=1; i<=7; i++){
				date.add(aaa);
				cal.add(Calendar.DATE, 1);
				aaa = fomatter.format(cal.getTime());
			}

			model.addAttribute("standard", s);
			List<PlannerDTO> minusplus= new ArrayList<PlannerDTO>();
			List<PlannerDTO> minusplus2= new ArrayList<PlannerDTO>();
			
			minusplus=plannerService.minusplusSelect(mid, s);
			
			int j=0;
			/*if(minusplus.size()<7){*/
				for(String st: date){
					if(j<minusplus.size() && st.equals(minusplus.get(j).getRegdate())){
						minusplus2.add(minusplus.get(j));
						j++;
					}else{
						minusplus2.add(plannerDTO);
					}
				}
			/*}*/
			model.addAttribute("date", date);
			model.addAttribute("list", minusplus2);
		}
			
	}
	
}
