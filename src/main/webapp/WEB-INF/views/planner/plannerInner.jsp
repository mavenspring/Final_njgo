<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row" style="margin-top: 0.8em;">
    <div class="col-xs-12">
        <div id="lPanel" class="col-xs-2" style="padding-right: 2px;">
            <div id="accordion_r" class="ui-accordion ui-widget ui-helper-reset" role="tablist">
                 <!--------------------------------------------------------------------------------------------------------------------------------------------------  -->
                <h3 pcat="byCourse" class="ui-accordion-header ui-helper-reset ui-state-default ui-corner-all ui-accordion-icons" style="border: 1px dotted black;" role="tab" id="ui-accordion-accordion-header-1" aria-controls="ui-accordion-accordion-panel-1" aria-selected="false" tabindex="-1">
                <span class="ui-accordion-header-icon ui-icon ui-icon-triangle-1-e"></span>this is Recipes</h3>
                <div class="ui-accordion-content ui-helper-reset ui-widget-content ui-corner-bottom" id="ui-accordion-accordion-panel-1" aria-labelledby="ui-accordion-accordion-header-1" role="tabpanel" aria-expanded="false" aria-hidden="true" style="display: none; height: 451px; overflow: auto;">
                    <div class="resultList" id="byCourseDiv"></div>
                </div>
                <h3 pcat="byCourse" class="ui-accordion-header ui-helper-reset ui-state-default ui-corner-all ui-accordion-icons c_1 recom" data-recom="다이어트식단" style="border: 1px dotted black;" role="tab" id="ui-accordion-accordion-header-2" aria-controls="ui-accordion-accordion-panel-1" aria-selected="false" tabindex="-1">
                <span class="ui-accordion-header-icon ui-icon ui-icon-triangle-1-e"></span>다이어트 식단</h3>
                <div class="ui-accordion-content ui-helper-reset ui-widget-content ui-corner-bottom" id="ui-accordion-accordion-panel-1" aria-labelledby="ui-accordion-accordion-header-1" role="tabpanel" aria-expanded="false" aria-hidden="true" style="display: none; height: 451px; overflow: auto;">
                    <div class="resultList" id="byCourseDiv"></div>
                </div>
                <h3 pcat="byCourse" class="ui-accordion-header ui-helper-reset ui-state-default ui-corner-all ui-accordion-icons c_2 recom" data-recom="건강한식단" style="border: 1px dotted black;" role="tab" id="ui-accordion-accordion-header-3" aria-controls="ui-accordion-accordion-panel-1" aria-selected="false" tabindex="-1">
                <span class="ui-accordion-header-icon ui-icon ui-icon-triangle-1-e"></span>건강한 식단</h3>
                <div class="ui-accordion-content ui-helper-reset ui-widget-content ui-corner-bottom" id="ui-accordion-accordion-panel-1" aria-labelledby="ui-accordion-accordion-header-1" role="tabpanel" aria-expanded="false" aria-hidden="true" style="display: none; height: 451px; overflow: auto;">
                    <div class="resultList" id="byCourseDiv"></div>
                </div>
                <h3 pcat="byCourse" class="ui-accordion-header ui-helper-reset ui-state-default ui-corner-all ui-accordion-icons c_3 recom" data-recom="균형잡힌식단" style="border: 1px dotted black;" role="tab" id="ui-accordion-accordion-header-4" aria-controls="ui-accordion-accordion-panel-1" aria-selected="false" tabindex="-1">
                <span class="ui-accordion-header-icon ui-icon ui-icon-triangle-1-e"></span>균형잡힌식단</h3>
                <div class="ui-accordion-content ui-helper-reset ui-widget-content ui-corner-bottom" id="ui-accordion-accordion-panel-1" aria-labelledby="ui-accordion-accordion-header-1" role="tabpanel" aria-expanded="false" aria-hidden="true" style="display: none; height: 451px; overflow: auto;">
                    <div class="resultList" id="byCourseDiv"></div>
                </div>
                <h3 pcat="byCourse" class="ui-accordion-header ui-helper-reset ui-state-default ui-corner-all ui-accordion-icons c_4 recom" data-recom="칼로리폭탄식단" style="border: 1px dotted black;" role="tab" id="ui-accordion-accordion-header-5" aria-controls="ui-accordion-accordion-panel-1" aria-selected="false" tabindex="-1">
                <span class="ui-accordion-header-icon ui-icon ui-icon-triangle-1-e"></span>칼로리폭탄식단</h3>
                <div class="ui-accordion-content ui-helper-reset ui-widget-content ui-corner-bottom" id="ui-accordion-accordion-panel-1" aria-labelledby="ui-accordion-accordion-header-1" role="tabpanel" aria-expanded="false" aria-hidden="true" style="display: none; height: 451px; overflow: auto;">
                    <div class="resultList" id="byCourseDiv"></div>
                </div>
                
              
               
            </div>
        </div>
        <div id="calendarTarget" class="col-xs-10" style="padding-left: 0px;">
           <table class="meal-planner-calendar"
	style="height: 300px; overflow: visible; z-index: 0;">




	<tbody style="overflow: visible;">
		<tr class="weekrow" style="height: 50px;">
			<td id="dayHeader2017-07-09"
				class="dayHeader dayBoxPast disabled dayBoxDisabled">Sunday <span
				class="dayTitle"> 1 </span>
			</td>
			<td id="dayHeader2017-07-10"
				class="dayHeader dayBoxPast disabled dayBoxDisabled">Monday <span
				class="dayTitle"> 2 </span>
			</td>
			<td id="dayHeader2017-07-11"
				class="dayHeader dayBoxPast disabled dayBoxDisabled">Tuesday <span
				class="dayTitle"> 3 </span>
			</td>
			<td id="dayHeader2017-07-12"
				class="dayHeader dayBoxPast disabled dayBoxDisabled">Wednesday
				<span class="dayTitle"> 4 </span>
			</td>
			<td id="dayHeader2017-07-13"
				class="dayHeader dayBoxPast disabled dayBoxDisabled">Thursday <span
				class="dayTitle"> 5 </span>
			</td>
			<td id="dayHeader2017-07-14" class="dayHeader today-header">
				Friday <span class="dayTitle"> 6 </span>
			</td>
			<td id="dayHeader2017-07-15" class="dayHeader">Saturday <span
				class="dayTitle"> 7 </span>
			</td>
		</tr>

		<tr class="weekrow" style="margin: 0px; clear: left; overflow: visible;">
		
		
			<c:if test="${kind == '다이어트식단'}">		
				<c:forEach var="list" items="${list}" begin="0" end="6" varStatus="i" >
					<td id="recommend"  class="dayBox dayBoxPast disabled dayBoxDisabled" style="overflow: visible; height: 220px;">
		            	<ul class="dayBoxList ui-sortable" data-mealno="1">
		            		<li id="r${4*i.index+1}" class="dt r1" rel="meal_1" data-mealno="1" style="font-size: 13px; font-weight: 700;"><i class="fa fa-circle breakfastDot"></i>아침<br><span draggable="true" ondragstart="dragSearch(event)" id="rec_${4*i.index+1}">${list.breakfast}</span><img src="/assets/images/icons/icon-note.gif" class="noteBtn" style="display: none; min-width: 16px;float: right;"></li>
		                    <li id="r${4*i.index+2}" class="dt r2" rel="meal_3" data-mealno="3" style="font-size: 13px; font-weight: 700;"><i class="fa fa-circle lunchDot"></i>점심<br><span draggable="true" ondragstart="dragSearch(event)" id="rec_${4*i.index+2}">${list.lunch}</span><img src="/assets/images/icons/icon-note.gif" class="noteBtn" style="display: none; min-width: 16px; float: right;"></li>
		                    <li id="r${4*i.index+3}" class="dt r3" rel="meal_5" data-mealno="5" style="font-size: 13px; font-weight: 700;"><i class="fa fa-circle dinnerDot"></i>저녁<br><span draggable="true" ondragstart="dragSearch(event)" id="rec_${4*i.index+3}">${list.dinner}</span><img src="/assets/images/icons/icon-note.gif" class="noteBtn" style="display: none; min-width: 16px; float: right;"></li>
		                    <li id="r${4*i.index+4}" class="dt r4" rel="meal_7" data-mealno="7" style="font-size: 13px; font-weight: 700;"><i class="fa fa-circle addmenuDot"></i>간식<br><span draggable="true" ondragstart="dragSearch(event)" id="rec_${4*(i.index+1)}">${list.addmenu}</span><img src="/assets/images/icons/icon-note.gif" class="noteBtn" style="display: none; min-width: 16px; float: right;"></li> 
		                                                   
		                </ul> 
		            </td> 
	            </c:forEach>
            </c:if>
            
            <c:if test="${kind == '건강한식단'}">	
	            <c:forEach var="list" items="${list}" begin="0" end="6" varStatus="i" >
				<td id="recommend"  class="dayBox dayBoxPast disabled dayBoxDisabled" style="overflow: visible; height: 220px;">
	            	<ul class="dayBoxList ui-sortable" data-mealno="1">
	            		<li id="r${4*7+4*i.index+1}" class="dt r1" rel="meal_1" data-mealno="1" style="font-size: 13px; font-weight: 700;"><i class="fa fa-circle breakfastDot"></i>아침<br><span draggable="true" ondragstart="dragSearch(event)" id="rec_${4*7+4*i.index+1}">${list.breakfast}</span><img src="/assets/images/icons/icon-note.gif" class="noteBtn" style="display: none; min-width: 16px;float: right;"></li>
	                    <li id="r${4*7+4*i.index+2}" class="dt r2" rel="meal_3" data-mealno="3" style="font-size: 13px; font-weight: 700;"><i class="fa fa-circle lunchDot"></i>점심<br><span draggable="true" ondragstart="dragSearch(event)" id="rec_${4*7+4*i.index+2}">${list.lunch}</span><img src="/assets/images/icons/icon-note.gif" class="noteBtn" style="display: none; min-width: 16px; float: right;"></li>
	                    <li id="r${4*7+4*i.index+3}" class="dt r3" rel="meal_5" data-mealno="5" style="font-size: 13px; font-weight: 700;"><i class="fa fa-circle dinnerDot"></i>저녁<br><span draggable="true" ondragstart="dragSearch(event)" id="rec_${4*7+4*i.index+3}">${list.dinner}</span><img src="/assets/images/icons/icon-note.gif" class="noteBtn" style="display: none; min-width: 16px; float: right;"></li>
	                    <li id="r${4*7+4*i.index+4}" class="dt r4" rel="meal_7" data-mealno="7" style="font-size: 13px; font-weight: 700;"><i class="fa fa-circle addmenuDot"></i>간식<br><span draggable="true" ondragstart="dragSearch(event)" id="rec_${4*7+4*i.index+4}">${list.addmenu}</span><img src="/assets/images/icons/icon-note.gif" class="noteBtn" style="display: none; min-width: 16px; float: right;"></li> 
	                                                   
	                </ul> 
	            </td> 
	            </c:forEach>
            </c:if>
            
            <c:if test="${kind == '균형잡힌식단'}">	
	            <c:forEach var="list" items="${list}" begin="0" end="6" varStatus="i" >
					<td id="recommend"  class="dayBox dayBoxPast disabled dayBoxDisabled" style="overflow: visible; height: 220px;">
		            	<ul class="dayBoxList ui-sortable" data-mealno="1">
		            		<li id="r${56+4*i.index+1}" class="dt r1" rel="meal_1" data-mealno="1" style="font-size: 13px; font-weight: 700;"><i class="fa fa-circle breakfastDot"></i>아침<br><span draggable="true" ondragstart="dragSearch(event)" id="rec_${56+4*i.index+1}">${list.breakfast}</span><img src="/assets/images/icons/icon-note.gif" class="noteBtn" style="display: none; min-width: 16px;float: right;"></li>
		                    <li id="r${56+4*i.index+2}" class="dt r2" rel="meal_3" data-mealno="3" style="font-size: 13px; font-weight: 700;"><i class="fa fa-circle lunchDot"></i>점심<br><span draggable="true" ondragstart="dragSearch(event)" id="rec_${56+4*i.index+2}">${list.lunch}</span><img src="/assets/images/icons/icon-note.gif" class="noteBtn" style="display: none; min-width: 16px; float: right;"></li>
		                    <li id="r${56+4*i.index+3}" class="dt r3" rel="meal_5" data-mealno="5" style="font-size: 13px; font-weight: 700;"><i class="fa fa-circle dinnerDot"></i>저녁<br><span draggable="true" ondragstart="dragSearch(event)" id="rec_${56+4*i.index+3}">${list.dinner}</span><img src="/assets/images/icons/icon-note.gif" class="noteBtn" style="display: none; min-width: 16px; float: right;"></li>
		                    <li id="r${56+4*i.index+4}" class="dt r4" rel="meal_7" data-mealno="7" style="font-size: 13px; font-weight: 700;"><i class="fa fa-circle addmenuDot"></i>간식<br><span draggable="true" ondragstart="dragSearch(event)" id="rec_${56+4*(i.index+1)}">${list.addmenu}</span><img src="/assets/images/icons/icon-note.gif" class="noteBtn" style="display: none; min-width: 16px; float: right;"></li> 
		                                                   
		                </ul> 
		            </td> 
	            </c:forEach>
            </c:if>
            
            <c:if test="${kind == '칼로리폭탄식단'}">	
	            <c:forEach var="list" items="${list}" begin="0" end="6" varStatus="i" >
					<td id="recommend"  class="dayBox dayBoxPast disabled dayBoxDisabled" style="overflow: visible; height: 220px;">
		            	<ul class="dayBoxList ui-sortable" data-mealno="1">
		            		<li id="r${84+4*i.index+1}" class="dt r1" rel="meal_1" data-mealno="1" style="font-size: 13px; font-weight: 700;"><i class="fa fa-circle breakfastDot"></i>아침<br><span draggable="true" ondragstart="dragSearch(event)" id="rec_${84+4*i.index+1}">${list.breakfast}</span><img src="/assets/images/icons/icon-note.gif" class="noteBtn" style="display: none; min-width: 16px;float: right;"></li>
		                    <li id="r${84+4*i.index+2}" class="dt r2" rel="meal_3" data-mealno="3" style="font-size: 13px; font-weight: 700;"><i class="fa fa-circle lunchDot"></i>점심<br><span draggable="true" ondragstart="dragSearch(event)" id="rec_${84+4*i.index+2}">${list.lunch}</span><img src="/assets/images/icons/icon-note.gif" class="noteBtn" style="display: none; min-width: 16px; float: right;"></li>
		                    <li id="r${84+4*i.index+3}" class="dt r3" rel="meal_5" data-mealno="5" style="font-size: 13px; font-weight: 700;"><i class="fa fa-circle dinnerDot"></i>저녁<br><span draggable="true" ondragstart="dragSearch(event)" id="rec_${84+4*i.index+3}">${list.dinner}</span><img src="/assets/images/icons/icon-note.gif" class="noteBtn" style="display: none; min-width: 16px; float: right;"></li>
		                    <li id="r${84+4*i.index+4}" class="dt r4" rel="meal_7" data-mealno="7" style="font-size: 13px; font-weight: 700;"><i class="fa fa-circle addmenuDot"></i>간식<br><span draggable="true" ondragstart="dragSearch(event)" id="rec_${84+4*(i.index+1)}">${list.addmenu}</span><img src="/assets/images/icons/icon-note.gif" class="noteBtn" style="display: none; min-width: 16px; float: right;"></li> 
		                                                   
		                </ul> 
		            </td> 
	            </c:forEach>
            </c:if>
		</tr>
	</tbody>
