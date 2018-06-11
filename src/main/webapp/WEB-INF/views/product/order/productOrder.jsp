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
<link rel="stylesheet" href="../../resources/css/csy/product/productOrder.css">
</head>
<body>
	<c:import url="../../tmp/header.jsp"/>
	
	<section class="main_section">
		<div class="container">
			<div class="ct_inner">
				<div class="order">
					<!-- Cart Header -->
					<div class="ct_header">
						<div class="step_location">
							<span class="step_location_1">01 장바구니 〉</span>
							<span class="step_location_2">02 주문/결제  〉</span>
							<span class="step_location_3 on">03 결제 완료</span>
						</div>
					</div>
					<!-- Cart Header -->
					
					
					<div class="orderStatus">
						<div class="status_top">
							<div class="top_left">
								<img alt="" src="../../resources/images/csy/receipt.png" class="payIcon">
							</div>
							<div class="top_right">
								<div class="r1"><span>구매</span>가 완료되었습니다.</div>
								<div class="r2">구매해 주셔서 감사합니다. 아래 결제 내역을 확인해 주세요.</div>
							</div>
						</div>
						<div class="status_table">
							<div class="table_title"><h2>구매 내역</h2></div>
							<table class="cart_sts">
								<tr class="sts_top" height="50px;">
									<td width="30%" class="tTitle">주문일자 [주문번호]</td>
									<td>${orderDTO.o_date} [<fmt:formatDate value="${orderDTO.o_date}" pattern="yyyyMMdd"/>-${orderDTO.num}]</td>
								</tr>
								<tr class="sts_one"  height="50px;">
									<td class="tTitle">상품정보</td>
									<td>${oriDTO.ordername }</td>									
								</tr>
								<tr class="sts_one"  height="50px;">
									<td class="tTitle">총 결제금액</td>
									<td><span class="totPrice"><fmt:formatNumber value="${orderDTO.totprice}" groupingUsed="true" /></span>원</td>									
								</tr>
								<tr class="sts_one"  height="50px;">
									<td class="tTitle">결제 수단</td>
									<td>
										<c:if test="${oriDTO.status eq 'card' }">신용카드 결제</c:if>
										<c:if test="${oriDTO.status eq 'kakao' }">카카오페이 결제</c:if>
										<c:if test="${oriDTO.status eq 'deposit' }">무통장 입금</c:if>
									</td>						
								</tr>
								<c:if test="${oriDTO.status eq 'deposit'}">
									<tr class="sts_one"  height="50px;">
										<td class="tTitle">입금 계좌</td>
										<td>국민 757-24-0444-702 (주)냉장GO </td>						
									</tr>
								</c:if>
							</table>
							<div class="tBottom">자세한 구매내역 및 서비스는 <a>마이페이지>구매내역</a> 에서 확인하실 수 있습니다.</div>
						</div>
					</div>				
				</div>
				<div class="bt_area">
					<span class="order_btn chk"><a href="../../member/myPage/myPage?nickName=${memberDTO.nickName}&status=5">구매내역 확인</a></span>
					<span class="order_btn shop"><a href="../productList" >쇼핑 계속하기</a></span>
					<span class="order_btn"><a href="../cart/productCart" >장바구니 보기</a></span>
				</div>
			</div>
		</div>
	</section>
	
	<c:import url="../../tmp/footer.jsp"/>
</body>
</html>