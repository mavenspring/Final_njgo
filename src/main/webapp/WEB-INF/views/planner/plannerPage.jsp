<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../resources/css/common/reset.css">
<c:import url="../tmp/Bootstrap.jsp"/>
<link rel="stylesheet" href="../resources/css/common/basic.css">
<link rel="stylesheet" href="../resources/css/wdh/plannerList.css">
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/wdh/planner.js"></script> --%>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<title>Insert title here</title>
<style type="text/css">
.recipePick3 .tt-menu .tt-dataset{
    width: 160px;
	max-height: 124px;
	
}
#recipecard{
	width: 133.33px;
	max-height:124px;
	height: 35px;
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
}
.recipecard-image{
	float: left;
	width: 35px;
	height: 35px;
}
.recipecard-image> img{
	float: left;
	width: 35px;
	height: 35px;
}
.recipetitle{
	float: left;
	width: 98.33px;
	height: 35px;
	margin-left: -5px;
	width: 100%;
	margin-left: 1px; 
	padding-top:0px;
}
.recipetitle a{
	color: black; 
	text-decoration: none; 
	font-weight: 700; 
	margin-top: 10px; 
	overflow: hidden; 
	text-overflow: ellipsis; 
	white-space: nowrap; 
	float: left; 
	width: 70%; 
	text-align: left;
}
#p_break1 {width:50px; height:50px; clear:both;}
#recommend li span, #recipecard{
	cursor: pointer;
}
/* ul>li{
	height: 50px;
} */
.css_arrow_right {
    display: inline-block;
    position: absolute;
    margin: 0 0 0 0px;
    padding: 0;
    width: 0;
    height: 0;
    border: 10px solid transparent;
    border-left-color: #d9d9d9;
}
.css_arrow_right:before, .css_arrow_right:after {
    display: block;
    content: "";
    position: absolute;
    top: 0;
    width: 0;
    height: 0;
}
.css_arrow_right:before {
    left: -30px;
    margin-top: -10px;
    border: 10px solid transparent;
    border-right-color: #d9d9d9;
}
.css_arrow_right:after {
    left: -20px;
    margin-top: -14px;
    border: 14px solid transparent;
    border-left-color: white;
}
.css_arrow_left {
    display: inline-block;
    position: absolute;
    margin: 0 0 0 8px;
    padding: 0;
    width: 0;
    height: 0;
    border: 10px solid transparent;
    border-left-color: #d9d9d9;
}
.css_arrow_left:before, .css_arrow_left:after {
    display: block;
    content: "";
    position: absolute;
    top: 0;
    width: 0;
    height: 0;
}
.css_arrow_left:before {
    left: -30px;
    margin-top: -10px;
    border: 10px solid transparent;
    border-right-color: #d9d9d9;
}
.css_arrow_left:after {
    left: -28px;
    margin-top: -14px;
    border: 14px solid transparent;
    border-right-color: white;
}
#button_previous{
   background-position: 0 -360px;
    left: -155px;
    top: 134px;
    margin-left: -32px;
}
#button_next{
   background-position: -36px -360px;
    right: -16px;
    top: 142px;
    margin-left: 1133px;
}
/* css화살표 끝 */
</style>
</head>
<body>
	<c:import url="../tmp/header.jsp" />
	<!-- section  -->
		<section class="main_section">
		<h1 style="font-weight: 900; margin-left: 27px; padding-bottom: 5px; margin-bottom:0px;"><a href="./plannerPage" style="color: black; text-decoration: none;">planner</a></h1>
			<div class="wrapper" style="width: 1150px;">
			
    <div>
    <ol class="planner-menu">
        <li class="pull-left navCommand">
            <div id="cal-nav">
                <!-- <span class="btn btn-default btn-xs btnstateless" style="float: left;position:relative;top:4px;">
                    <a href="/plan?startDay=7%2f7%2f2017"><i class="fa fa-angle-left"></i></a>
                </span> -->
                <span style="float: left; ">
                <jsp:useBean id="toDay" class="java.util.Date"/>
                <fmt:formatDate value="${toDay}" pattern="yyyy년 MM월" var="nowDate"/>
                    <span style="float: left; margin-left: 1em; font-weight: bold;" class="nowDate">${nowDate}</span>
                </span>
               <!--  <span class="btn btn-xs btn-default btnstateless" style="float: left; margin-left: 1em;position:relative;top:4px;">
                    <a href="/plan?startDay=7%2f21%2f2017"><i class="fa fa-angle-right"></i></a>
                </span> -->
            </div>

        </li>
        <li class="pull-left" style="display: none;">
            <span style="margin-left:1em;"><a href="javascript:void(0);" onclick="gotoDate();"><i class="fa fa-calendar"></i></a> </span>
        </li>

        <li class="pull-right navCommand">
            <span id="saving-message">Saving</span><span class="unsaved-changes">unsaved changes</span>
            <input id="mealplan-save" type="button" style="margin:0px 20px 2px 10px;" class="btn btn-xs btn-warning" data-loading-text="saving..." value="Save">
        </li>
        
    </ol>

    </div>
   <!--------------------------------------------------------------------------------------------------------------------------------------------------  -->
   <div class="container-top" style=" padding: 0px 0px 0px 0px; max-width: 100%;">


