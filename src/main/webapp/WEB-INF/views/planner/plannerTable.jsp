<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 1주일전, 1주일후 -->
	<span id="button_previous" class="css_arrow_left" style="cursor: pointer;"></span>
	<span id="button_next" class="css_arrow_right" style="cursor: pointer;"></span>
	
<form id="frm" action="${pageContext.request.contextPath}/planner/plannerWrite" method="post"><!-- enctype="multipart/form-data" -->
        
<table class="meal-planner-calendar" style="height: 300px; overflow: visible; z-index: 0;">

    <tbody style="overflow: visible;">
        <tr class="weekrow" style="height: 50px;">
        <fmt:parseDate var="date0" pattern="yyyyMMdd" value="${date[0]}"/>
        <fmt:parseDate var="date1" pattern="yyyyMMdd" value="${date[1]}"/>
        <fmt:parseDate var="date2" pattern="yyyyMMdd" value="${date[2]}"/>
        <fmt:parseDate var="date3" pattern="yyyyMMdd" value="${date[3]}"/>
        <fmt:parseDate var="date4" pattern="yyyyMMdd" value="${date[4]}"/>
        <fmt:parseDate var="date5" pattern="yyyyMMdd" value="${date[5]}"/>
        <fmt:parseDate var="date6" pattern="yyyyMMdd" value="${date[6]}"/>
        <fmt:formatDate value="${date0}" pattern="MM" var="chMonth" />
        <fmt:formatDate value="${date0}" pattern="yyyy" var="chYear" />
        
        <fmt:formatDate value="${date0}" pattern="yyyyMMdd" var="chAll0" />
        <fmt:formatDate value="${date1}" pattern="yyyyMMdd" var="chAll1" />
        <fmt:formatDate value="${date2}" pattern="yyyyMMdd" var="chAll2" />
        <fmt:formatDate value="${date3}" pattern="yyyyMMdd" var="chAll3" />
        <fmt:formatDate value="${date4}" pattern="yyyyMMdd" var="chAll4" />
        <fmt:formatDate value="${date5}" pattern="yyyyMMdd" var="chAll5" />
        <fmt:formatDate value="${date6}" pattern="yyyyMMdd" var="chAll6" />
        
        
    	<c:forEach items="${date}" var="dd" varStatus="count" >
                <td id="dayHeader${count}" class="dayHeader dayBoxPast disabled dayBoxDisabled">										

                		<fmt:parseDate var="date" pattern="yyyyMMdd" value="${dd}"/>
                		<%-- <fmt:formatDate value="${date}" pattern="MM" var="chMonth" /> --%>
                    	<fmt:formatDate value="${date}" pattern="dd" var="chDate"/>
                    	<fmt:formatDate value="${date}" pattern="E" var="chDay"/>
                    	<%-- <input type="hidden" value="${chMonth}" id="date${count.index+1}"> --%>
                    	${chDay}요일
                    <span class="dayTitle">
                    	${chDate}
                    </span>
                    
                </td>
		</c:forEach>
        </tr>

        <tr class="weekrow" style="margin: 0px; clear: left; overflow: visible;">						
        
            <td id="recommend" class="dayBox dayBoxPast disabled dayBoxDisabled" style="overflow: visible; height: 220px; max-width: 128px;">
                <ul class="dayBoxList ui-sortable" data-mealno="1">
                    <input type="hidden" class="regdate" name="regdate" value="${chAll0}">
                    <input type="hidden" class="mid" name="mid" value="${memberDTO.nickName}">
                   
                    <li id="loc1" ondrop="dropSearch(event)" ondragover="allowDrop(event)" title="recipecard" class="dt break1" rel="meal_1" data-mealno="1" style=" font-size: 13px; font-weight: 700; height: 53px;"><i class="fa fa-circle breakfastDot" style="font-weight: 700">아침</i>${list[0].breaks}</li>                              
                                      	
                    	<!-- <span id="loc" style="border: 1px solid black; width: 30px; height: 15px;" title="food"></span> -->
                    	<span id="p_break1" class="break1"></span>
                    	<input type="text" name="breaks" id="break1" class="break01" style="display: none; width:132px; margin-right: -62px; height: 20px;">
          	
                    <li id="loc2" ondrop="dropSearch(event)" ondragover="allowDrop(event)" title="recipecard" class="dt lunch1" rel="meal_3" data-mealno="3" style="font-size: 13px; font-weight: 700; height: 53px;"><i class="fa fa-circle lunchDot" style="font-weight: 700">점심</i>${list[0].lunch}</li>
                    	<span id="p_lunch1" title="food" class="lunch1"></span>
                    	<input type="text" name="lunch" id="lunch1" style="display: none; width: 132px;margin-right: -62px; height: 20px;" >
                    	
                    <li id="loc3" ondrop="dropSearch(event)" ondragover="allowDrop(event)" title="recipecard" class="dt dinner1" rel="meal_5" data-mealno="5" style="font-size: 13px; font-weight: 700; height: 53px;"><i class="fa fa-circle dinnerDot" style="font-weight: 700">저녁</i>${list[0].dinner}</li>
                    	<span id="p_dinner1" title="food" class="dinner1"></span>
                    	<input type="text" name="dinner" id="dinner1" style="display: none; width: 132px;margin-right: -62px; height: 20px;">
                    	
                    <li  id="loc4" ondrop="dropSearch(event)" ondragover="allowDrop(event)" title="recipecard" class="dt add1" rel="meal_7" data-mealno="7" style="font-size: 13px; font-weight: 700; height: 53px;"><i class="fa fa-circle addmenuDot" style="font-weight: 700">간식</i>${list[0].addmenu}</li>                                
                 		<span id="p_add1" title="food" class="add1"></span>
                 		<input type="text" name="add" id="add1" style="display: none; width: 132px;margin-right: -62px; height: 20px;">
                 </ul> 
            </td> 
            <td id="recommend" class="dayBox dayBoxPast disabled dayBoxDisabled" style="overflow: visible; height: 220px; max-width: 128px;">
                <ul class="dayBoxList ui-sortable" data-mealno="1">
                 <input type="hidden" class="regdate" name="regdate" value="${chAll1}">
                   
                    <li id="loc5" ondrop="dropSearch(event)" ondragover="allowDrop(event)" title="recipecard" class="dt break2" rel="meal_1" data-mealno="1" style=" font-size: 13px; font-weight: 700; height: 53px;"><i class="fa fa-circle breakfastDot" style="font-weight: 700">아침</i>${list[1].breaks}</li>                              
                                      	
                    	<span id="p_break2" class="break2"></span>
                    	<input type="text" name="breaks" id="break2" style="display: none; width:132px; margin-right: -62px; height: 20px;">
          	
                    <li id="loc6" ondrop="dropSearch(event)" ondragover="allowDrop(event)" title="recipecard" class="dt lunch2" rel="meal_3" data-mealno="3" style="font-size: 13px; font-weight: 700; height: 53px;"><i class="fa fa-circle lunchDot"style="font-weight: 700">점심</i>${list[1].lunch}</li>
                    	<span id="p_lunch2" title="food" class="lunch2"></span>
                    	<input type="text" name="lunch" id="lunch2" style="display: none; width: 132px;margin-right: -62px; height: 20px;" >
                    	
                    <li id="loc7" ondrop="dropSearch(event)" ondragover="allowDrop(event)" title="recipecard" class="dt dinner2" rel="meal_5" data-mealno="5" style="font-size: 13px; font-weight: 700; height: 53px;"><i class="fa fa-circle dinnerDot"style="font-weight: 700">저녁</i>${list[1].dinner}</li>
                    	<span id="p_dinner2" title="food" class="dinner2"></span>
                    	<input type="text" name="dinner" id="dinner2" style="display: none; width: 132px;margin-right: -62px; height: 20px;">
                    	
                    <li  id="loc8" ondrop="dropSearch(event)" ondragover="allowDrop(event)" title="recipecard" class="dt add2" rel="meal_7" data-mealno="7" style="font-size: 13px; font-weight: 700; height: 53px;"><i class="fa fa-circle addmenuDot"style="font-weight: 700">간식</i>${list[1].addmenu}</li>                                
                 		<span id="p_add2" title="food" class="add2"></span>
                 		<input type="text" name="add" id="add2" style="display: none; width: 132px;margin-right: -62px; height: 20px;">
                 </ul> 
            </td> 
             <td id="recommend" class="dayBox dayBoxPast disabled dayBoxDisabled" style="overflow: visible; height: 220px; max-width: 128px;">
                <ul class="dayBoxList ui-sortable" data-mealno="1">
                 <input type="hidden" class="regdate" name="regdate" value="${chAll2}">
                   
                    <li id="loc9" ondrop="dropSearch(event)" ondragover="allowDrop(event)" title="recipecard" class="dt break3" rel="meal_1" data-mealno="1" style=" font-size: 13px; font-weight: 700; height: 53px;"><i class="fa fa-circle breakfastDot"style="font-weight: 700">아침</i>${list[2].breaks}</li>                              
                                      	
                    	<span id="p_break3" class="break3"></span>
                    	<input type="text" name="breaks" id="break3" style="display: none; width:132px; margin-right: -62px; height: 20px;">
          	
                    <li id="loc10" ondrop="dropSearch(event)" ondragover="allowDrop(event)" title="recipecard" class="dt lunch3" rel="meal_3" data-mealno="3" style="font-size: 13px; font-weight: 700; height: 53px;"><i class="fa fa-circle lunchDot"style="font-weight: 700">점심</i>${list[2].lunch}</li>
                    	<span id="p_lunch3" title="food" class="lunch3"></span>
                    	<input type="text" name="lunch" id="lunch3" style="display: none; width: 132px;margin-right: -62px; height: 20px;" >
                    	
                    <li id="loc11" ondrop="dropSearch(event)" ondragover="allowDrop(event)" title="recipecard" class="dt dinner3" rel="meal_5" data-mealno="5" style="font-size: 13px; font-weight: 700; height: 53px;"><i class="fa fa-circle dinnerDot"style="font-weight: 700">저녁</i>${list[2].dinner}</li>
                    	<span id="p_dinner3" title="food" class="dinner3"></span>
                    	<input type="text" name="dinner" id="dinner3" style="display: none; width: 132px;margin-right: -62px; height: 20px;">
                    	
                    <li  id="loc12" ondrop="dropSearch(event)" ondragover="allowDrop(event)" title="recipecard" class="dt add3" rel="meal_7" data-mealno="7" style="font-size: 13px; font-weight: 700; height: 53px;"><i class="fa fa-circle addmenuDot"style="font-weight: 700">간식</i>${list[2].addmenu}</li>                                
                 		<span id="p_add3" title="food" class="add3"></span>
                 		<input type="text" name="add" id="add3" style="display: none; width: 132px;margin-right: -62px; height: 20px;">
                 </ul> 
            </td> 
             <td id="recommend" class="dayBox dayBoxPast disabled dayBoxDisabled" style="overflow: visible; height: 220px; max-width: 128px;">
                <ul class="dayBoxList ui-sortable" data-mealno="1">
                 <input type="hidden" class="regdate" name="regdate" value="${chAll3}">
                   
                    <li id="loc13" ondrop="dropSearch(event)" ondragover="allowDrop(event)" title="recipecard" class="dt break4" rel="meal_1" data-mealno="1" style=" font-size: 13px; font-weight: 700; height: 53px;"><i class="fa fa-circle breakfastDot" style="font-weight: 700">아침</i>${list[3].breaks}</li>                                                           
                              	
                    	<span id="p_break4" class="break4"></span>
                    	<input type="text" name="breaks" id="break4" style="display: none; width:132px; margin-right: -62px; height: 20px;">
          	
                    <li id="loc14" ondrop="dropSearch(event)" ondragover="allowDrop(event)" title="recipecard" class="dt lunch4" rel="meal_3" data-mealno="3" style="font-size: 13px; font-weight: 700; height: 53px;"><i class="fa fa-circle lunchDot"style="font-weight: 700">점심</i>${list[3].lunch}</li>
                    	<span id="p_lunch4" title="food" class="lunch4"></span>
                    	<input type="text" name="lunch" id="lunch4" style="display: none; width: 132px;margin-right: -62px; height: 20px;" >
                    	
                    <li id="loc15" ondrop="dropSearch(event)" ondragover="allowDrop(event)" title="recipecard" class="dt dinner4" rel="meal_5" data-mealno="5" style="font-size: 13px; font-weight: 700; height: 53px;"><i class="fa fa-circle dinnerDot"style="font-weight: 700">저녁</i>${list[3].dinner}</li>
                    	<span id="p_dinner4" title="food" class="dinner4"></span>
                    	<input type="text" name="dinner" id="dinner4" style="display: none; width: 132px;margin-right: -62px; height: 20px;">
                    	
                    <li  id="loc16" ondrop="dropSearch(event)" ondragover="allowDrop(event)" title="recipecard" class="dt add4" rel="meal_7" data-mealno="7" style="font-size: 13px; font-weight: 700; height: 53px;"><i class="fa fa-circle addmenuDot"style="font-weight: 700">간식</i>${list[3].addmenu}</li>                                
                 		<span id="p_add4" title="food" class="add4"></span>
                 		<input type="text" name="add" id="add4" style="display: none; width: 132px;margin-right: -62px; height: 20px;">
                 </ul> 
            </td> 
             <td id="recommend" class="dayBox dayBoxPast disabled dayBoxDisabled" style="overflow: visible; height: 220px; max-width: 128px;">
                <ul class="dayBoxList ui-sortable" data-mealno="1">
                 <input type="hidden" class="regdate" name="regdate" value="${chAll4}">
                    <li id="loc17" ondrop="dropSearch(event)" ondragover="allowDrop(event)" title="recipecard" class="dt break5" rel="meal_1" data-mealno="1" style=" font-size: 13px; font-weight: 700; height: 53px;"><i class="fa fa-circle breakfastDot"style="font-weight: 700">아침</i>${list[4].breaks}</li>                              
                                      	
                    	<span id="p_break5" class="break5"></span>
                    	<input type="text" name="breaks" id="break5" style="display: none; width:132px; margin-right: -62px; height: 20px;">
          	
                    <li id="loc18" ondrop="dropSearch(event)" ondragover="allowDrop(event)" title="recipecard" class="dt lunch5" rel="meal_3" data-mealno="3" style="font-size: 13px; font-weight: 700; height: 53px;"><i class="fa fa-circle lunchDot"style="font-weight: 700">점심</i>${list[4].lunch}</li>
                    	<span id="p_lunch5" title="food" class="lunch5"></span>
                    	<input type="text" name="lunch" id="lunch5" style="display: none; width: 132px;margin-right: -62px; height: 20px;" >
                    	
                    <li id="loc19" ondrop="dropSearch(event)" ondragover="allowDrop(event)" title="recipecard" class="dt dinner5" rel="meal_5" data-mealno="5" style="font-size: 13px; font-weight: 700; height: 53px;"><i class="fa fa-circle dinnerDot"style="font-weight: 700">저녁</i>${list[4].dinner}</li>
                    	<span id="p_dinner5" title="food" class="dinner5"></span>
                    	<input type="text" name="dinner" id="dinner5" style="display: none; width: 132px;margin-right: -62px; height: 20px;">
                    	
                    <li  id="loc20" ondrop="dropSearch(event)" ondragover="allowDrop(event)" title="recipecard" class="dt add5" rel="meal_7" data-mealno="7" style="font-size: 13px; font-weight: 700; height: 53px;"><i class="fa fa-circle addmenuDot"style="font-weight: 700">간식</i>${list[4].addmenu}</li>                                
                 		<span id="p_add5" title="food" class="add5"></span>
                 		<input type="text" name="add" id="add5" style="display: none; width: 132px;margin-right: -62px; height: 20px;">
                 </ul> 
            </td> 
             <td id="recommend" class="dayBox dayBoxPast disabled dayBoxDisabled" style="overflow: visible; height: 220px; max-width: 128px;">
                <ul class="dayBoxList ui-sortable" data-mealno="1">
                 <input type="hidden" class="regdate" name="regdate" value="${chAll5}">
                   
                    <li id="loc21" ondrop="dropSearch(event)" ondragover="allowDrop(event)" title="recipecard" class="dt break6" rel="meal_1" data-mealno="1" style=" font-size: 13px; font-weight: 700; height: 53px;"><i class="fa fa-circle breakfastDot"style="font-weight: 700">아침</i>${list[5].breaks}</li>                              
                                      	
                    	<span id="p_break6" class="break6"></span>
                    	<input type="text" name="breaks" id="break6" style="display: none; width:132px; margin-right: -62px; height: 20px;">
          	
                    <li id="loc22" ondrop="dropSearch(event)" ondragover="allowDrop(event)" title="recipecard" class="dt lunch6" rel="meal_3" data-mealno="3" style="font-size: 13px; font-weight: 700; height: 53px;"><i class="fa fa-circle lunchDot"style="font-weight: 700">점심</i>${list[5].lunch}</li>
                    	<span id="p_lunch6" title="food" class="lunch6"></span>
                    	<input type="text" name="lunch" id="lunch6" style="display: none; width: 132px;margin-right: -62px; height: 20px;" >
                    	
                    <li id="loc23" ondrop="dropSearch(event)" ondragover="allowDrop(event)" title="recipecard" class="dt dinner6" rel="meal_5" data-mealno="5" style="font-size: 13px; font-weight: 700; height: 53px;"><i class="fa fa-circle dinnerDot"style="font-weight: 700">저녁</i>${list[5].dinner}</li>
                    	<span id="p_dinner6" title="food" class="dinner6"></span>
                    	<input type="text" name="dinner" id="dinner6" style="display: none; width: 132px;margin-right: -62px; height: 20px;">
                    	
                    <li  id="loc24" ondrop="dropSearch(event)" ondragover="allowDrop(event)" title="recipecard" class="dt add6" rel="meal_7" data-mealno="7" style="font-size: 13px; font-weight: 700; height: 53px;"><i class="fa fa-circle addmenuDot"style="font-weight: 700">간식</i>${list[5].addmenu}</li>                                
                 		<span id="p_add6" title="food" class="add6"></span>
                 		<input type="text" name="add" id="add6" style="display: none; width: 132px;margin-right: -62px; height: 20px;">
                 </ul> 
            </td> 
             <td id="recommend" class="dayBox dayBoxPast disabled dayBoxDisabled" style="overflow: visible; height: 220px; max-width: 128px;">
                <ul class="dayBoxList ui-sortable" data-mealno="1">
                 <input type="hidden" class="regdate" name="regdate" value="${chAll6}">
                   
                    <li id="loc25" ondrop="dropSearch(event)" ondragover="allowDrop(event)" title="recipecard" class="dt break7" rel="meal_1" data-mealno="1" style=" font-size: 13px; font-weight: 700; height: 53px;"><i class="fa fa-circle breakfastDot"style="font-weight: 700">아침</i>${list[6].breaks}</li>                              
                                      	
                    	<span id="p_break7" class="break7"></span>
                    	<input type="text" name="breaks" id="break7" style="display: none; width:132px; margin-right: -62px; height: 20px;">
          	
                    <li id="loc26" ondrop="dropSearch(event)" ondragover="allowDrop(event)" title="recipecard" class="dt lunch7" rel="meal_3" data-mealno="3" style="font-size: 13px; font-weight: 700; height: 53px;"><i class="fa fa-circle lunchDot"style="font-weight: 700">점심</i>${list[6].lunch}</li>
                    	<span id="p_lunch7" title="food" class="lunch7"></span>
                    	<input type="text" name="lunch" id="lunch7" style="display: none; width: 132px;margin-right: -62px; height: 20px;" >
                    	
                    <li id="loc27" ondrop="dropSearch(event)" ondragover="allowDrop(event)" title="recipecard" class="dt dinner7" rel="meal_5" data-mealno="5" style="font-size: 13px; font-weight: 700; height: 53px;"><i class="fa fa-circle dinnerDot"style="font-weight: 700">저녁</i>${list[6].dinner}</li>
                    	<span id="p_dinner7" title="food" class="dinner7"></span>
                    	<input type="text" name="dinner" id="dinner7" style="display: none; width: 132px;margin-right: -62px; height: 20px;">
                    	
                    <li  id="loc28" ondrop="dropSearch(event)" ondragover="allowDrop(event)" title="recipecard" class="dt add7" rel="meal_7" data-mealno="7" style="font-size: 13px; font-weight: 700; height: 53px;"><i class="fa fa-circle addmenuDot"style="font-weight: 700">간식</i>${list[6].addmenu}</li>                                
                 		<span id="p_add7" title="food" class="add7"></span>
                 		<input type="text" name="add" id="add7" style="display: none; width: 132px;margin-right: -62px; height: 20px;">
                    </ul> 
               </td> 
               
                         

           </tr>
       </tbody>                 
