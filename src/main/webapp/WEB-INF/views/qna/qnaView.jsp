<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../resources/css/common/reset.css">
<c:import url="../tmp/Bootstrap.jsp" />
<link rel="stylesheet" href="../resources/css/common/basic.css">
<link rel="stylesheet" href="../resources/css/wdh/boardView.css">
<title>Insert title here</title>

</head>
<body>
	<c:import url="../tmp/header.jsp" />
	<!-- section  -->
	<section class="main_section">
		<div class="view-wrap">

			<!-- main -->
			<div class="main-list">
				<div class="inbox">
					<div class="tit-box">
						<div class="fl">
							<table cellspacing="0" cellpadding="0" border="0">
								<tbody>
									<tr valign="top">
										<td nowrap="nowrap"><span class="head m-tcol-p">[제목]</span></td>
										
										<td><span class="b m-tcol-p">${dto.title}</span></td>
										<!-- title -->
									</tr>
								</tbody>
							</table>
						</div>
						<div class="fr">
							<table cellspacing="0" cellpadding="0" border="0">
								<tbody>
								<!-- 등록 날짜 -->
									<tr>
										<td class="m-tcol-c date">${dto.regdate}</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="board-box-line-dashed"></div>
					<div class="etc-box">
						<div class="fl">
							<table cellspacing="0" cellpadding="0" border="0">
								<tbody>
									<tr>
										<td class="m-tcol-c b nick"><a href="#" class="m-tcol-c b"> 글쓴이 ${dto.writer}</a></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="h-10"></div>

					<div class="tbody m-tcol-c" id="tbody">${dto.contents}</div>
				</div>
			</div>
			
			<!------------------------------------------------ 업데이트, 목록 --------------------------------------------------------------->
			<div class="list-btn-nor">
				<div class="fr">
					<%-- <c:if test="${dto.writer eq member.id or member.id eq 'admin'}"> --%>
					<%-- <div id="updateBtn" class="btn_view _rosRestrict">
						<span></span>
						<p><a href="qnaUpdate?num=${dto.num}" class="m-tcol-c">수정</a></p>
					</div> --%>
					
					<%-- <div id="deleteBtn" class="btn_view _rosRestrict">
						<span></span>
						<p><a href="qnaDelete?num=${dto.num}" class="m-tcol-c">삭제</a></p>
					</div> --%>
					<%-- </c:if> --%>
					<%-- <c:if test="${not empty member}"> --%>
						<%-- <div id="updateBtn" class="btn_view _rosRestrict">
							<span></span>
							<p><a href="qnaReply?num=${dto.num}&id=${nickName}" class="m-tcol-c">답글</a></p>
						</div> --%>
					<%-- </c:if> --%>
										
					<%-- <div class="btn_view">
						<span></span>
						<p><a href="${pageContext.request.contextPath}/qna/qnaList" class="m-tcol-c"><img src="">목록</a></p>
					</div> --%>
					<c:if test="${dto.writer eq memberDTO.nickName}">
						<a href="qnaUpdate?num=${dto.num}" class="m-tcol-c"><button class="btn btn-default">수정</button></a>
						<a href="qnaDelete?num=${dto.num}" class="m-tcol-c"><button class="btn btn-default">삭제</button></a>
					</c:if>
					<c:if test="${memberDTO.grade > 1}">
						<a href="qnaReply?num=${dto.num}&id=${nickName}" class="m-tcol-c"><button class="btn btn-default">답글</button></a>
					</c:if>
					<a href="${pageContext.request.contextPath}/qna/qnaList" class="m-tcol-c"><button class="btn btn-default">목록</button></a>	
				</div>
			</div>

			<!-- 공간여백 -->
			<div class="h-20"></div>

			<!-- top -->
			<!-- <div class="btn-top">
				<a href="#" class="m-tcol-c_ filter-50 display-inblock"><span>▲</span>top</a>
			</div> -->

			<!-- 공간여백 -->
			<div class="h-35"></div>

			<!-- tabel 감싸는 div -->
			<div class="article-board article_prenet">
				<table cellspacing="0" cellpadding="0" border="0" width="100%">
					<colgroup>
						<col width="81">
						<col width="*">
						<col width="120">
						<col width="92">
					</colgroup>
					<tbody>
						<tr>
							<td colspan="4" class="board-line"></td>
						</tr>
						<c:if test="${before ne null}">
						<tr align="center">
							<td class="prev_btn"><a href="#" class="m-tcol-c"><img
									src="http://cafeimgs.naver.net/cafe4/ico-btn-pre2_.gif">이전글</a></td>
							<td align="left" class="board-list"><span class="aaa">
									<a href="qnaView?num=${before.num}" class="m-tcol-c">${before.title}</a>
								<!-- 이전글 title -->
								<%-- <c:if test="${empty before.rep_pic}">
								<input type="text" class="list-i-img"readonly="readonly" title="사진">
								</c:if> --%>
								<!-- 사진이 있으면 표시 --> 
								<c:if test="${before.regdate eq sysdate}">
								<!-- <input type="text" class="list-i-new" readonly="readonly" title="new"> -->
								</c:if>
								<!-- -새로운글N표시 -->
							</span></td>

							<td align="left">
								<div class="pers_nick_area">
									<span class="wordbreak" id="refarticle_prevSiblingContent">${before.writer}</span>
								</div>
							</td>
							<td class="view-count m-tcol-c">${before.regdate}</td>
						</tr>
						</c:if>



						
						<tr>
							<td colspan="4" class="board-line"></td>
						</tr>

						<c:if test="${after ne null}">
							<tr align="center">
								<td class="prev_btn"><a href="#" class="m-tcol-c"><img src="http://cafeimgs.naver.net/cafe4/ico-btn-net2_.gif">다음글</a></td>
									<td align="left" class="board-list"><span class="aaa">
										<a href="qnaView?num=${after.num}" class="m-tcol-c">${after.title}</a>
									<!-- 이전글 title -->
									<%-- <c:if test="${empty after.rep_pic}">
									<input type="text" class="list-i-img" readonly="readonly" title="사진">
									</c:if> --%>
									<!-- 사진이 있으면 표시 -->
									<c:if test="${before.regdate eq sysdate}">
									<!-- <input type="text" class="list-i-new" readonly="readonly" title="new"> -->
									</c:if>
									<!-- -새로운글N표시 -->
								</span></td>
	
								<td align="left">
									<div class="pers_nick_area">
										<span class="wordbreak" id="refarticle_prevSiblingContent">${after.writer}</span>
									</div>
								</td>
								<td class="view-count m-tcol-c">${after.regdate}</td>
							</tr>
						</c:if>


						<tr>
							<td colspan="4" class="board-line"></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</section>
	<c:import url="../tmp/footer.jsp" />
</body>
</html>