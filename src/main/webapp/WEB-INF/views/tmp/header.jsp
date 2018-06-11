<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	
	$(function() {
			Kakao.init('cd868dba3cc2bd18d62a147752f2347c');
		
		$("#logout").click(function() {
				Kakao.Auth.logout(function(data) {
					Kakao.cleanup();
					if(data){
						location.href ="${pageContext.request.contextPath}/member/logout";
					}
			
			}); 
			
		});
		
		
		$('[data-toggle="tooltip"]').tooltip({ position: { my: "left+15 center", at: "right center" } });
		
		$("#arrow_left img").click(function() {
			changeSearch(0);
		});
		$("#arrow_right img").click(function() {
			changeSearch(1);
		});
				
		$("#memberBtn").click(function() {
			if( $(".member_box").attr("data-sts") != "off" ) {
				$(".member_box").attr("data-sts", "off");
				$(".member_box").hide();
			} else {
				$(".member_box").attr("data-sts","on");
				memberTab();
			}
			
			// 쪽지함 새로온 쪽지 or  읽지 않은쪽지 갯수 체크
	         $.ajax({
	            url: "${pageContext.request.contextPath}/messageCheck",
	            type :"GET",
	            success : function() {
	               if("${messageCheck}">0){
	                  $(".newImg").show();
	               }else{
	            	   $(".newImg").hide();
	               }
	            }
	         });
		});
		
		$(document).mouseup(function(e) {
			if($(".member_box").has(e.target).length == 0) {
				if($("#person").has(e.target).length == 0) {
					$(".member_box").attr("data-sts", "off");
					$(".member_box").hide();
				}
			}
		});
		
		
		$("#refrigerator").click(function() {
			$("#ingredientsSearch").modal({backdrop: 'static'});
		});
		
		$('.searchBtn').click(function(){
			var ings=$('.ingkeyword2').val();
			$('.ing_search2_bot').append('<span class="btn-warning ingx2" style="margin: 0 1% 1% 2%" title="'+ings+'">'+ings+'<strong class="badge ing2" style="cursor:pointer">X</strong></span>');
			$('.ingkeyword2').val('');
			
		});
		$('.ing_search2').on("click", ".ingx2", function(){
			$(this).remove();
		});
		$('.isearch_btn2').click(function(){
			var url = "${pageContext.request.contextPath}/recipe/isearch?curPage=1";
			var x=document.getElementsByClassName('ingx2');
			for(i=0;i<x.length;i++){
				url+="&ingredients="+x[i].title;
			}
			if($('.ing_search2').html()!=''){
				location.href=url;
			}else{
				alert('재료를 선택하신 후 검색해 주세요!');
			}
		});
	});
	
	
	
	function changeSearch(status) {		
		var totalNum = $(".associativeSearch_ul").length;
		var curNum;
		
		$(".associativeSearch_ul").each(function() {
			if($(this).css("display") != "none") {
				curNum = $(this).attr("id").substring(17,18) * 1;
			}
			$(this).css("display", "none");
		});
		
		if(status == 0) {	// left
			if(curNum > 1) {
				curNum -= 1;
			}
		} else {			// right
			if(curNum < totalNum) {
				curNum += 1;
			}
		}
		$("#associativeSearch"+curNum).css("display", "inline");
	}
	
	function memberTab() {
		$(".member_box").attr("data-sts","on");
		$(window).resize(function(){
			var obj = $("#memberBtn").position();
			
			$(".member_box").css("left", obj.left - 60);
			$(".member_box").css("top", obj.top + 2);
			$(".member_box").css("display","inline-block");
			$(".member_box").attr("data-sts","on");
		}).resize();
		$(".member_box").attr("data-sts","on");
	}
	
	
	
	function search(find){
	    if(event.keyCode == 13){
	    	$.post("${pageContext.request.contextPath}/recipe/sWordInsert",
		   	    	{
		   	    		recipe: find.value,
		   	    		weather: '${sessionScope.weather}',
		   	    		temperature: '${sessionScope.temperature}' 
		   	    	},function(data){
		   	    		
		   	    	});
	    	location.href = "${pageContext.request.contextPath}/recipe/search?find="+find.value;
		}
	}
	function ingsearch(find){
		$.ajax({
			url: "${pageContext.request.contextPath}/recipe/inglist",
			type:"GET",
			data:{
				find:find.value
			},
			success:function(data){
				$('.ings').html(data.trim());
			}
		});
	}
	$('.ing_btn').click(function(){
		var ings=$('.ingkeyword').val();
		$('.ing_search').append('<span class="btn btn-warning ingx" style="margin: 0 1% 1% 0" title="'+ings+'">'+ings+'<strong class="badge ing" style="cursor:pointer">X</strong></span>');
		$('.ingkeyword').val('');
	});
	$('.ing_search').on("click", ".ingx", function(){
		$(this).remove();
	});
	$('.isearch_btn').click(function(){
		var url= "${pageContext.request.contextPath}/recipe/isearch?curPage=1";
		var x=document.getElementsByClassName('ingx');
		for(i=0;i<x.length;i++){
			url+="&ingredients="+x[i].title;
		}
		if($('.ing_search').html()!=''){
			location.href=url;
		}else{
			alert('재료를 선택하신 후 검색해 주세요!');
		}
	});
	function ingsearch2(find){
		$.ajax({
			url: "${pageContext.request.contextPath}/recipe/inglist",
			type:"GET",
			data:{
				find:find.value
			},
			success:function(data){
				$('.ings2').html(data.trim());
			}
		});
	}
	
	