</table>
</form>
	<script>
	
	var year = '${chYear}';
	var month = '${chMonth}';
	var stand = year + "년 " + month +"월";
	$(".nowDate").html(stand);
	
		/* 1주일전 ajax */
		var mid = '${memberDTO.nickName}';
		$('.css_arrow_left').click(function () {
			var standard = '${standard}';
			var kind = 'minus';
			$.ajax({
				type:'GET',
				url:'plannerTable',
				data:{standard:standard, mid:mid, kind:kind},
				success :  function(data){
					$('#calendarTarget').html(data);
					
				}
			});
		});
		/* 1주일후 ajax */
		$('.css_arrow_right').click(function () {
			var standard = '${standard}';
			var kind = 'plus';
			$.ajax({
				type:'GET',
				url:'plannerTable',
				data:{standard:standard, mid:mid, kind:kind},
				success :  function(data){
					$('#calendarTarget').html(data);
				}
			});
		});
		
		/*  ******************************************************************************************/

		
		
		/*******************************************************************************************  */
		//class 추가 : $('#recipecard').addClass("aaa");
		//부모의 class 가져오기 : $(this).closest('li').attr('class')
		
		
		
		$('#mealplan-save').click(function() {
			$('.fa-circle').remove();
			$('.span').remove();
			for(var i=1; i<8; i++){
				$('#break'+i).val($('.break'+i).html());		
				$('#lunch'+i).val($('.lunch'+i).html());		
				$('#dinner'+i).val($('.dinner'+i).html());		
				$('#add'+i).val($('.add'+i).html());
			}
			
			$("#frm").submit();
		});
		
		var aaa='<span class="span" style="color: red; margin:0 5px 0 5px; cursor:pointer">x</span>';
		for(var i=1; i<29; i++){
			$("#loc"+i+"> i").text(function(){
				$(this).append("<span class='span'"+i+" style='color: red; margin:0 0 0 5px; cursor:pointer;' onclick='name("+i+")'>x&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>");	
			});
			
		}
		function name(data) {
			$('#loc'+data+'> span').remove();
			$('#loc'+data+'> div').remove();
		}
	
		
		
		
		
		
		
		
		
		
		
		
	
	</script>
             