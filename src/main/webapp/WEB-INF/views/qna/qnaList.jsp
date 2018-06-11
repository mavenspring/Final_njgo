<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/finalProject/resources/css/common/reset.css">
<c:import url="../tmp/Bootstrap.jsp"/>
<link rel="stylesheet" href="/finalProject/resources/css/common/basic.css">
<link rel="stylesheet" href="../resources/css/wdh/boardList.css">

<script type="text/javascript">
   	$(function () {
      
      $(".go").click(function(){ 
         var cur =($(this).attr("id")); 
         location.href="${board}List?curPage="+cur+"&search=${listInfo.search}$find=${listInfo.find}";       
      });
   	});
</script>
<title>Insert title here</title>
<style type="text/css">
.dd{
		border-bottom: 1px solid 
	}
</style>
</head>
<body>
<c:import url="../tmp/header.jsp" />
	<!-- section -->
	<section>
		<div class="main_section">
			<div class="community_wrap">
				<div class="fl c-d-s2">
					<div class="article-board">
						<div class="list-tit">
							<h3 class="m-tcol-t">질문게시판</h3>				
						</div>
						<!-- Table -->
						<table class="boardTable" cellspacing="0" cellpadding="0" border="0"
							class="board-box">
							<%-- <colgroup>
								<!-- NUM -->
								<col width="48">
								<!-- TITLE -->
								<col width="*">
								<!-- WRITER -->
								<col width="55">
								<!-- date -->
								<col width="125">
								<!-- HIT -->
								<col width="42">
							</colgroup> --%>
							<thead>
								<tr>
									<td style="padding-left: 12; width:5%">번호</td>
									<td style="padding-left: 10; width: 60%">제목</td>
									<!--  style="padding: 10 0 8 200;" -->
									<td style="width: 15%; text-align: center;">글쓴이</td>
									<td style="padding: 10 0 8 43; width: 15%">작성일</td>
									<td style="padding-left: 7; width: 5%">조회</td>
								</tr>
								<tr>
									<td colspan="7" class="board-line"></td>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list}" var="list">
								<tr align="center" class="bg-color" style="border-bottom: 1px solid #cccccc;">
									<!-- 공지 -->													
										<td>${list.num}</td>						
									<!-- TITLE -->
									<td align="left" class="board-list" style="font-weight: bold; padding: 10px 0 8px 0;" width=""><span>
										<c:if test="${list.depth > 0 }">										
										<c:forEach begin="1" step="1" end="${list.depth}">
											RE:
										</c:forEach>
										</c:if>
										<a href="qnaView?num=${list.num}" class="m-tcol-p" title="${list.title}" style="color: #ff3c00; margin-left: 10px;" >${list.title}</a>
									</span></td>
									<!-- WRITER -->
									<td style="text-align: center;">
										${list.writer}
									</td>
									<!-- DATE -->
									<td class="m-tcol-c">${list.regdate}</td>
									<!-- HIT -->
									<td class="view-count m-tcol-c">${list.hit}</td>
								</c:forEach>
								<tr>
									<td colspan="7" class="board-line"></td>
								</tr>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div id="main-widget-area">
			<div class="list-btn">
				<div class="fr">
					<c:if test="${not empty memberDTO}">
						<div id="writeFormBtn" class="btn _rosRestrict"><span></span>
							<p>
								<strong>
									<a href="${pageContext.request.contextPath}/qna/qnaWrite?id=${nickName}" class="m-tcol-c">
									<img src="http://cafeimgs.naver.net/cafe4/ico-btn-write.gif" width="10" height="10" alt="">글쓰기</a>
						  	 	</strong>
							</p>
    					</div>
    			</c:if>
				</div>
			</div>
			
				<ul class="com">

				</ul>
			</div>
			
			
			
			
			
			<table width="100%" cellspacing="0" cellpadding="0" border="0">
				<tbody>
					<tr>
						<td class="board-line" style="height: 3px !important;"></td>
					</tr>
				</tbody>
			</table>

			<div class="prev-next">
				<table summary="페이지 네이게이션" class="Nnavi" align="center">
					<tbody>
						<tr>
							<c:if test="${listInfo.curBlock>1}">
      				 			<td class="go" id="${listInfo.startNum-1}">
      				 			<!-- [이전] -->
      				 				<a href="qnaList?curPage=${listInfo.startNum-1}&search=${listInfo.search}&find=${listInfo.find}">[이전]</a>
      				 			</td>
   							</c:if>
  							<c:forEach begin="${listInfo.startNum}" end="${listInfo.lastNum}" var="i">
     				 			<td class="go" id="${i}">
     				 			<%-- ${i} --%>
     				 				<a href="qnaList?curPage=${i}&search=${listInfo.search}&find=${listInfo.find}" class="m-tcol-c">${i}</a>
     				 			</td>
   							</c:forEach>	
   							<c:if test="${listInfo.curBlock < listInfo.totalBlock}">
   								<!-- [다음] -->
      							<td class="go" id="${listInfo.lastNum+1}">
      								<a href="qnaList?curPage=${listInfo.lastNum+1}&search=${listInfo.search}&find=${listInfo.find}">[다음]</a>
      							</td>
   							</c:if>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</section>
<c:import url="../tmp/footer.jsp" />
<script type="text/javascript">
var m = '${message}';
if(m != ''){
		alert(m);
}
</script>
</body>
</html>
