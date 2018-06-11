<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="./resources/css/common/reset.css">
<c:import url="./tmp/Bootstrap.jsp"/>
<link rel="stylesheet" href="./resources/css/common/basic.css">
<link rel="stylesheet" href="./resources/css/common/home.css">
<script src="./resources/js/psy/weather.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function() {
		getLocation();
		
		$.get("./recipe/hitTop", function(data) {
			makeHomeList(data, $(".hitSection_contents"));
		});
		
		$.get("./recipe/cookingAdvice", function(data) {
			makeHomeList(data, $(".adviceSection_contents"));
		});
		
		
		$(document).on("mouseenter", ".recommendRecipe_sub img", function() {
			todayRecipeMouseOver($(this));
		});
		
		$(document).on("mouseleave", ".recommendRecipe_sub", function() {
			$(".overlap_recipeImg").eq($(this).index()).css("display", "none");
		});
		
		$("#refreshBtn").mouseover(function() {
			$(this).attr("class","refreshBtn_rotation");
			
			setTimeout(function(){
				$("#refreshBtn").attr("class", "stoped");
			}, 500);
		});
		
		$("#refreshBtn").click(function() {
			location.reload();
		});
		
		$(document).on("click", ".homeR_contents_wrap", function() {
	         var num = $(this).attr("data-id");
	         location.href = "./recipe/recipeView?num=" + num;
	    });
		
		//추가 된부분
		if("${message}"!=""){
			alert("${message}");
		}
		
		if(("${memberDTO.grade}" <1) && ("${memberDTO}"!="")){
			alert("이메일 인증을 안한상태입니다. 가입하신 이메일을 확인해주세요.")
		}
	});
	function makeHomeList(data , selector) {
		for(var i=0;i<data.length;i++) {
			var str = '<div class="homeR_contents_wrap" data-id="' + data[i].num + '">';
			str += '<div class="homeR_contents_image">';
			str += '<img alt="" src="./resources/upload/' + data[i].rep_pic + '">';
			str += '</div>';
			str += '<div class="homeR_contents_text">';
			str += '<div class="homeR_contents_title">' + data[i].title + '</div>';
			str += '<div class="homeR_contents_writer">by ' + data[i].writer + '</div>';
			str += '</div>';
			str += '</div>';
			
			selector.append(str);
		}
	}
</script>
</head>
<body>
	<c:import url="./tmp/header.jsp"/>
	
	<!--<c:import url="./tmp/leftMenu.jsp"/>-->
	
	<section class="main_section">
		<article class="adSection"></article>
		
		<article class="hitSection homeR_Section">
			<div class="hitSection_title homeR_Section_title">
				가장 많이 본 레시피
			</div>
			<div class="hitSection_contents homeR_Section_contents"></div>
		</article>
		
		<article class="adviceSection homeR_Section">
			<div class="adviceSection_title homeR_Section_title">
				알아두면 무조건 좋은
			</div>
			<div class="adviceSection_contents homeR_Section_contents"></div>
		</article>
		
		<article class="weatherSection">
			<div class="overlap">
				<div class="today_weather">
					<img id="weather_img" alt="" src="">
					<span id="temperature"></span>
				</div>
				
				<div class="weatherTitle">
					오늘의 메뉴
				</div>
				<div class="weatherSubTitle">
					날씨에 따라 추천하는 오늘의 메뉴는
					<span id="recommendFood"></span>
					입니다.			
				</div>
				<div class="refresh">
					<img id="refreshBtn" alt="" src="./resources/images/common/btn_roulette.png">
				</div>
				<div class="recommendRecipe"></div>
			</div>
		</article>
			
	</section>
	
	<c:import url="./tmp/footer.jsp"/>
</body>
</html>