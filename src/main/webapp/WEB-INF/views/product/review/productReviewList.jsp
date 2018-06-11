<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<p class="v_title">
		상품평 <span class="v_num">(${totalCount})</span>
	</p>
	<table id="js-review-board-table" class="goods-review--board" border="1">
		<colgroup>
			<col width="218px">
			<col>
			<col width="225px">
			<col width="89px">
		</colgroup>
		<tbody>
			<c:forEach items="${reviewList}" var="dto">
				<tr class="preview js-data-row" data-bdid="goodsreview" data-sno="616" data-auth="y">
					<td class="__border"><span class="__border-span"></span> 평점 <span
						class="review-star review-star${dto.rating}">5점</span></td>
					<td class="__border __left"><span class="__border-span"></span>
						${dto.contents }</td>
					<td class="__third"><c:out
							value="${fn:replace(dto.memberid,fn:substring(dto.memberid,5,fn:length(dto.memberid)),'**********')}" />
						<%-- ${dto.memberid } --%></td>
					<td class="__fourth">${dto.reg_date }</td>
				</tr>
			</c:forEach>
			<c:if test="${fn:length(reviewList) eq 0}">
				<tr class="preview js-data-row" data-bdid="goodsreview" data-sno="616" data-auth="y">
					<td class="__border" colspan="4" style="height: 100px; font-size: 15px; font-style: italic;">등록된 리뷰가 없습니다.</td>
				</tr>
			</c:if>
		</tbody>
	</table>

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
		<span class="next scollEv" onclick="paging(${makePage.lastNum+1})"><img src="../resources/images/csy/next_off.gif"></span>
		</c:if>
		<c:if test="${makePage.totalBlock > 1}">
		<span class="last scollEv" onclick="paging(${makePage.totalPage})"><img src="../resources/images/csy/next_arr_off.gif"></span>
		</c:if>
	</div>
	
	<script type="text/javascript">
	/****************** 페이징 처리 *********************/
		function paging(curPage) {
			var pronum = '${productDTO.pronum}';
			$.ajax({
				url: "productList_wrap",
				type: "POST",
				data: {
					curPage: curPage,
					pronum: pronum
				},
				success: function(data) {
					$(".v_review").html(data);
				}
			});
		}
	</script>
</body>
</html>