</script>
<header>
	<div class="search">
		<div class="search_wrap">
			<input type="text" id="searchInput" placeholder="음식명, 재료명으로 검색해주세요." onkeydown="search(this)">
			<div class="pictureBtn">
				<div id="person">
					<c:if test="${sessionScope.memberDTO == null}">	<!-- 로그인 안 했을 때 -->
						<a href="${pageContext.request.contextPath}/member/login?path=/" class="loginBtn">
							<img src="${pageContext.request.contextPath}/resources/images/common/user-silhouette.png"
								onmouseover="this.src='${pageContext.request.contextPath}/resources/images/common/user-silhouette-over.png'"
								onmouseout="this.src='${pageContext.request.contextPath}/resources/images/common/user-silhouette.png'">
							<span class="tooltiptext">로그인</span>
						</a>
					</c:if>
					<!-- 로그인 했을 때 -->
					<c:if test="${sessionScope.memberDTO !=null }">	
						<!-- SNS 회원    -->
						<c:if test="${sessionScope.memberDTO.login_mode eq 'SNS_join' }">
						      <!-- 카카오 프로필 사진 유무 -->
						      <!-- 맨처음 가입하면 카카오 프로필 사진으로 저장됨, 하지만 프로필 설정에서 
						      이미지를 바꾸면 서버에 저장되있는 경로로가서 이미지를 가져옴  -->
							<c:choose>
								<c:when test="${memberDTO.myPhoto eq 'sns'  }">	
									<c:if test="${memberDTO.sns_photo ne null }">
										<img alt="회원" style="width:35px; height:35px; border-radius: 50%;" src="${memberDTO.sns_photo }" id="memberBtn">	
									</c:if>								
									
									<c:if test="${memberDTO.sns_photo eq null }">
										 <img alt="회원" style="width:35px;  height:35px; border-radius: 50%;" src="${pageContext.request.contextPath}/resources/images/common/default.png" id="memberBtn">
									</c:if>
								</c:when>
								
								<c:when test="${memberDTO.myPhoto ne 'sns'  }">
									 <img alt="회원" style="width:35px; height: 35px; border-radius: 50%;" src="${pageContext.request.contextPath}/resources/upload/${memberDTO.myPhoto}" id="memberBtn">
								</c:when>
							</c:choose>
							
						</c:if>
						<!-- 일반회원   -->
						<c:if test="${sessionScope.memberDTO.login_mode eq 'general_join' }">
							<c:if test="${memberDTO.myPhoto eq '' || memberDTO.myPhoto eq null }">
		                        <img alt="회원" style="width:35px; height: 35px; border-radius: 50%;" src="${pageContext.request.contextPath}/resources/images/common/default.png"
		                        onmouseover="this.src='${pageContext.request.contextPath}/resources/images/common/default.png'"
		                        onmouseout="this.src='${pageContext.request.contextPath}/resources/images/common/default.png'" id="memberBtn">
		                     </c:if>
		                     <c:if test="${memberDTO.myPhoto ne null }">
		                        <img alt="회원" style="width:35px; height: 35px; border-radius: 50%;" src="${pageContext.request.contextPath}/resources/upload/${memberDTO.myPhoto}"
		                        onmouseover="this.src='${pageContext.request.contextPath}/resources/upload/${memberDTO.myPhoto}'"
		                        onmouseout="this.src='${pageContext.request.contextPath}/resources/upload/${memberDTO.myPhoto}'" id="memberBtn">
		                     </c:if>
						</c:if>
							
					</c:if>
				</div>
				<div id="writer">
					<a href="${pageContext.request.contextPath}/recipe/recipeWrite">
						<img alt="레시피 등록" src="${pageContext.request.contextPath}/resources/images/common/pen-tool.png" 
							onmouseover="this.src='${pageContext.request.contextPath}/resources/images/common/pen-over.png'"
							onmouseout="this.src='${pageContext.request.contextPath}/resources/images/common/pen-tool.png'">
						<span class="tooltiptext">내 레시피 등록하기</span>
					</a>
				</div>
				<div id="refrigerator">
					<img alt="냉장고 추천" src="${pageContext.request.contextPath}/resources/images/common/fridge.png"
						onmouseover="this.src='${pageContext.request.contextPath}/resources/images/common/fridge-over.png'"
						onmouseout="this.src='${pageContext.request.contextPath}/resources/images/common/fridge.png'" style="cursor:pointer">
					<span class="tooltiptext">있는재료로 추천받기</span>
				</div>
			</div>
		</div>
		<div class="member_box" style="display: none;" data-sts="off">
			<ul>
				<li><a href="${pageContext.request.contextPath}/member/myPage/myPage?nickName=${memberDTO.nickName}&status=1">MY홈</a></li>
				<li><a href="#">레시피 노트</a></li>
				<li>
					<a href="${pageContext.request.contextPath}/member/myPage/myPage?nickName=${memberDTO.nickName}&status=4">메시지</a>
					<img alt="" src="${pageContext.request.contextPath}/resources/images/csy/new2.png" style="position: absolute; margin-top: 13px; display: none;" class="newImg">
				</li>
				<li><a href="${pageContext.request.contextPath}/member/myPage/myPage?nickName=${memberDTO.nickName}&status=5">주문조회</a></li>
				<c:if test="${memberDTO.grade ne 2}">
				<li><a href="${pageContext.request.contextPath}/product/cart/productCart">장바구니</a></li>				
				</c:if>
				<c:if test="${memberDTO.grade eq 2}">
				<li><a href="${pageContext.request.contextPath}/product/productWrite">상품등록</a></li>				
				</c:if>
				<li>
					<c:if test="${memberDTO.login_mode eq 'SNS_join' }">
						<a href="${pageContext.request.contextPath}/member/info_correct">회원정보수정</a>	
					</c:if>
					<c:if test="${memberDTO.login_mode eq 'general_join' }">
						<a href="${pageContext.request.contextPath}/member/info_check">회원정보수정</a>	
					</c:if>
				</li>
				<li><a role="button" id="logout">로그아웃</a></li>
			</ul>
		</div>
	</div>
	<div class="menu">
		<div class="menu_wrap">
			<div class="logo">
				<a href="${pageContext.request.contextPath}/"><img alt="" src="${pageContext.request.contextPath}/resources/images/common/logo_yellow.png"></a>
			</div>
			<div class="menu_sub">
				<nav class="menu_sub_nav">
					<ul class="menu_sub_ul">
						<li><a href="${pageContext.request.contextPath}/recipe/search">레시피</a></li>
						<li><a role="button" class="plannerBtn">플래너</a></li>
						<li><a href="${pageContext.request.contextPath}/product/productList">쇼핑몰</a></li>
					</ul>
				</nav>
			</div>
			<div class="associativeSearch">
				<nav class="associativeSearch_nav">
					<ul class="associativeSearch_ul" id="associativeSearch1">
	                  <li><a href="${pageContext.request.contextPath}/recipe/search?find=삼겹살">삼겹살</a></li>
	                  <li><a href="${pageContext.request.contextPath}/recipe/search?find=초간단요리">초간단요리</a></li>
	                  <li><a href="${pageContext.request.contextPath}/recipe/search?find=치킨">치킨</a></li>
	                  <li><a href="${pageContext.request.contextPath}/recipe/search?find=야식">야식</a></li>
	                  <li><a href="${pageContext.request.contextPath}/recipe/search?find=피크닉">피크닉</a></li>
	                  <li><a href="${pageContext.request.contextPath}/recipe/search?find=메인반찬">메인반찬</a></li>
	                  <li><a href="${pageContext.request.contextPath}/recipe/search?find=다이어트">다이어트</a></li>
	               </ul>
	               <ul class="associativeSearch_ul" id="associativeSearch2" style="display: none;">
	                  <li><a href="${pageContext.request.contextPath}/recipe/search?find=도시락">도시락</a></li>
	                  <li><a href="${pageContext.request.contextPath}/recipe/search?find=영양식">영양식</a></li>
	                  <li><a href="${pageContext.request.contextPath}/recipe/search?find=디저트">디저트</a></li>
	                  <li><a href="${pageContext.request.contextPath}/recipe/search?find=퓨전">퓨전</a></li>
	                  <li><a href="${pageContext.request.contextPath}/recipe/search?find=두루치기">두루치기</a></li>
	                  <li><a href="${pageContext.request.contextPath}/recipe/search?find=여름">여름</a></li>
	                  <li><a href="${pageContext.request.contextPath}/recipe/search?find=밑반찬">밑반찬</a></li>
	               </ul>
				</nav>
			</div>
			<div class="arrow">
				<div id="arrow_right">
					<img alt="" src="${pageContext.request.contextPath}/resources/images/common/btn_arrow2_r.gif">
				</div>
				<div id="arrow_left">
					<img alt="" src="${pageContext.request.contextPath}/resources/images/common/btn_arrow2_l.gif">
				</div>
			</div>
		</div>
	</div>
<c:import url="/recipe/ingSearch"/>

</header>

<script>
$(".plannerBtn").click(function() {
	if('${memberDTO}' != ''){
		location.href="${pageContext.request.contextPath}/planner/plannerPage";
	}else{
		alert("로그인이 필요한 서비스입니다.");
		location.href = "${pageContext.request.contextPath}/member/login";
	}
});
</script>