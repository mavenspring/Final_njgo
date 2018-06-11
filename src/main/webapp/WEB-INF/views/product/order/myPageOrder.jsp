<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<link rel="stylesheet" href="../../resources/css/csy/product/productOrderMyPage.css">
</head>
<body>
		<div class="orderTitle">
			<h2>주문 내역</h2>
		</div>
		<div class="orderTable">
			<table class="cart_sts">
				<tbody>
					<tr class="sts_top" height="50px;">
						<td width="20%">주문일자<br>[주문번호]</td>
						<td width="10%">이미지</td>
						<td width="35%">상품정보</td>
						<td width="5%">수량</td>
						<td width="15%">상품구매금액</td>
						<td width="15%">주문처리상태</td>
					</tr>
					<c:forEach items="${orderList}" var="dto" varStatus="i">
						<c:forEach items="${proList[i.index]}" var="arr" varStatus="j">
							<tr class="sts_one" height="50px;">
								<c:if test="${j.index eq 0}"><td rowspan="${fn:length(proList[i.index])}">${dto.o_date }<br>[<fmt:formatDate value="${dto.o_date}" pattern="yyyyMMdd"/>-${dto.num}]</td></c:if>								
								<td height="100px"><img src="../../resources/upload/${proList[i.index][j.index].f_mainimg }" class="ordImg" data-num="${proList[i.index][j.index].pronum }"></td>
								<td><div class="proName" data-num="${proList[i.index][j.index].pronum }">${proList[i.index][j.index].name}</div></td>
								<td>${amountList[i.index][j.index]}</td>
								<td>
									<fmt:formatNumber value="${proList[i.index][j.index].price * amountList[i.index][j.index]}" groupingUsed="true"/>원
									<c:if test="${dto.status ne '입금대기' && reviewList[i.index][j.index] eq 0}"><br> 
										<button type="button" class="review" data-r="${proList[i.index][j.index].pronum}" data-n="${proList[i.index][j.index].name}" data-i="${proList[i.index][j.index].f_mainimg}" data-onum="${dto.num}">구매후기</button>
									</c:if>
								</td>
									
								<c:if test="${j.index eq 0}">
									<td rowspan="${fn:length(proList[i.index])}">${dto.status } 
									
									</td>
								</c:if>
							</tr>
						</c:forEach>					
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="clear"></div>
		<div class="paging_sy">
			<c:if test="${makePage.totalBlock > 1}">
			<span class="first scollEv" onclick="paging(1)"><img src="../../resources/images/csy/prev_arr_off.gif"></span>
			</c:if>
			<c:if test="${makePage.curBlock>1}">
			<span class="prev scollEv" onclick="paging(${makePage.startNum-1})"><img src="../../resources/images/csy/prev_off.gif"></span>
			</c:if> 
			<span class="numbering">
				<c:forEach begin="${makePage.startNum}" end="${makePage.lastNum}" var="i">
					<c:if test="${i eq curPage}">
						<c:if test="${i ne makePage.lastNum}">
							<strong>${i}</strong>&nbsp;
						</c:if>
						<c:if test="${i eq makePage.lastNum}">
							<strong class="last">${i}</strong>&nbsp;
						</c:if>
						
					</c:if>
					<c:if test="${i ne curPage}">
						<c:if test="${i ne makePage.lastNum}">
							<a onclick="paging(${i})" class="scollEv">${i}</a>&nbsp;
						</c:if>
						<c:if test="${i eq makePage.lastNum}">
							<a onclick="paging(${i})" class="last scollEv">${i}</a>&nbsp;
						</c:if>
					</c:if>							
				</c:forEach>
			</span> 
			<c:if test="${makePage.curBlock < makePage.totalBlock}">
			<span class="next scollEv" onclick="paging(${makePage.lastNum+1})"><img src="../../resources/images/csy/next_off.gif"></span>
			</c:if>
			<c:if test="${makePage.totalBlock > 1}">
			<span class="last scollEv" onclick="paging(${makePage.totalPage})"><img src="../../resources/images/csy/next_arr_off.gif"></span>
			</c:if>
		</div>
		<!-- Modal -->
		<div class="modal fade" id="reviewModal" role="dialog" aria-hidden="false">
			<div class="modal-dialog">		
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close closeBtn" data-dismiss="modal">&times;</button>
						<h4 class="modal-title" style="font-weight: bold;">한줄 후기 남기기</h4>
					</div>
					<div class="modal-body">
						<div>
							<div class="proInfo">
								<img src="../../resources/images/csy/quotation-mark.png" class="qImg"><span></span><img src="../../resources/images/csy/quotation-right-mark.png" class="qImg"><br>
								<img alt="" src="" class="proImg">
							</div>
							<div class="rating">
								<img src="../../resources/images/csy/star.png" data-c="off">
								<img src="../../resources/images/csy/star.png" data-c="off">
								<img src="../../resources/images/csy/star.png" data-c="off">
								<img src="../../resources/images/csy/star.png" data-c="off">
								<img src="../../resources/images/csy/star.png" data-c="off">
							</div>
							<div class="reviewWrap">
								<input type="text" maxlength="49" class="reviewText" placeholder="한줄 리뷰를 남겨주세요.">
								<span><em class="reviewCnt">0</em>/50</span>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default reviewWrite">후기남기고 적립금 받기</button>
						<button type="button" class="btn btn-default closeBtn" data-dismiss="modal">닫기</button>
					</div>
				</div>
		
			</div>
			<form action="../../product/review/reviewInsert" method="post" name="rfrm">
				<input type="hidden" name="memberid" id="memberid" value="${memberDTO.email}">
				<input type="hidden" name="pronum" id="pronum">
				<input type="hidden" name="contents" id="contents">
				<input type="hidden" name="rating" id="rating">
				<input type="hidden" name="ordernum" id="ordernum">
			</form>
		</div>
		<script>
			/****************** 상품 이미지나 이름 클릭시 이동 *********************/
			$(".ordImg, .proName").click(function() {
				var pronum = $(this).attr("data-num");
				location.href="../../product/productView?pronum="+pronum;
			});
			
			/****************** 리뷰남기기 버튼 클릭. 모달띄우기 *********************/
			$(".review").click(function() {
				$('#reviewModal').modal({backdrop: 'static'});
				var pronum = $(this).attr("data-r");
				var name = $(this).attr("data-n");
				var img = "../../resources/upload/" + $(this).attr("data-i");
				var ordernum = $(this).attr("data-onum");
				$("#pronum").val(pronum);
				$(".proInfo span").html(name);
				$(".reviewText").val('');
				$(".proImg").attr("src", img);
				$(".reviewCnt").html(0);
				$("#ordernum").val(ordernum);
			})
			
			/****************** 별점주기 이벤트 *********************/
			$(".rating img").mouseover(function() {
				if($(this).attr("data-c") == 'off'){
					$(this).attr("src", "../../resources/images/csy/star_full.png").attr("data-c", "on");
					$(this).prevAll().attr("src", "../../resources/images/csy/star_full.png").attr("data-c", "on");
				}else{
					$(this).attr("src", "../../resources/images/csy/star.png").attr("data-c", "off");
					$(this).nextAll().attr("src", "../../resources/images/csy/star.png").attr("data-c", "off");
				}				
			});
			$(".rating img").click(function() {
				$(".rating img").attr("data-c", "off");
				$(this).attr("data-c", "on").attr("src", "../../resources/images/csy/star_full.png");
				$(this).prevAll().attr("data-c", "on").prevAll().attr("src", "../../resources/images/csy/star_full.png");
			});
			
			/****************** 한줄평 작성 시 글자수 체크 *********************/
			$(".reviewText").on("keyup keydown",function() {
				var contents = $(this).val();
				$(".reviewCnt").html(contents.length);
			});
			
			/****************** 작성 완료 *********************/
			$(".reviewWrite").click(function() {
				var pronum = $("#pronum").val();
				var memberid = $("#memberid").val();
				var rating = $("img[data-c='on']").length;
				$("#rating").val(rating);				
				var contents = $(".reviewText").val();
				$("#contents").val(contents);			
				var ordernum = $("#ordernum").val()
				
				if(contents == ''){
					alert("한줄 리뷰를 작성해주세요.")
				}else{
					$.ajax({
						url: "../../product/review/reviewInsert",
						type: "POST",
						async: false,
						data: {
							pronum: pronum,
							memberid: memberid,
							contents: contents,
							rating: rating,
							ordernum: ordernum
						},
						success: function(data) {
							$(".close").click();
							alert("리뷰 작성이 완료되었습니다. 감사합니다!");
						},
						complete: function() {
							var curPage = '${curPage}';
							$.ajax({
								url: "../../product/order/orderMyPage",
								type: "POST",
								data: {
									curPage: curPage,
									memberid: memberid
								},
								success: function(data) {
									$(".in_mypage").html(data);
								}
							});
						}
					});
					
				}
			});
			
			/****************** 닫기 버튼 클릭시 모달내용 초기화 *********************/
			$(".closeBtn").click(function() {
				$(".rating img").attr("data-c", "off").attr("src", "../../resources/images/csy/star.png");
				$(".reviewText").val("");
				$("#contents").val("");
				$("#rating").val("");
			});
			
			/****************** 페이징 처리 *********************/
			function paging(curPage) {
				var memberid = '${memberDTO.email}';
				$.ajax({
					url: "../../product/order/orderMyPage",
					type: "POST",
					data: {
						curPage: curPage,
						memberid: memberid
					},
					success: function(data) {
						$(".in_mypage").html(data);
					}
				});
			}
		</script>
</body>
</html>