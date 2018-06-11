<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../../resources/css/common/reset.css">
<c:import url="../../tmp/Bootstrap.jsp"/>
<link rel="stylesheet" href="../../resources/css/common/basic.css">
<link rel="stylesheet" href="../../resources/css/csy/product/productPay.css">
</head>
<body>
	<c:import url="../../tmp/header.jsp"/>
	
	<section class="main_section">
		<div class="container">
			<div class="ct_inner">
				<div class="pay">
					<div class="ct_header">
						<h2 class="step_tit_1">
							<i>주문/결제</i>
						</h2>
						<div class="step_location">
							<span class="step_location_1">01 장바구니 〉</span>
							<span class="step_location_2 on">02 주문/결제  〉</span>
							<span class="step_location_3">03 결제 완료</span>
						</div>
					</div>

					<div id="_productSummery" class="product" style="">
						<span class="thumb">
							<img src="../../resources/upload/${proList[0].f_mainimg}" width="124px" height="120px">
						</span>
						<p class="p_title">
							<span class="txt1">
								<em class="col_orange orderName">
									<i>${proList[0].name}</i><c:if test="${fn:length(proList)-1 ne 0}"> 상품 외 <i>${fn:length(proList)-1}</i>개</c:if>
								</em>의 상품을 주문합니다.
							</span><br><br> 
							<span class="txt2">선택하신 상품의 가격과 옵션정보는 하단 주문상품 정보에서 확인하실 수 있습니다.</span>
						</p>
					</div>
					
					<div class="checkout_content">
						<!-- 배송지 정보 -->
						<div class="checkout_delivery">
							<div class="info_section">
								<h4>배송지 정보</h4>
								<div class="tbl_wrap">
									<table>
										<colgroup>
											<col style="width: 170px;">
											<col>
										</colgroup>
										<tbody id="_shipping_content">
											<tr>
												<th scope="row" class="bd0">이름</th>
												<td><em class="oname">${memberDTO.name}</em><button type="button" class="chg" onclick="changeInfo('oname')">수정</button></td>
											</tr>
											<tr>
												<th scope="row" class="bd0">연락처</th>
												<td><em class="text ophone">${memberDTO.phone}</em><button type="button" class="chg" onclick="changeInfo('ophone')">수정</button>
												</td>
											</tr>
											<tr>
												<th scope="row" class="bd0">주소</th>
												<td><em class="text oaddress">${memberDTO.address}</em><button type="button" class="chg" onclick="changeInfo('oaddress')">수정</button></td>
											</tr>
											<tr>
												<th scope="row" class="bd0">배송 메모</th>
												<td class="memo" id="_shipping_memo">
													<div class="select_div memo">
														<div class="selectric-wrapper">
															<div class="selectric-hide-select">
																<select id="_shipping_select_memo" tabindex="0" class="oaddmsg">
																	<option value="">배송메모를 선택해 주세요.</option>
																	<option value="배송 전 연락바랍니다.">배송 전 연락바랍니다.</option>
																	<option value="경비실에 맡겨주세요.">경비실에 맡겨주세요.</option>
																	<option value="집앞에 놔주세요.">집앞에 놔주세요.</option>
																	<option value="택배함에 놔주세요.">택배함에 놔주세요.</option>
																	<option value="부재시 핸드폰으로 연락주세요.">부재시 핸드폰으로 연락주세요.</option>
																	<option value="부재시 경비실에 맡겨주세요.">부재시 경비실에 맡겨주세요.</option>
																	<option value="부재시 집 앞에 놔주세요.">부재시 집 앞에 놔주세요.</option>
																	<option value="AI">직접 입력</option>
																</select>
															</div>
														</div>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
									<!-- Modal -->
									<div class="modal fade" id="myModal" role="dialog">
										<div class="modal-dialog">									
											<!-- Modal content-->
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal">&times;</button>
													<h4 class="modal-title" style="font-weight: bold;">이름 수정</h4>
												</div>
												<div class="modal-body">
													<p><span class="mTitle">수정할 이름 : </span><input type="text" class="chCon"></p>													
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-default chInfo" data-dismiss="modal">수정하기</button>
												</div>
											</div>									
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="info_section" id="_benefit">
							<h4>적립금 혜택</h4>
							<div class="tbl_wrap">
								<table>
									<colgroup>
										<col style="width: 170px;">
										<col>
									</colgroup>
									<thead>
										<tr>
											<th scope="row" class="bg_gray">적용 포인트</th>
											<td class="coupon_td">
												<div class="coupon_thead">
													<input type="text" class="valPoint">
													<div class="curPoint">P (총 사용 가능 포인트: <span class="col_orange totalPoint"><fmt:formatNumber value="${memberDTO.point}" groupingUsed="true" /></span>P)</div>
												</div>
											</td>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th scope="row">사용예정 금액</th>
											<td><span class="int"><em class="apPoint">0</em><i class="won">원</i></span>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>


						<div class="info_section" id="_product" style="">
							<h4>주문상품 정보</h4>
							<div class="tbl_wrap">
								<table class="product_table">
									<colgroup>
										<col >
										<col >
										<col style="width: 160px;">
										<col style="width: 160px;">
										<col style="width: 160px;">
									</colgroup>
									<thead>
										<tr>
											<th scope="col" colspan="2">상품정보</th>
											<th scope="col">상품금액</th>
											<th scope="col">배송비</th>
											<th scope="col">주문금액</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${proList}" var="dto" varStatus="i">
											<tr class="_deal">
												<td class="thumb">
													<div class="product_thumb">
														<img src="../../resources/upload/${dto.f_mainimg}">
													</div>
												</td>
												<td class="v_top">
													<div class="product_title">
														<div class="info">
															<ul>
																<li><em class="name"> ${dto.name} </em>
																	<em class="num"><i class="oNum" data-pronum="${dto.pronum}">${pAmountList[i.index]}</i>개</em></li>
															</ul>
														</div>
													</div>
												</td>
												<td class="mgl align_center"><span class="int_blue">
													<em class="priceOne"><fmt:formatNumber value="${dto.price*pAmountList[i.index]}" groupingUsed="true" /></em><i class="won">원</i></span>
												</td>
												
												<td rowspan="1" class="mgl align_center">
													<div class="delivery_cont">
														<p class="delivery_free">
															30,000원<br>이상<br>무료배송
														</p>
														<p class="delivery">
															<span class="int"><em>3,000</em><i class="won">원</i></span>
														</p>
													</div>
												</td>
												<td rowspan="1" class="mgl align_center sum"><span
													class="int_black_big"><em class="sumPrice"></em><i class="won">원</i></span>
												</td>
											</tr>										
										</c:forEach>			
									</tbody>
									<tfoot>
										<tr>
											<td colspan="6">
												<div class="money_sum">
													<ul>
														<li><em class="title">상품금액</em> <span
															class="int_black_big"><em class="oriPrice"></em><i
																class="won">원</i></span></li>
														<li><em class="title">할인금액</em> <span
															class="int_black_big"> <em class="pointVal">0</em><i class="won">원</i>
														</span></li>
														<li><em class="title">배송비</em> <span
															class="int_black_big"><em class="delPrice"></em><i class="won">원</i></span>
														</li>
													</ul>
												</div>
											</td>
										</tr>
										<tr>
											<td colspan="6" class="bd0">
												<div class="money_tot">
													<em>총 주문금액</em> <span class="int_black_big"><em class="totalPrice"></em><i
														class="won">원</i></span>
												</div>
											</td>
										</tr>
									</tfoot>
								</table>
							</div>
						</div>
					</div>
					
					
					<div class="info_section" id="_benefit">
							<h4>결제 수단</h4>
							<div class="tbl_wrap">
								<table>
									<colgroup>
										<col style="width: 170px;">
										<col>
									</colgroup>
									<thead>
										<tr>
											<th scope="row" class="bg_gray">결제방법</th>
											<td class="coupon_td">
												<div class="coupon_thead">
													<input type="radio" name="payment" data-kind="card" checked="checked">카드 결제
													<input type="radio" name="payment" data-kind="kakao">카카오페이 결제
													<input type="radio" name="payment" data-kind="deposit">무통장 입금										
												</div>
											</td>
										</tr>
									</thead>
								</table>
							</div>
						</div>
					
					<form action="payOrderInsert" name="frm" id="frm" method="post">
						<input type="hidden" name="memberid" id="memberid">
						<input type="hidden" name="o_name" id="o_name">
						<input type="hidden" name="o_phone" id="o_phone">
						<input type="hidden" name="o_address" id="o_address">
						<input type="hidden" name="uPoint" id="uPoint">
						<input type="hidden" name="orderlist" id="orderlist">
						<input type="hidden" name="totprice" id="totprice">
						<input type="hidden" name="ordername" id="ordername">
						<input type="hidden" name="status" id="status">
					</form>
					
					
					<div class="btn_buy_area">
						<button id="_cancelCheckout" class="btn_cancel">취소</button> 
						<button id="_confirmCheckout" class="btn_buy">구매하기</button>
					</div>
				</div>
			</div>
		</div>
		
	</section>
	
	<c:import url="../../tmp/footer.jsp"/>
	
	<script type="text/javascript">
		var member = '${memberDTO}';
		if(member == ''){
			alert("로그인이 필요한 서비스입니다.");
			location.href="../cart/productCart";
		}
		var proList = $(".priceOne");
		var price = 0;
		var priceDel = 0;
		$(".priceOne").each(function() {
			sumPrice($(this));
		});
		totalPrice(priceDel);
		
		//적용 포인트 입력
		$(".valPoint").keydown(function(e) {
			if( e.keyCode == 13 || e.keyCode == 9){
				$(this).blur();
			}
		});
		
		//포인트 입력시
		$(".valPoint").blur(function() {
			var totalPoint = $(".totalPoint").html().replace(",", "")*1;
			var inputPoint = $(this).val();
			var totalprice = $(".totalPrice").html().replace(",", "")*1;
			if(inputPoint != ''){
				if(Math.floor(inputPoint) == inputPoint && $.isNumeric(inputPoint)){
					//입력한 포인트 값이 숫자이고 정수인지 체크
					if(inputPoint < 0){
						alert("적립금은 -가 될 수 없습니다.\n적립금 사용금액을 다시 입력해 주세요.");
						$(this).val("");
						$(this).blur();
					}else if(inputPoint > totalPoint){
						alert("사용가능 적립금보다 많습니다.\n적립금 사용금액을 다시 입력해 주세요.");
						$(this).val("");
						$(this).blur();
					}else{
						if(inputPoint > totalprice){
							alert("적립금이 총 결제 금액보다 많습니다.");
							$(this).val("");
							$(this).blur();
						}else{
							//숫자 잘 입력
							apPoint(inputPoint);
							totalPrice(priceDel);
						}						
					}
				}else{
					alert("입력하신 적립금이 숫자가 아닙니다.");
					$(this).val("");
				}
			}else{
				apPoint(0);
				totalPrice(priceDel);
			}
		});
		
		
		//각각의 가격 합계
		function sumPrice(proOne) {
			var priceOne = proOne.html().replace(",", "")*1;
			priceDel += priceOne;
			if(priceOne < 30000){
				priceOne += 3000;
			}
			price += priceOne;
			proOne.parents(".mgl").siblings(".sum").find(".sumPrice").html(Number(priceOne).toLocaleString('en'));
		}
		
		//총 가격 합계
		function totalPrice(price){
			var del = 0;
			var point = $(".pointVal").html().replace(",", "")*1;
			if(price < 30000){
				del = 3000;
			}
			$(".oriPrice").html(Number(price).toLocaleString('en'));
			$(".delPrice").html(Number(del).toLocaleString('en'))
			$(".totalPrice").html(Number(price - point + del).toLocaleString('en'));
		}
		
		//포인트 적용
		function apPoint(point) {
			$(".apPoint").html(Number(point).toLocaleString('en'));
			$(".pointVal").html(Number(point).toLocaleString('en'));
		}
		
		function changeInfo(kind) {
			if(kind == 'oaddress'){
				goPopup();
			}else{
				$(".chInfo").attr("data-k", kind);
				if(kind == 'oname'){
					$(".modal-title").html("이름 수정");
					$(".mTitle").html("수정할 이름 : ");
					$(".chCon").attr("type", "text").removeAttr("maxlength").removeAttr("pattern");
				}else if(kind == 'ophone'){
					$(".modal-title").html("전화번호 수정");
					$(".mTitle").html("수정할 번호 : ");
					$(".chCon").attr("type", "tel").attr("maxlength","11").attr("pattern","[0-9]{10}[0-9]?");					
				}
				$('#myModal').modal();
			}
		}
		
		//개인정보 수정
		$(".chInfo").click(function() {
			var kind = $(this).attr("data-k");
			$("."+kind).html($(".chCon").val());
			$(".chCon").val("")
		});
		
		//결제 창 이동
		$(".btn_buy").click(function() {
			var oNum = $(".oNum");
			var i = 0;
			var json = '[';
			oNum.each(function(index) {
				json += JSON.stringify({
					pronum: $(this).attr("data-pronum"),
					amount: $(this).html()
				})				
				if(index != oNum.length-1){
					json += ',';
				}				
			});
			json += ']';
			
			var ordername = '${proList[0].name}';
			var tmp = '${fn:length(proList)-1}';
			if(tmp != '0'){
				ordername += ' 외 ${fn:length(proList)-1}개';
			}
			
			frm.memberid.value = '${memberDTO.email}';
			frm.o_name.value = $(".oname").html();
			frm.o_phone.value = $(".ophone").html().replace(/-/gi,"");
			frm.o_address.value = $(".oaddress").html();
			frm.uPoint.value = $(".pointVal").html().replace(/,/gi,"");
			frm.orderlist.value = json;
			frm.totprice.value = $(".totalPrice").html().replace(/,/gi,"")*1;
			frm.ordername.value = ordername;			
			frm.status.value = $("input[name='payment']:checked").attr("data-kind");
			
			frm.submit();			
		});
		
		function goPopup(){
			// 주소검색을 수행할 팝업 페이지를 호출합니다.
			// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
			var pop = window.open("../../member/popup/jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
			
			// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
		    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
		}
		
		function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
			// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
			
			//document.form_insert.roadFullAddr.value = roadFullAddr;
			var oriAdd = $(".oaddress").html();
			$(".oaddress").html(roadFullAddr);
			var address = $(".oaddress").html();
			if(address==""|| address==null){
				$(".oaddress").html(oriAdd);
				return 0;
			}else{
				return 1;
			}
	}
	</script>
</body>
</html>