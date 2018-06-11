<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../resources/css/common/reset.css">
<c:import url="../tmp/Bootstrap.jsp"/>
<link rel="stylesheet" href="../resources/css/common/basic.css">
<link rel="stylesheet" href="../resources/css/csy/product/productList.css">
</head>
<body>
	<c:import url="../tmp/header.jsp"/>
	<section class="top_section">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
				<li data-target="#myCarousel" data-slide-to="3"></li>
			</ol>
			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item active" data-rnum="19">
					<img src="../resources/images/csy/main_img1.jpg" height= "360px">
				</div>
				<div class="item" data-rnum="20">
					<a><img src="../resources/images/csy/main_img3.jpg" height= "360px"></a>
				</div>
				<div class="item" data-rnum="21">
					<a><img src="../resources/images/csy/main_img4.jpg" height= "360px"></a>
				</div>				
				<div class="item" data-rnum="22">
					<a><img src="../resources/images/csy/main_img5.jpg" height= "360px"></a>
				</div>
			</div>

			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev"> 
				<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> 
			<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next"> 
				<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
		
	</section>
	<section class="main_section">
		<div class="container">
			<div class="main_menu">
				<ul class="ul_nav">
					<li class="all" data-sts="n">
						<div class="all_open">전체 카테고리</div>
						<ul class="child">
							<li><img alt="" src="../resources/images/common/logo3.png"></li>
						</ul>
					</li>					
					<li class="has_nav">
						<div class="menu_nav">농산물</div>
						<ul class="child" style="border-left: 1px solid #797979">
							<li><div class="child_nav" data-cat="곡류">곡류</div></li>
							<li><div class="child_nav" data-cat="채소">채소</div></li>
						</ul>
					</li>
					<li class="has_nav">
						<div class="menu_nav">수산물</div>
						<ul class="child">
							<li><div class="child_nav" data-cat="생선어패류">생선/어패류</div></li>
							<li><div class="child_nav" data-cat="해조류">해조류</div></li>
							<li><div class="child_nav" data-cat="건어물">건어물</div></li>
							<li><div class="child_nav" data-cat="수산가공">수산가공</div></li>
						</ul>
					</li>
					<li class="has_nav">
						<div class="menu_nav">정육</div>
						<ul class="child">
							<li><div class="child_nav" data-cat="양념가공육">양념/가공육</div></li>
						</ul>
					</li>
					<li class="has_nav">
						<div class="menu_nav">가공식품</div>
						<ul class="child">
							<li><div class="child_nav" data-cat="반찬류">반찬류</div></li>
							<li><div class="child_nav" data-cat="냉동식품">냉동식품</div></li>
							<li><div class="child_nav" data-cat="밥면류">밥/면류</div></li>
							<li><div class="child_nav" data-cat="맛살어묵단무지">맛살/어묵/단무지</div></li>
						</ul>
					</li>
					<li class="has_nav">
						<div class="menu_nav" style="border-right: none;">양념류</div>
						<ul class="child">
							<li><div class="child_nav" data-cat="기름류">기름류</div></li>
							<li><div class="child_nav" data-cat="장류">장류</div></li>
							<li><div class="child_nav" data-cat="조미료">조미료</div></li>
						</ul>
					</li>
				</ul>					
			</div>
			<div class="wrap">
				
			</div>
		</div>
	</section>
	
	<c:import url="../tmp/footer.jsp"/>
	
	<script type="text/javascript">
		var m = '${message}';
		if(m != ''){
			alert(m);
		}
		listPage(1, '', '');
		
		/******** 스크롤 이동시 상단 메뉴 고정 ************/
		var topHeadHeight = 110;	//header height
		var marginHeight = $('.main_menu').height();
		var trigger = $('.main_menu').offset().top;
		$(window).scroll(function() {
			var scroll = $(window).scrollTop();
			if(scroll > trigger-topHeadHeight) {
				$('.main_menu').css({					
					'position': 'fixed',
					'top': topHeadHeight,
					'left': '0px',
					'right': '0px'
				});
				$('header').css('margin-bottom', marginHeight);
			} else{
				$('.main_menu').css('position', 'static');
				$('header').css('margin-bottom', 0);
			}
		});
		
		/*********** 메뉴 Toggle **********/
		$(".all").click(function(){
			var sts = $(this).attr("data-sts");
			if(sts == 'n'){
        		$(".child").slideDown("slow");
        		$(this).attr("data-sts", "y")
			}else{
				$(".child").slideUp("slow");
        		$(this).attr("data-sts", "n")
			}
		});		
		
		/********** 새로고침시 스크롤 이동 **********/
		window.onload=function(){
			setTimeout(function() {
				scrollTo(0,0);
			}, 1);
			
		}
		
		/*********** 메뉴 Hover **********/
		$(".has_nav").hover(function() {
			var sts = $(".all").attr("data-sts");
			if (sts == 'n') {
				$(this).find(".child").css("display", "block");
			}
		}, function() {
			var sts = $(".all").attr("data-sts");
			if (sts == 'n') {
				$(this).find(".child").css("display", "none");
			}
		});
		
		
		
		
		$(".menu_nav, .child_nav").click(function() {			
			//스크롤 이동
			var offset = $(".main_menu").offset();
			$('html, body').animate({scrollTop: offset.top-110}, 400);
			$(".child").slideUp("slow");
    		$(".all").attr("data-sts", "n");
		});	
		
		
		/*********** 카테고리 클릭 **********/
		$(".menu_nav, .child_nav").click(function() {
			//페이지 이동
			var major = '';
			var minor = '';
			var curPage = 1;
			var t = $(this).hasClass("child_nav");
			if(t){
				minor = $(this).attr("data-cat");
				major = $(this).parents("ul").siblings(".menu_nav").html();
			}else{
				major = $(this).html();
			}
			listPage(1, major, minor);
		});
		$(".all_open").click(function() {
			listPage(1, '', '');
		});
		
		/*********** 페이지, 카테고리에 따른 페이징처리 **********/
		function listPage(curPage, cate_major, cate_minor) {
			$.ajax({
				url: "productList_wrap",
				type: "POST",
				data: {
					curPage: curPage,
					cate_major: cate_major,
					cate_minor: cate_minor
				},
				success: function(data) {
					$(".wrap").html(data);
				}
			});
		}
		
		/**************** 상단 광고 레시피 *******************/
		$(".item").click(function() {
			var num = $(this).attr("data-rnum");
			location.href = "../recipe/recipeView?num=" + num;
		});
	</script>
</body>
</html>