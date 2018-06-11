<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../../resources/css/common/reset.css">
<c:import url="../../tmp/Bootstrap.jsp"/>
<link rel="stylesheet" href="../../resources/css/common/basic.css">
<link rel="stylesheet" href="../../resources/css/csy/product/productCart.css">
</head>
<body>
	<c:import url="../../tmp/header.jsp"/>	
	<section class="main_section">
		<div class="container">
			<div class="ct_inner">
				<div class="cart">
					
					<!-- Cart Header -->
					<div class="ct_header">
						<h2 class="step_tit_1">
							<i>장바구니</i>
						</h2>
						<p class="step_num">
							(<span class="_cart_cnt num">0</span>)
						</p>
						<div class="step_location">
							<span class="step_location_1 on">01 장바구니 〉</span>
							<span class="step_location_2">02 주문/결제  〉</span>
							<span class="step_location_3">03 결제 완료</span>
						</div>
					</div>
					<!-- Cart Header -->

					<div class="cart_sts_wrap">
						
					
					</div>				

					<div class="ct_total">
						<h3 class="ct_total_tit">총 주문금액</h3>
						<dl class="matter">
							<dt>총 상품금액</dt>
							<dd>
								<em class="_buy_amount"> </em><span> 원</span>
							</dd>
							<dt>배송비</dt>
							<dd>
								<em class="_delivery_amount"> </em><span> 원</span>
							</dd>
						</dl>
						<dl class="total">
							<dt>결제 예상금액</dt>
							<dd>
								<em class="_total_amount"> </em><span> 원</span>
							</dd>
						</dl>
					</div>
					
					
					<div class="bt_area">
						<a href="../productList" class="bt_continue">쇼핑 계속하기</a>
						<button type="button" class="bt_submit">구매하기</button>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<c:import url="../../tmp/footer.jsp"/>
	
	<script type="text/javascript">
		var memberid = '${memberDTO.email}';
		$.ajax({
			url: "cartNMList",
			type: "POST",
			data:{
				memberid: memberid
			},
			success: function(data) {
				$(".cart_sts_wrap").html(data);
			}
		});		
		
		/********** 새로고침시 스크롤 이동 **********/
		window.onload=function(){
			setTimeout(function() {
				scrollTo(0,0);
			}, 1);
			
		}
	</script>
</body>
</html>