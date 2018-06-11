<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>N.J.GO</title>
<style type="text/css">
	.main_section {
		margin-top: 130px;
	}
	
	#wrap {
		width: 600px;
		height: 618px;
		min-height: 618px;
		margin: 0 auto;
		text-align: left;
	}
	
	#header {
		overflow: hidden;
		position: relative;
		text-align: center;
	}
	
	#container {
		padding: 33px 20px 0 81px;
	}
	
	#container h2 {
		margin-bottom: 24px;
		font: bold 16px/1.6em 돋움, Dotum;
		letter-spacing: -1px;
	}
	
	#footer .menu {
		overflow: hidden;
		width: 100%;
		color: #d7d7d7;
		font-family: 돋움, Dotum;
		letter-spacing: -1px;
		text-align: right;
		margin-top: -65px;
	}
	
	#footer .menu a {
		margin: 0 3px;
		color: #444;
		text-decoration: none;
		font-size: 15px;
		font-weight: bold;
	}
	
	#container .content p {
		margin-bottom: 10px;
		font-size: 13px;
		letter-spacing: -0.5px;
	}
	
	#footer {
		margin-top: 80px;
		text-align: right;
	}
	
	#footer h1 {
		text-align: left;
	}
	
	#footer address {
		font: 9px/14px Verdana;
		margin-top: -10px;
	}
	
	#footer address em {
		padding-left: 6px;
		font: 9px verdana;
	}
	
	#footer address span {
		padding-left: 2px;
		font: 9px/14px Verdana;
	}
</style>
</head>
<body>
	<section class="main_section">
		<div id="wrap">
			<div id="header">
				<img alt="" src="${pageContext.request.contextPath}/resources/images/common/warning.png">
			</div>
			<div id="container">
				<h2>
					죄송합니다.<br>요청하신 페이지를 찾을 수 없습니다.
				</h2>
				<div class="content">
					<p>
						방문하시려는 페이지의 주소가 잘못 입력되었거나,<br>페이지의 주소가 변경 혹은 삭제되어 요청하신 페이지를
						찾을 수 없습니다.
					</p>
					<p>입력하신 주소가 정확한지 다시 한번 확인해 주시기 바랍니다.</p>
					<p>
						관련 문의사항은 <a href="">Q＆A 게시판</a>에 알려주시면 친절하게
						안내해 드리겠습니다.
					</p>
					<p>감사합니다.</p>
					<p>${e }</p>
				</div>
			</div>
			<div id="footer">
				<h1>
					<a href="${pageContext.request.contextPath}"> <img
						src="${pageContext.request.contextPath}/resources/images/common/logo_yellow.png"
						width="145" height="50">
					</a>
				</h1>
				<p class="menu">
					<a href="${pageContext.request.contextPath}">냉장GO홈</a> | <a
						href="${pageContext.request.contextPath}">냉장GO 고객센터</a>
				</p>
				<address>
					<em>Copyright ⓒ</em> N.J.GO Corp. <span>All Rights Reserved.</span>
				</address>
			</div>
		</div>
	</section>
</body>
</html>