</table>
           </div></div>
</div>

<script type="text/javascript">
	$('.recom').click(function(){
		var kind = $(this).attr('data-recom');
		select(kind);
	});
	 function dragSearch(event) {
			
			
			event.dataTransfer.setData("text",event.target.id);
}


function dropSearch(ev) {
	ev.preventDefault();
	var data = ev.dataTransfer.getData("text");
/* 	ev.target.append(document.getElementById(data)); */
 	/* $('#'+data).prepend('<br>');  */
	$('#'+data).appendTo("#"+ev.target.id);
 	$('#'+ev.target.id+">span").removeAttr('id');
}

function allowDrop(ev) {
	ev.preventDefault();
} 

	
	function select(kind){
		if(kind =='다이어트식단'){
			$.ajax({
				type:'GET',
				url:'recommend',
				data:{kind:kind},
				success : function(data) {
					$('.container-bottom').html(data);
					$('.c_1').css("color", "#ffcc00");
				}
			});	
		}else if(kind == '건강한식단'){
			$.ajax({
				type:'GET',
				url:'recommend',
				data:{kind:kind},
				success : function(data) {
					$('.container-bottom').html(data);
					$('.c_2').css("color", "#ffcc00");
				}
			});	
		}else if(kind == '균형잡힌식단'){
			$.ajax({
				type:'GET',
				url:'recommend',
				data:{kind:kind},
				success : function(data) {
					$('.container-bottom').html(data);
					$('.c_3').css("color", "#ffcc00");
				}
			});	
		}else{
			$.ajax({
				type:'GET',
				url:'recommend',
				data:{kind:kind},
				success : function(data) {
					$('.container-bottom').html(data);
					$('.c_4').css("color", "#ffcc00");
				}
			});	
		}
	};
	/* $(function(){
		$("#recommend li span").draggable({
			start: function(event,ui) {
				$(this).draggable( "option", "revert", true );
				$("#recommend li span").css("zIndex",10);
				$(this).css("zIndex",100);
				$(this).css('display','block');
				$(this).attr('id','recipecard');
			}
		});
		$("#recommend> ul>li").droppable({
			drop: function(event,ui) {
				var droptitle = $(this).attr("title");
				var drophtml = $(this).html();
				var dragid = ui.draggable.attr("id");
				if( dragid == droptitle ) {
					ui.draggable.draggable( "option", "revert", false );
					var droppableOffset = $(this).offset();
					var x = droppableOffset.left + 0;
					var y = droppableOffset.top + 17;
					ui.draggable.offset({ top: y, left: x });
				}
			
			}
		});
	});  */
	

</script>
