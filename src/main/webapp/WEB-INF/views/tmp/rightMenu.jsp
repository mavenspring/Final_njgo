<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<h2 class="right_menu_title">
		<img alt="" src="${pageContext.request.contextPath}/resources/images/common/todayView.png">
	</h2>
	<!-- <div style="color: #d9b3ff; font-size: xx-large;">ㅋ</div> -->
	<img alt="" src="${pageContext.request.contextPath}/resources/images/common/caret-arrow-up.png" align="middle" class="prev_btn">
	<div class="view_wrap">
		<div class="view_list">
			<c:forEach items="${cookieList}" var="dto">
				<div class="view_one">
					<c:if test="${key eq 'productClick'}">
						<a href="${pageContext.request.contextPath}/product/productView?pronum=${dto.pronum}"><img alt="" src="${pageContext.request.contextPath}/resources/upload/${dto.f_mainimg}"></a>						
					</c:if>
					<c:if test="${key eq 'recipeClick'}">
						<a href="${pageContext.request.contextPath}/recipe/recipeView?num=${dto.num}"><img alt="" src="${pageContext.request.contextPath}/resources/upload/${dto.rep_pic}"></a>						
					</c:if>
				</div>
			</c:forEach>
			<%-- <div class="view_one">
				<img alt="" src="${pageContext.request.contextPath}/resources/images/common/tumblr_mmmrgtjft91rxgaoqo6_250.gif">
			</div>
			<div class="view_one">
				<img alt="" src="${pageContext.request.contextPath}/resources/images/common/30_ani.gif">
			</div>
			<div class="view_one">
				<img alt="" src="${pageContext.request.contextPath}/resources/images/common/b6240026751de031f737c57b56b7a1ac.gif">
			</div>
			<div class="view_one">
				<img alt="" src="${pageContext.request.contextPath}/resources/images/common/20151028180442_JxIEkgcV_IMG_8324.gif">
			</div>
			<div class="view_one">
				<img alt="" src="${pageContext.request.contextPath}/resources/images/common/tumblr_nbv1pdF0fG1sa9pj8o4_250.gif">
			</div> --%>
		</div>
	</div>
	<img alt="" src="${pageContext.request.contextPath}/resources/images/common/caret-down.png" class="next_btn"><br>
	<c:if test="${key eq 'productClick' }">
		<a href="${pageContext.request.contextPath}/product/cart/productCart"><img src="${pageContext.request.contextPath}/resources/images/csy/cart_2.png"></a>
	</c:if>
	<script type="text/javascript">
		$(function() {
			
			$(window).resize(function(){
				var mainOffset = $(".main_section").offset();
				var mainWidth = $(".main_section").width();
				$(".right_menu").css("top", mainOffset.top);  
				$(".right_menu").css("left", mainOffset.left + mainWidth + 20);
			}).resize();
			
			$(window).scroll(function() {
				var scroll = $(window).scrollTop();
		        var mainOffset = $(".main_section").offset();
				$(".right_menu").css("top", mainOffset.top);  
				if(scroll < mainOffset.top - 110){
	            	$(".right_menu").css("top", mainOffset.top-scroll);            	
				}else{
					$(".right_menu").css("top", 110); 
				}
	         });
			
			var margin = 0;
			var count = $(".view_one").length;
			$(".view_wrap").css("height", 75 * count);
			
			$(".prev_btn").click(function() {
				if(margin != 0) {
					count++;
					margin+=75;
					$(".view_list").animate({marginTop: margin+'px'});
				}
			});
			$(".next_btn").click(function() {			
				if(count > 5) {
					count--;
					margin-=75;
					$(".view_list").animate({marginTop: margin+'px'});
				}
			});
		});	
	</script>
	<style>
		.right_menu {
			position: fixed;
			width: 70px;
			float: right;
			margin: 0 auto;
			text-align: center;
			height: 410px;
		}
		.right_menu_title{
			text-align: center;
		}
		.right_menu_title img {
			width: 44px;
			height: 22px;
		}
		.view_one{
			width: 100%;
		    height: 70px;
		    margin: 5px 0;
		    cursor: pointer;
		    background-repeat: no-repeat;
		    background-size: cover;
		    background-position: center;
		}
		.view_one img {
			width: 70px;
			height: 70px;
		}
		.prev_btn, .next_btn{
			cursor: pointer;
		}
		.view_wrap {
			width: 70px;
			max-height: 380px;
			overflow: hidden;
			position: relative;
		}
		.view_list {
			width: 70px;
			max-height: 380px;
			position:absolute;
		}
	</style>