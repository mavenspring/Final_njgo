<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common/reset.css">
<c:import url="../tmp/Bootstrap.jsp"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common/basic.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/kdy/member/sample.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/kdy/member/sample2.css">
<script type="text/javascript">
	if("${memberDTO}"==""){
		alert("로그인 해주세요.");
		location.href="login";
		
	}
</script>
</head>

<body>
	<c:import url="../tmp/header.jsp"/>

	<section class="main_section">
			<div class="container_etc" style="width:500px;">
  <h2>회원탈퇴</h2>
	  <div class="panel-body">
	    <form name="form_check" id="delete_form" method="post" action="memberDelete">
	    <p class="help-block">
	        탈퇴하면 앞으로 이 계정으로 로그인할 수 없고 이 계정을 다시 복구할 수 없습니다.<br>
	        * 가입정보를 변경하고 싶다면 <a href="info_correct">회원정보수정</a>에서 변경할 수 있습니다.<br>
	        * 공공의 성격을 가진 게시물은 탈퇴 후에도 삭제되지 않으므로 반드시 직접 삭제하신 후 탈퇴해 주시기 바랍니다.<br><br>
	        <strong>탈퇴하려면 아래 확인버튼을 클릭해주세요.</strong></p>
	        <c:if test="${memberDTO.login_mode eq 'general_join' }">
			    <input type="hidden" name="email" value="${memberDTO.email }">
		        <input type="hidden" id="pw" name="pw" value="${memberDTO.pw }">    	
	        </c:if>
	        <input type="hidden" name="login_mode" value="${memberDTO.login_mode }">
	        <c:if test="${memberDTO.login_mode eq 'SNS_join' }">
	        	 <input type="hidden" name="kakaoID" value="${memberDTO.kakaoID }">
	        </c:if>
	        <div class="etc_line"></div>
	      <button type="button" class="btn btn-primary btn-block btn-lg" id="delete_btn" onclick="withdrawal()">확 인</button>
	    </form>
	  </div>
	</div>
	</section>
	
	<c:import url="../tmp/footer.jsp"/>
</body>
<script>
		function withdrawal() {
		
					
			// 카카오 아이디 회원탈퇴일경우 
			if("${memberDTO.login_mode}" =='SNS_join'){
				// 메세지 보내기 
				Kakao.API.request({
					url : "/v2/api/talk/memo/send", 
					data : {
						template_id : 4991
					},
					success : function(data) {	
					}
				});
				
				 //앱연결 끊어주기
				Kakao.API.request({
						url :"/v1/user/unlink",
						success : function(res) {	
							if(res.id =="${memberDTO.kakaoID}"){
								 $("form").submit();
							}
							else{
								alert("응?..카카오아이디 값이 다름");
							}
						}
				}); 
			}
			else{
				$("form").submit();			
			}	
		}
	</script>
</html>