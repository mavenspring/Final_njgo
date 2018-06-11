<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>
		<ul class="lst_follow">
			<!-- 팔로잉 리스트 -->
			<c:forEach items="${f_List }" begin="${listInfo.startRow-1 }" var="list" step="1" end="${listInfo.lastRow-1 }" varStatus="i">
				<li>
					<div class="user_follow">
						<!-- ============================  이미지 START===================================== -->
						<!-- SNS 회원    -->
						<c:if test="${list.login_mode eq 'SNS_join' }">
						      <!-- 카카오 프로필 사진 유무 -->
						      <!-- 맨처음 가입하면 카카오 프로필 사진으로 저장됨, 하지만 프로필 설정에서 
						      이미지를 바꾸면 서버에 저장되있는 경로로가서 이미지를 가져옴  -->
							<c:choose>
								<c:when test="${list.myPhoto eq 'sns'  }">
									<c:if test="${list.myPhoto eq null }">
										<img style="width:100px;border-radius: 50%;" src="${pageContext.request.contextPath}/resources/images/common/default.png" id="memberBtn">
									</c:if>
									<c:if test="${list.myPhoto ne null }">
										<img alt="회원" style="width:100px;border-radius: 50%;" src="${list.sns_photo }" id="memberBtn">	
									</c:if>
								</c:when>

								<c:when test="${list.myPhoto != 'sns' }">
									<c:if test="${list.myPhoto ne null }">
										<img style="width:100px;border-radius: 50%;" src="${pageContext.request.contextPath}/resources/upload/${list.myPhoto}" id="memberBtn">
									</c:if>
									<c:if test="${list.myPhoto eq null }">
										
									<img style="width:100px;border-radius: 50%;" src="${pageContext.request.contextPath}/resources/images/common/default.png" id="memberBtn">
									</c:if>
								</c:when>
							</c:choose>
							
						</c:if>
						<!-- 일반회원   -->
						<c:if test="${list.login_mode eq 'general_join' }">
							
								<c:if test="${list.myPhoto eq '' || list.myPhoto eq null }">
									<img alt="회원" style="width:100px;border-radius: 50%;" src="${pageContext.request.contextPath}/resources/images/common/default.png"
									 id="memberBtn">
								</c:if>
								<c:if test="${list.myPhoto ne null }">
									<img alt="회원" style="width:100px;border-radius: 50%;" src="${pageContext.request.contextPath}/resources/upload/${list.myPhoto}"	
									 id="memberBtn">
								</c:if>		
						</c:if>
						<!-- ============================  이미지  END ===================================== -->
						<strong><a href="myPage?nickName=${list.nickName }">${list.nickName }</a></strong>
						<div class="follow">
							<em>${following_count.get(i.count-1) }명</em>이 팔로잉
							
						</div>
	
					</div>
					<div class="thmb_follow"></div>
				</li>
			</c:forEach>
		</ul>
		<!-- ============================================== 페이징 ====================================  -->
		<%-- <div class="pageing" style="text-align: center;">
			  <ul class="pagination" > 
			  <c:if test="${listInfo.curBlock > 1 }">
					<li><a href="followList?curPage=1">&lt&lt</a></li>
					<li><a href="followList?curPage=${listInfo.startNum-1}">이전</a></li>
			  </c:if>
					<c:forEach begin="${listInfo.startNum }" step="1" end="${listInfo.lastNum }" var="i" >
					    <li id="curPage${i}"><a role="button" onclick="followingList(${i})">${i }</a></li>
					</c:forEach>
			  <c:if test="${listInfo.curBlock < listInfo.totalBlock }">
				    <li><a href="followList?curPage=${listInfo.lastNum+1}">다음</a></li>
				    <li><a href="followList?curPage=${listInfo.lastNum}">&gt&gt</a></li>
			  </c:if>
			  </ul>
		</div> --%>
		
		<div class="paging_sy">
			<c:if test="${listInfo.totalBlock > 1}">
			<span class="first scollEv" onclick="followingList(1)"><img src="../../resources/images/csy/prev_arr_off.gif"></span>
			</c:if>
			<c:if test="${listInfo.curBlock>1}">
			<span class="prev scollEv" onclick="followingList(${listInfo.startNum-1}))"><img src="../../resources/images/csy/prev_off.gif"></span>
			</c:if> 
			<span class="numbering">
				<c:forEach begin="${listInfo.startNum}" end="${listInfo.lastNum}" var="i">
					<c:if test="${i eq listInfo.curPage}">
						<c:if test="${i ne listInfo.lastNum}">
							<strong>${i}</strong>&nbsp;
						</c:if>
						<c:if test="${i eq listInfo.lastNum}">
							<strong class="last">${i}</strong>&nbsp;
						</c:if>						
					</c:if>
					<c:if test="${i ne listInfo.curPage}">
						<c:if test="${i ne listInfo.lastNum}">
							<a onclick="followingList(${i})" class="scollEv">${i}</a>&nbsp;
						</c:if>
						<c:if test="${i eq listInfo.lastNum}">
							<a onclick="followingList(${i})" class="last scollEv">${i}</a>&nbsp;
						</c:if>
					</c:if>							
				</c:forEach>
			</span> 
			<c:if test="${listInfo.curBlock < listInfo.totalBlock}">
			<span class="next scollEv" onclick="followingList(${listInfo.lastNum+1})"><img src="../../resources/images/csy/next_off.gif"></span>
			</c:if>
			<c:if test="${makePage.totalBlock > 1}">
			<span class="last scollEv" onclick="followingList(${listInfo.lastNum})"><img src="../../resources/images/csy/next_arr_off.gif"></span>
			</c:if>
		</div>
</body>
<script type="text/javascript">
$("#curPage${listInfo.curPage}").addClass("active");
</script>
</html>