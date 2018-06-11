<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<div class="sort_wrap">
		<div>
			<span class="sort_left">총 <em>${totalCount}건</em>의 제품이 있습니다.</span>
			<span class="sort_right">
				<c:if test="${rowMaker.cate_major eq ''}">
					전체 상품
				</c:if>
				<c:if test="${rowMaker.cate_major ne ''}">
					<c:if test="${rowMaker.cate_minor ne ''}">								
						${rowMaker.cate_major} - ${rowMaker.cate_minor}
					</c:if>
					<c:if test="${rowMaker.cate_minor eq ''}">								
						${rowMaker.cate_major}
					</c:if>
					
				</c:if>
				
			</span>
		</div>
	</div>
	
	<div class="pro_list">
		<c:forEach items="${productList}" var="dto">			
			<div class="pro_one" data-num="${dto.pronum}">
				<img class="pro_one_img" alt="" src="../resources/upload/${dto.f_mainimg}">
				<c:if test="${dto.amount eq 0}">
				<div class="soldout_ico">
					<img alt="" src="../resources/images/csy/ico_soldout.png" class="soldout_img">
				</div>
				</c:if>
				<div class="pro_one_intro">
					<div class="pro_name">${dto.name}</div>
					<p class="pro_price">
						<span class="price_title">판매가</span>
						<c:if test="${dto.amount eq 0}">
						<img alt="" src="../resources/images/csy/ico_soldout.gif" class="soldout">
						</c:if>
						<span class="price"><fmt:formatNumber value="${dto.price}" groupingUsed="true"/></span>
						<span class="price_one">원</span>
					</p>
				</div>
				<div class="pro_hover">
					<c:if test="${memberDTO.grade eq 2}">
						<div class="proUpdate" data-p="${dto.pronum}">상품정보 수정하기</div>
						<div class="proDelete" data-p="${dto.pronum}">X</div>
					</c:if>
					<c:if test="${memberDTO.grade ne 2 || memberDTO eq null}">
						<c:if test="${dto.amount eq 0}">
							<div>품절</div>
						</c:if>
						<c:if test="${dto.amount ne 0}">
							<div onclick="cartInsert(${dto.pronum});">장바구니 바로담기</div>						
						</c:if>
					</c:if>
					
					<button type="button" data-toggle="modal" data-target="#myModal" class="cartBtn"></button>
				</div>
			</div>
		</c:forEach>					
	</div>
	<div class="clear"></div>
	<div class="paging">
		<c:if test="${makePage.totalBlock > 1}">
		<span class="first scollEv" onclick="paging(1)"><img src="../resources/images/csy/prev_arr_off.gif"></span>
		</c:if>
		<c:if test="${makePage.curBlock>1}">
		<span class="prev scollEv" onclick="paging(${makePage.startNum-1})"><img src="../resources/images/csy/prev_off.gif"></span>
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
			<span class="next scollEv" onclick="paging(${makePage.lastNum+1})">
				<img src="../resources/images/csy/next_off.gif">
			</span>
		</c:if>
		<c:if test="${makePage.totalBlock > 1}">
			<span class="last scollEv" onclick="paging(${makePage.totalPage})">
				<img src="../resources/images/csy/next_arr_off.gif">
			</span>
		</c:if>
	</div>
	<!-- Modal -->
	<div class="modal fade proModal" id="myModal" role="dialog">
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

	<script type="text/javascript">
		/*********** 상품 한 개 클릭(View 페이지 이동) **********/
		$(".pro_one_img, .pro_name, .soldout_img").click(function() {
			var pronum = $(this).parents(".pro_one").attr("data-num");
			location.href="productView?pronum="+pronum;
		});
		
		/*********** product list Hover **********/
		$(".pro_one").hover(function() {
			$(this).find(".pro_hover").css("display","block");
		}, function() {
			$(this).find(".pro_hover").css("display","none");
		});
		
		/*********** 페이지 이동 시 스크롤 처리 **********/
		$(".scollEv").click(function() {
			var offset = $(".main_menu").offset();
			$('html, body').animate({scrollTop: offset.top-110}, 20);
		});
		
		/*********** 장바구니 이동 **********/
		$(".goCart").click(function() {
			location.href="cart/productCart";
		});
		
		/*********** 관리자 계정으로 상품 수정 **********/
		$(".proUpdate").click(function() {
			var pronum = $(this).attr("data-p");
			location.href= "productUpdate?pronum="+pronum;
		});
		$(".proDelete").click(function() {
			var pronum = $(this).attr("data-p");
			var con = confirm("상품을 삭제하시겠습니까?");
			if(con){
				location.href= "productDelete?pronum="+pronum;				
			}
		});
		
		/*********** 카테고리에 따른 페이징 처리 **********/
		function paging(curPage) {			
			var major = '${rowMaker.cate_major}';
			var minor = '${rowMaker.cate_minor}';
			$.ajax({
				url: "productList_wrap",
				type: "POST",
				data: {
					curPage: curPage,
					cate_major: major,
					cate_minor: minor
				},
				success: function(data) {
					setTimeout(function() {
						var offset = $(".main_menu").offset();
						scrollTo(offset.top-110, 0);
					}, 200);
					$(".wrap").html(data);
				}
			});
		}
		
		/*********** 장바구니 담기 **********/
		function cartInsert(pronum) {
			var memberid = '{memberDTO.email}';
			$.ajax({
				url: "cart/cartNMInsert",
				type: "POST",
				async: false,
				data: {
					amount: 1,
					memberid: memberid,
					pronum: pronum
				},
				success: function(data) {
					if(data.trim() != ''){
						
					}else{
						 $('#myModal').modal();
					}
				}
			});
			//
		}
	</script>