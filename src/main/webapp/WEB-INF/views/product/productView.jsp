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
<link rel="stylesheet" href="../resources/css/csy/product/productView.css">
</head>
<body>
	<c:import url="../tmp/header.jsp"/>
	<section class="main_section">
		<div class="container">
		<div class="pro_title_wrap">
			<div class="pro_title">
				${productDTO.name}
			</div>
			<div class="pro_line"></div>
		</div>
		<div class="pro_detail">
			<div class="pro_detail_left">
				<img src="../resources/upload/${productDTO.f_mainimg}">
				<div></div>
			</div>
			<div class="pro_detail_right">
				<div class="pro_price_info">
					<div class="detail_price">
						<strong>판매가</strong>
						<span><fmt:formatNumber value="${productDTO.price}" groupingUsed="true"/></span>
						원
					</div>
				</div>
				<div class="pro_detail_info">
					<div class="detail_1">
						<strong>제조사/제조국</strong>
						냉장GO㈜ / 한국
					</div>
					<div class="detail_2">
						<strong>주원료/원산지</strong>
						하단 상품사양 원산지표시 참조
					</div>
					<div class="detail_5">
						<strong>상품코드</strong>
						${productDTO.procode}
					</div>
					<div class="detail_3">
						<strong>배송정보</strong>
						<c:if test="${productDTO.price < 30000 }">
							3,000원
							<span class="info">(주말,공휴일 제외 3일 내 발송)</span><br>
							<span class="info">30,000원 이상시 무료배송</span>						
						</c:if>
						<c:if test="${productDTO.price >= 30000 }">
							<img alt="" src="../resources/images/csy/ico_free.gif" width="45px" height="14px">
							<span class="info">(주말,공휴일 제외 3일 내 발송)</span>		
						</c:if>
					</div>
					<div class="detail_4">
						<strong>주문수량</strong>
						<form action="" name="cartFrm" id="cartFrm">
							<input type="hidden" name="pronum" value="${productDTO.pronum}">
							<input type="hidden" name="memberid" value="${memberDTO.email}">
							<input type="hidden" name="amount" id="amount">
						</form>
						<form action="" name="payFrm" id="payFrm">
							<input type="hidden" name="pNumList" id="pNumList">
							<input type="hidden" name="pAmountList" id="pAmountList">
							<input type="hidden" name="memberid" value="${memberDTO.email}">
						</form>
						<select class="proAmount">
							<option>1개</option>
							<option>2개</option>
							<option>3개</option>
							<option>4개</option>
							<option>5개</option>
							<option>6개</option>
							<option>7개</option>
							<option>8개</option>
							<option>9개</option>
							<option>10개</option>							
						</select><br>
						<span class="info">최대 주문수량은 총 10개 입니다.</span>
					</div>
					
				</div>
				<div class="pro_detail_btn">
					<c:if test="${productDTO.amount eq 0}">
						<img alt="" src="../resources/images/csy/btn_soldout.gif">
					</c:if>						
					<c:if test="${productDTO.amount ne 0}">
						<img alt="" src="../resources/images/csy/btn_product_1.gif" class="payBtn">
						<img alt="" src="../resources/images/csy/btn_product_2.gif" class="cartBtn">					
					</c:if>
					<div class="cartForm" style="width: 0; height: 0;"></div>
				</div>
			</div>
		</div>
		<div class="clear"></div>
		<div class="recomm">
			<strong>이 상품과 관련된 상품</strong>
			<div class="picoSlider">
				<div class="count">
					<strong>1</strong>/<span>3</span>
				</div>
				<button class="prev">
					<span><img alt="" src="../resources/images/csy/btn_prevSlide.png"> </span>
				</button>
				<div class="picoInner">
					<ul>
						<c:forEach items="${cateList}" var="cateDTO">
							<li>
								<div class="recomm_one">
									<div class="img goView" data-pronum="${cateDTO.pronum}"><img alt="" src="../resources/upload/${cateDTO.f_mainimg}"></div>
									<span class="iName goView" data-pronum="${cateDTO.pronum}">${cateDTO.name}</span>
									<div class="iHowmuch">
										<span class="iCost">
											<span><fmt:formatNumber value="${cateDTO.price}" groupingUsed="true"/></span>원
										</span>
									</div>
								</div>
							</li>						
						</c:forEach>						
					</ul>
				</div>
				<button type="button" class="next">
					<span><img alt="" src="../resources/images/csy/btn_nextSlide.png"> </span>
				</button>
			</div>
			
		</div>
		<div class="clear"></div>
		<div class="detail_bann"><img class="detail_bann_img" alt="" src="../resources/images/csy/detail_ban5_3.jpg"></div>
		<div class="clear"></div>
		<div class="view_menu">
			<div class="vmenu m_detail" data-m="v_detail">상품상세정보</div>
			<div class="vmenu m_review" data-m="v_review">상품평</div>
			<div class="vmenu m_delivery" data-m="v_delivery">배송정보</div>
			<div class="vmenu m_qna" data-m="v_qna">주문 변경/취소 안내</div>
			<div class="vmenu m_refund" data-m="v_refund">교환반품정보</div>
		</div>
		<div class="view v_detail" data-n="v_detail">
			<!-- 상품사양 table -->
			<div class="piCont pic1" id="piCont1">

				<h3 class="product_read">상품사양</h3>

				<table class="table_goodsDetail"
					summary="상품상세정보 : 제품명, 식품의 유형, 제조사, 제조사의 소재지, 제조국, 제조일, 용량, 원재료명 및 함량, 영양성분, 유전자재조합식품, 영유아식 또는 체중조절식품, 수입식품, 포장상태 및 보관방법, 유통전문판매원, 소비자 상담번호">
					<colgroup>
						<col width="240">
						<col width="*">
					</colgroup>
					<tbody>
						<tr>
							<td colspan="2" class="tit"></td>
						</tr>

						<tr class="first">
							<th scope="row">본상품구성</th>
							<td>${productDTO.name}</td>
						</tr>

						<tr>
							<th scope="row">원재료 및 함량</th>
							<td>${productDTO.contents}</td>
						</tr>

					</tbody>
				</table>
			</div>
			<!-- 상세 이미지 -->
			<div class="detail_img"><img alt="" src="../resources/upload/${productDTO.f_detailimg}"></div>
			
		</div>
		
		<div class="view v_review" data-n="v_review">
			
		</div>
		
		<div class="view v_delivery" data-n="v_delivery">
			<p class="v_title">배송정보</p>
				<div class="pic pic41">
					<ul class="dot">
						<li class="d_active">기본 배송비 : <span class="fw700 c-bk">3,000원</span></li>
						<li>무료배송 기준 : ① 동일 유형별 상품 <span class="fw700 c-bk">30,000원
								이상</span> 구매 시 &nbsp; ② <span class="fw700 c-bk">‘무료배송’</span>으로 표시된 상품
							구매 시 ( <span class="llb llb1">무료배송</span> )
						</li>
					</ul>
					<strong class="dot">배송 유형별 상품 안내</strong>
					<table class="cols" summary="배송 유형별 상품 안내">
						<colgroup>
							<col width="28%">
							<col width="28%">
							<col width="16%">
							<col width="14%">
							<col width="14%">
						</colgroup>
						<tbody>
							<tr>
								<th scope="col">상온 배송 상품</th>
								<th scope="col">저온 배송 상품</th>
								<th scope="col">세제</th>
								<th rowspan="2" scope="col">반려동물<br>먹거리
								</th>
								<th rowspan="2" scope="col">선물세트<br>상품
								</th>
							</tr>
							<tr>
								<td>[상온], [상온&amp;실온] 표기된 상품<br>햇반, 스팸, 밀가루, 구강/생활용품 등
								</td>
								<td>[냉장], [냉장&amp;냉동] 표기된 상품<br>김치, 국수, 어묵, 만두, 푸딩 등
								</td>
								<td>세탁, 생활,<br>주방 세제상품
								</td>
							</tr>
						</tbody>
					</table>
					<ul class="dot">
						<li class="d_active">주문한 상품은 결제완료 후 다음날부터 3일이내 출고 됩니다. (토,일,공휴일
							제외)</li>
						<li>상품 출고일은 상품/지역/업체별 상황에 따라 변경될 수 있으며, 주문량 증가 시 배송이 지연될 수
							있습니다.</li>
						<li>냉장·냉동·신선제품은 신선도 유지를 위해 제주도 및 도서산간 지역의 배송이 제한될 수 있습니다.</li>
						<li>고객님의 주소 기입 오류, 임의 수취거부, 고객 부재로 인해 반송될 경우 배송비가 청구될 수 있습니다.</li>
						<li>주문 수량이 많거나 BOX 제품을 동시에 구매하는 경우, 안전배송을 위해 다수의 박스로 배송될 수
							있으며 택배사 사정에 따라 박스별 배송 일정이 다를 수 있습니다.<br>(나의온마트 &gt; 주문내역/배송현황 &gt;
							[배송현황] 버튼 클릭 시, 출력되는 ‘운송장번호’로 택배 개수 확인 가능)
						</li>
					</ul>
				</div>
				
				
			</div>
		<div class="view v_qna" data-n="v_qna">
			<p class="v_title">주문 변경/취소 안내</p>
				<div class="pic pic44">
					<ul class="dot">
						<li class="d_active">당사 판매 정책 및 제조사 사정에 따라 사전예고 없이 상품 가격변동 혹은
							품절 될 수 있으며, 이로 인한 가격 보상은 불가합니다.</li>
						<li>주문후에는 <span class="c-or">주문상품 및 결제 수단 변경이 불가</span>합니다.
							주문 시 유의해 주시기 바랍니다.
						</li>
						<li>상품이 ‘배송준비’를 시작하면 <span class="c-or">배송지변경, 주문변경,
								주문취소가 불가</span>합니다.
						</li>
						<li>주문진행 단계별 변경 / 취소 가능여부를 확인해 주시기 바랍니다.</li>
					</ul>
					<div class="process">

						<div class="process1">
							<strong class="prcs11">입금대기</strong> <strong class="prcs12">신규주문</strong>
							<div>
								<a class="btn_tp">배송지 변경하기</a>
								<a class="btn_tp">주문취소하기</a>
							</div>
						</div>
						<div class="process2">
							<strong class="prcs21">배송준비</strong> <strong class="prcs22">배송중</strong>
							<p>
								<span class="c-or">배송지변경, 주문변경, 주문취소 불가</span>
							</p>
						</div>
						<div class="process3">
							<strong class="prcs31">배송완료</strong>
							<div>
								<a class="btn_tp">교환하기</a>
								<a class="btn_tp">반품하기</a>
							</div>
						</div>
					</div>
				</div>
		</div>
		
		<div class="view v_refund" data-n="v_refund">
			<p class="v_title">교환반품정보</p>
							<div class="pic pic51">
					<table class="rows" summary="교환 및 반품 안내">
						<colgroup>
							<col width="133">
							<col width="807">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">교환 / 반품 기간</th>
								<td>
									<p class="dot">
										상품 수령일로부터 <span class="c-or">7일 이내</span> (냉장/냉동, 신선식품은 상품
										수령일로부터 <span class="c-or">1~2일 이내</span>)
									</p>
								</td>
							</tr>
							<tr>
								<th scope="row">교환 / 반품<br>불가 안내
								</th>
								<td>
									<p class="dot">다음의 경우 교환 / 반품 기간 내라도 교환 / 반품 불가 (단, 제품 불량
										및 하자, 오배송 제외)</p>
									<ul class="d2">
										<li class="d_active">① 상품 수령일로부터 7일이 경과한 경우</li>
										<li>② <span class="c-bk">고객님의 단순변심으로 교환 / 환불을 신청한
												경우</span></li>
										<li>③ 포장을 개봉하거나 상품을 취식한 경우</li>
										<li>④ <span class="c-bk">패키지 상품, 묶음 상품, 특가 상품의 부분
												교환/반품을 원하는 경우</span></li>
										<li>⑤ 구성품 또는 사은품을 반납하지 않은 경우</li>
										<li>⑥ <span class="c-bk">냉장·냉동·신선제품은 제품하자 이외의 사유로
												인한 교환/반품/취소 절대 불가</span></li>
									</ul>
								</td>
							</tr>
							<tr>
								<th scope="row">교환 / 반품비</th>
								<td>
									<ul class="dot">
										<li class="d_active">고객님의 단순변심으로 인한 교환 / 반품 시, 택배 박스단위로
											배송비 부과
											<ul class="d2">
												<li class="d_active">– 교환 배송비 : <span class="c-or">박스
														당 6,000원</span>(왕복)
												</li>
												<li>– 반품 배송비 : <span class="c-or">박스 당 6,000원</span>(왕복)
													단, 남은 결제금액이 택배비 무료 기준 금액 이상인 경우 3,000원(편도) 부과
												</li>
											</ul>
										</li>
										<li>제품 불량 및 하자, 오배송 시 교환 / 반품비 <span class="c-or">무료</span></li>
									</ul>
								</td>
							</tr>
							<tr>
								<th scope="row">교환/반품 절차</th>
								<td>
									<ul class="dot">
										<li class="d_active">교환/반품 신청 (임의반품 시, 처리불가)
											<ul class="d2">
												<li class="d_active">– [나의 온마트 &gt; 쇼핑정보 &gt; 주문교환 / 반품
													/ 취소신청] 페이지에서 바로 접수
												</li>
												<li>– 고객행복센터 080-850-2000로 신청 (평일 09:00~18:00, 토 / 일 /
													공휴일 휴무)</li>
												<li>– 반품신청 접수 후 필요 시 고객님께 전화를 드리며, 전화상담 후 반품이 최종 결정
													됩니다.</li>
											</ul>
										</li>
										<li>상품불량 및 누락 시, 교환/반품 유의사항
											<ul class="d2">
												<li class="d_active">– 상품불량 및 누락 시 반드시 사진 첨부하여 교환/반품 신청</li>
												<li>– 불량 및 하자 상품은 회수 후 처리 가능하므로 보관</li>
											</ul>
										</li>
										<li>교환/반품 접수 후, 2~5일이내 택배기사님이 방문하여 상품 교환 및 회수 진행</li>
									</ul>
								</td>
							</tr>
							<tr>
								<th scope="row">환불 안내</th>
								<td>
									<ul class="dot">
										<li class="d_active">반품 시, 반품된 상품이 물류센터로 입고되어 검수가 완료되면
											‘취소완료’ 처리 됩니다. 환불은 취소완료 후 영업일 기준 7일이내 처리됩니다.</li>
										<li>현금으로 결제하신 경우 '취소완료' 후 신청하신 환불계좌로 영업일 기준 2~3일 내
											입금됩니다.</li>
										<li>카드로 결제하신 경우 '취소완료' 후 영업일 기준 4~7일이내 승인취소 처리 됩니다.</li>
									</ul>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
		</div>
		<!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">
		
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title" style="font-weight: bold;">장바구니 담기 확인</h4>
					</div>
					<div class="modal-body">
						<p>선택하신 상품이 장바구니에 정상적으로 담겼습니다.</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">쇼핑 계속하기</button>
						<button type="button" class="btn btn-default goCart">장바구니 보기</button>
					</div>
				</div>
		
			</div>
		</div>
	</div>
	</section>
	<c:import url="../tmp/footer.jsp"/>
	
	<script type="text/javascript">
		/****************리뷰 불러오기*******************/
		var pronum = '${productDTO.pronum}';
		var curPage = 1;
		$.ajax({
			url: "review/reviewList",
			type: "POST",
			data:{
				curPage: curPage,
				pronum: pronum
			},
			success: function(data) {
				$(".v_review").html(data);
			}
		});
		
		/****************관련상품 슬라이드 넘기기*******************/
		function picoSlider() {
			var $slider = $(".picoSlider"), 
				$btn = $slider.children("button"), 
				$prev = $slider.children(".prev"), 
				$next = $slider.children(".next"), 
				$inner = $slider.children(".picoInner"), 
				$cntW = $slider.children(".count"), 
				$cnt = $cntW.children("strong"), 
				$ul = $inner.children("ul"), 
				$li = $ul.children("li");
				liL = $li.length, 
				liw = $li.outerWidth(), 
				innerW = $inner.outerWidth(), cnt = 0;
			//initial
			$ul.width(liL * (liw + 66)); //li의 갯수 * li의 width (margin 포함)
			$cntW.children("span").text(Math.ceil(liL / 5));
			$cnt.text(cnt + 1);
			$btn.click(function() {
				var ml = parseInt($ul.css("marginLeft") / 5);
				if ($(this).hasClass("prev")) {
					if (cnt == "0") {
						return;
					} else {
						cnt--;
					}
					;
				} else if ($(this).hasClass("next")) {
					if (cnt == Math.ceil(liL / 5) - 1) {
						return;
					} else {
						cnt++;
					}
					;
				} else {
					alert("I see dead peaple.");
				}
				;
				ml = -cnt * ((liw + 66) * 5); //슬라이드 넘기기 ()
				$cnt.text(cnt + 1);
				//easeInCubic
				$ul.stop(false, true).animate({
					marginLeft : ml
				}, 300);
			});
		};
		picoSlider();

		/******** wheelscroll  ************/
		var topHeadHeight = -20; //header height
		var marginHeight = $('.view_menu').height();
		var trigger = $('.view_menu').offset().top;
		$(window).scroll(function() {
			//메뉴고정
			var scroll = $(window).scrollTop();
			if (scroll > trigger - topHeadHeight) {
				$('.view_menu').css({
					'position' : 'fixed',
					'top' : topHeadHeight,
					'left' : '0px',
					'right' : '0px'
				});
				$('header').css('margin-bottom', marginHeight);
			} else {
				$('.view_menu').css('position', 'static');
				$('header').css('margin-bottom', 0);
			};
			
			//메뉴 색상
		    $('.view').each(function() {
		        if(scroll >= $(this).offset().top - 80) {
		            var id = $(this).attr('data-n');
		            $('.vmenu').removeClass('active');
		            $("div[data-m='"+id+"']").addClass('active');
		        }
		    });
			
		});
		
		/********** 새로고침시 스크롤 이동 **********/
		window.onload=function(){
			setTimeout(function() {
				scrollTo(0,0);
			}, 1);
			
		}

		/*********** 메뉴 클릭 **********/
		$(".vmenu").click(function() {
			//스크롤 이동
			var menu = $(this).attr("data-m");
			var offset = $("." + menu).offset();
			$('html, body').animate({
				scrollTop : offset.top - 70
			}, 400);
		});
		
		/*********** 장바구니 클릭 시 등록 후 모달 **********/
		$(".cartBtn").click(function() {
			var path = '';
			var proAmount = $(".proAmount").val().replace("개","")*1;
			var pronum = '${productDTO.pronum}';
			$("#amount").val(proAmount);			
			var memberid = '${memberDTO.email}';
			if(memberid == ''){
				path = "cart/cartNMInsert";
			}else{
				path = "cart/cartMInsert";
			}
			$.ajax({
				url: path,
				type: "POST",
				async: false,
				data: {
					amount: proAmount,
					memberid: memberid,
					pronum: pronum
				},
				success: function(data) {
					$('#myModal').modal();
				}
			});
		});
		
		/*********** 장바구니 이동 **********/
		$(".goCart").click(function() {
			location.href="cart/productCart";
		});
		
		/*********** 바로구매 클릭 **********/
		$(".payBtn").click(function() {
			var pNumList = new Array();
			var pAmountList = new Array();
			var memberid = '${memberDTO.email}';
			pNumList[0] = '${productDTO.pronum}';
			pAmountList[0] = $(".proAmount").val().replace("개","")*1;
			if(memberid == ''){
				//로그인창 trigger
				location.href="../member/login?path=/product/productView?pronum=${productDTO.pronum}";
			}else{
				payFrm.pNumList.value = pNumList;
				payFrm.pAmountList.value = pAmountList;
				payFrm.method = "POST";
				payFrm.action = "pay/payView";
				payFrm.submit();
			}
		});
		
		
		$(".btn_tp").click(function() {
			if('${memberDTO}' == ''){
				alert("로그인이 필요한 서비스입니다.");
			}else{
				
			}
		});
		
		$(".goView").click(function() {
			var pronum = $(this).attr("data-pronum");
			location.href = "productView?pronum="+pronum;
		});
	</script>
</body>
</html>