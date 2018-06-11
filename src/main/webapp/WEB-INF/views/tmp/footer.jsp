<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(function() {
		var url = location.href;
		var	tmp = url.split('/');
		var key = "recipeClick";
		if(tmp[4] == 'product') {
			key = "productClick";	
		}
		$.ajax({
			url: "${pageContext.request.contextPath}/cookie/cookieList",
			type: "POST",
			data: {
				key: key
			},
			success: function(data) {
				$(".right_menu").html(data);
			}
		});
	});
</script>
<footer>
	<section class="footer_section">
	<div class="f_inner">
		<img class="footer_logo" alt=""
			src="${pageContext.request.contextPath}/resources/images/common/logo2.png">
		<div class="list_stats">
			<div class="list_one">
				<img alt="" src="${pageContext.request.contextPath}/resources/images/common/chef-hat.png"><br>
				총 셰프수
			</div>
			<br>
			<div class="count">280</div>
		</div>
		<div class="list_stats">
			<div class="list_one">
				<img alt="" src="${pageContext.request.contextPath}/resources/images/common/cooking-pot.png"><br>
				총 레시피수
			</div>
			<br>
			<div class="count">1,256</div>
		</div>
		<div class="list_stats">
			<div class="list_one">
				<img alt="" src="${pageContext.request.contextPath}/resources/images/common/recipe2.png"><br>
				총 레시피 조회수
			</div>
			<br>
			<div class="count">135,205</div>
		</div>
		<div class="line"></div>

		<div class="f_right">
			<p class="f_link">
				<a href="${pageContext.request.contextPath}/notice/noticeList">공지사항</a> <span>|</span> <a href="${pageContext.request.contextPath}/qna/qnaList">Q＆A</a> <span>|</span>
				<a href="#">개인정보처리방침</a> <span>|</span> <a href="#">이용약관</a>
			</p>
			<p class="f_info">
				<span>(주)냉장GO</span> <br> 서울특별시 강남구 테헤란로 14길 6 남도빌딩 2F, 3F, 4F
				<br>
				<br> Copyright ©EZHLD Inc. All Rights Reserved
			</p>
		</div>
	</div>
	</section>
	
</footer>
<section class="right_menu">

</section>