<div class="row" style="margin-top: 0.8em;">
    <div class="col-xs-12">
        <div id="lPanel" class="col-xs-2" style="padding-right: 2px;">
            <div id="accordion" class="ui-accordion ui-widget ui-helper-reset" role="tablist">
                <h3 rel="find" class="ui-accordion-header ui-helper-reset ui-state-default ui-accordion-header-active ui-state-active ui-corner-top ui-accordion-icons" role="tab" id="ui-accordion-accordion-header-0" aria-controls="ui-accordion-accordion-panel-0" aria-selected="true" tabindex="0"><span class="ui-accordion-header-icon ui-icon ui-icon-triangle-1-s"></span>Find Recipe</h3>
                <div style="text-align: center; display: block; height: 244px;" class=" ui-helper-reset ui-widget-content ui-corner-bottom ui-accordion-content-active" id="ui-accordion-accordion-panel-0" aria-labelledby="ui-accordion-accordion-header-0" role="tabpanel" aria-expanded="true" aria-hidden="false">
                    <div class="recipePick3">
                        <div id="theControl">
                        	<div id="filterDiv" style="clear:both;">
                        	
                        		<label id="myRecipesRB" class="lbl-tiny">
                        		<!-- 선택자 내레시피, 전체 -->
                        			<input class="radio1" type="radio" name="filter" checked="" value="mine">내 레시피</label>
                        			
                        				<label class="lbl-tiny" style="margin-left:20px;">
                        				
                        					<input class="radio1" type="radio" name="filter" value="all">전체</label>
                        					
                        		<!-- 선택자 내레시피, 전체 -->
                        	</div>
                        </div>
                   
                        	<span class="twitter-typeahead" style="position: relative; display: inline-block;">
                        		<input class="rPicker typeahead rPickerTB tt-hint" style="overflow: visible; max-width: 150px; font-size: 14px; position: absolute; top: 0px; left: 0px; border-color: transparent; box-shadow: none; opacity: 1; background: none 0% 0% / auto repeat scroll padding-box border-box rgb(255, 255, 255);" type="text" readonly="" autocomplete="off" spellcheck="false" tabindex="-1" dir="ltr">
                        		
                        		
                        		<input class="rPicker typeahead rPickerTB tt-input" style="overflow: visible;  width: 150px; 
                        		font-size: 14px; position: relative; vertical-align: top; background-color: transparent;" type="text" 
                        		id="rPicker" placeholder="Title" spellcheck="false" dir="auto" autocomplete="on">	
                        		
                     			<div id="tt-menu" class="tt-menu" style="position: absolute; top: 100%; left: 0px; z-index: 10; float: left; height: 100%; display: block;">
                        		
                        			<div id="tt-dataset" class="tt-dataset">
                        			
                        			</div>
                        		</div>
                     		             			
                        	</span>
                                                	                       	                      		                                                                    	                
                    </div>
                </div>
                 <!--------------------------------------------------------------------------------------------------------------------------------------------------  -->
                <h3 pcat="byCourse" class="ui-accordion-header ui-helper-reset ui-state-default ui-corner-all ui-accordion-icons" style="border: 1px dotted black;" role="tab" id="ui-accordion-accordion-header-9" aria-controls="ui-accordion-accordion-panel-1" aria-selected="false" tabindex="-1">
                <span class="ui-accordion-header-icon ui-icon ui-icon-triangle-1-e"></span>사이트 추천 레시피</h3>
                <div class="ui-accordion-content ui-helper-reset ui-widget-content ui-corner-bottom" id="ui-accordion-accordion-panel-1" aria-labelledby="ui-accordion-accordion-header-1" role="tabpanel" aria-expanded="false" aria-hidden="true" style="display: none; height: 451px; overflow: auto;">
                    <div class="resultList" id="byCourseDiv"></div>
                </div>
                
              
               
            </div>
        </div>
        <!-- table 영역 -->
        <div id="calendarTarget" class="col-xs-10" style="padding-left: 0px;">
        
        
		</div>
</div>
</div></div>

<div class="container-bottom" style="padding: 0px 0px 0px 0px; max-width: 100%; display: none; ">
</div>
</div>

</section>
	<c:import url="../tmp/footer.jsp" />
<script type="text/javascript">
	if('${memberDTO}' == ''){
		alert("로그인이 필요한 서비스입니다.");
		location.href = "${pageContext.request.contextPath}/member/login";
	}
	$('#ui-accordion-accordion-header-9').click(function() {		
		var kind='다이어트식단';
		/* location.href="recommend?kind="+kind; */
		$.ajax({
			type:'GET',
			url:'recommend',
			data:{kind:kind},
			success : function(data) {
				$('.container-bottom').html(data);
				$('.container-bottom').css("display", "block");
				$('.c_1').css("color", "#ffcc00");
				$('#ui-accordion-accordion-header-9').css("display","none");
				$('#ui-accordion-accordion-panel-0').css("height", "244px");
			}
		});
	});
	/************************************************************************/
	
	$('#mealplan-save').click(function() {
		
		$("#frm").submit();
	});
	
	$('#rPicker').keyup(function (){
		var search = $(':radio[name="filter"]:checked').val();
		var foodname = $('#rPicker').val();
		var writer = '${memberDTO.nickName}';
		if(foodname != ''){
			$.ajax({
				type:'GET',
				url:'plannerSearch',
				data:{search:search, foodname:foodname, writer:writer},
				success : function(data) {
					$('.tt-menu').css("display","block");
					$('.tt-dataset').html(data);
				}
			});
		}
	});
	$('.radio1').click(function () {
		$('#tt-menu').css('display','none');
		$('#rPicker').val('');
	});
	/* title부분 불러오는 ajax */
	var mid = '${memberDTO.nickName}';
	var standard = '${standard}';
	var kind='${kind}';
	if(kind == 'today'){
		$.ajax({
			type:'GET',
			url:'plannerTable',
			data:{standard:standard, mid:mid, kind:kind},
			success : function(data){
				$('#calendarTarget').html(data);
			}
		});		
	}
	
</script>
</body>
</html>

















