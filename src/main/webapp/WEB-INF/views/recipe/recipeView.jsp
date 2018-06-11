<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>N.J.GO</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/finalProject/resources/css/common/reset.css">
<c:import url="../tmp/Bootstrap.jsp"/>
<link rel="stylesheet" href="/finalProject/resources/css/common/basic.css">
<link rel="stylesheet" href="../resources/css/kdk/Main_Ingre.css">
<style>
	.top_section{
		text-align:center;
		margin: 0 auto;
		border-bottom: 1px solid #e7e7e7;
		padding: 50px 0;
	}
	.mainPictureDiv {
		width: 55%;
		height: 500px;
		margin: 0px auto;
	}
	.mainPictureDiv img {
		width: 100%;
		height: 100%;
	}
	.top_section>p{
		overflow:hidden;
		text-align:center;
		margin:0 auto;
		height:80%;
		width:60%;
	}
	.overlap {
	    display: block;
	    background-color: white;
	    border-radius: 50%;
	    position: absolute;
	    opacity: .7;
	}
	#prof>img{
		display: block;
	    width: 12%;
	    height: 12%;
	    border-radius: 50%;
	    margin: -70px auto;
	    position: relative;
	    z-index: 5;
	}
	.infoWriter {
		margin-top: 70px;
    	font-size: 1.3em;
	}
	.infoWriter a {
		text-decoration: none;
		color: #333;
	}
	.infoWriter a:HOVER {
		color: #008489;
	}
	.infoTitle {
		font-size: 3em;
	    font-weight: bold;
	    margin: 30px auto;
	    width: 75%;
	    word-break: break-all;;
	}
	.infoR_intro {
		display: block;
		position: relative;
	    padding: 10px 18px 10px 24px;
	    color: #aaa;
	    font-style: italic;
	    font-size: 18px;
	    line-height: 170%;
	    margin: 0 auto;
	}
	.amount-hit-scrap {
		margin-top: 50px;
	}
	.amount-hit-scrap span {
		color: #bcb7b7;
    	font-size: 16px;
    	margin-right: 40px;
	}
	.ing_section{
		padding: 4% 4% 6%;
	    margin: 30px auto;
	    width: 85%;
	    background-color: #f1f1f2;
	    border-radius: 10px;
	    display: table;
	}
	.ingKind {
		clear: both;
		font-size: 1.6em;
	    font-weight: bold;
	    margin-bottom: 12px;
	    color: #333;
	}
	.ingName {
		float: left;
    	font-size: 1.4em;
    	margin-bottom: 20px;
	}
	.comma {
		float: left;
    	font-size: 1.4em;
    	margin-bottom: 20px;
	}
	.comma:LAST-CHILD {
		display: none;
	}
	.stepNum {
		width: 50px;
	    height: 50px;
	    border-radius: 50%;
	    background-color: #ffcc00;
	    color: white;
	    font-weight: bold;
	    float: left;
	    text-align: center;
	    line-height: 50px;
	    margin-right: 20px;
	    font-size:2em;
	}
	.stepExplain {
		width: 50%;
    	float: left;
    	font-size: 2em;
    	padding: 0 20px 0 0;
    	margin-bottom: 40px;
	}
	.stepPicture img {
		width: 40%;
	    height: 330px;
	    border-radius: 5px;
	    margin-bottom: 70px;
	}
	.scrapbtn-claim {
		margin-top: 50px;
	}
	.claimBtn {
		cursor: pointer;
	    height: 45px;
	    font-size: smaller;
	    border: 1px solid #ffcc00;
	    border-color: #ffcc00;
	    background-color: white;
	    background-position: 20% center;
	    background-repeat: no-repeat;
	    color: #ffcc00;
	    font-size: medium;
	    padding: 10px;
	    margin-right: 5px;
	}
	.reportBtn {
		height: 45px;
		padding: 10px 15px;
		background-color: white;
		color: red;
		border: 1px solid red;
	}
	.modBtn {
		height: 40px;
	    padding: 10px;
	    background-color: white;
	    color: white;
	    border: 1px solid #ffcc00;
	    background-color: #ffcc00;
	    margin-right: 5px;
	    font-weight: bold;
	    width: 70px;
	}
	.deleteBtn {
		height: 40px;
		padding: 10px;
		background-color: white;
		color: red;
		border: 1px solid red;
		width: 70px;
	}
	.ing_section>ul>li{
		list-style-type: none;
	}
	.step_section {
		padding:5%;
		border-top: 1px solid #e7e7e7;
		border-bottom: 1px solid #e7e7e7;
		margin-top: 60px;
	}
	.step_section>strong{
		font-size:3.5em;
		background-color:#ffcc00;
		border-radius:50%;
	}
	.step_section>span{
		font-size:2em;
	}
	.step_section>p{
		margin: 0 auto;
		width: 50%;
		height: 60%;
	}
	.tagImgSpan img {
		width: 4%;
		margin: 0px 20px 50px 0;
		float: left;
	}
	.tagWrap {
		float: left;
		height: 35px;
		background-color: #eeeeee;
		margin-right: 10px;
		padding: 3px 0 3px 6px;
	}
	.tag_section {
		margin-top: 40px;
	}
	.tag_section a {
		text-decoration: none;
		color: #008489;
		font-size: 1.5em;
		margin-right: 10px;
	}
	.reply-review_section {
		clear: both;
		margin-top: 40px;
		border-top: 1px solid #e7e7e7
	}
	#ratings{
	    margin: 0 auto;
	    width: 60%;
	    padding-left: 16%;
	    height: 50px;
	}
	.r_id {
		font-size: large;
		font-weight: bold;
	}
	#inputarea{
		margin: 0 auto;
		text-align: center;
	}
	#reply_contents {
	    border-radius: 3px;
	    width: 80%;
	    height: 60px;
	    padding-left: 15px;
	    border: 1px solid lightgray;
	    font-size: large;
	    margin-right: -15px;
	    margin-top: 30px;
	}
	.replyReply_contents {
		border-radius: 3px;
	    width: 85%;
	    height: 30px;
	    padding: 15px;
	    border: 0;
	    border-bottom: 1px solid lightgray;
	    font-size: large;
	    margin-right: -15px;
	    margin-top: 15px;
	    padding: 10px;
	}
	#replyMod_contents {
	    border: 0;
	    border-bottom: 1px solid #e7e7e7;
	    margin-right: 10px;
	    width: 80%;
	    margin-top: 20px;
		height: 30px;
	}
	#reply_btn{
		background-color: white;
	    font-size: large;
	    height: 60px;
	    width: 80px;
	    color: #ffcc00;
	    border: 1px solid #ffcc00;
	    margin-top: 30px;
	}
	.reply_replyBtn {
	
	}
	#reply-review{
		cursor:pointer;
		font-weight: bold;
		margin: 2% 0% 2% 0%;
		color: #595528;
	}
	#reply-review>div {
		float: left;
		margin-right: 10px;
	}
	#reply-review>div[title=active]{
	    font-size: 2.4em;
	    color: #ffcc00;
	}
	#reply-review>div[title=inactive]{
	    font-size: 1.5em;
	    color: #eeeeee;
	    font-weight: normal;
	    margin-top: 10px;
	}
	#comment_area {
		clear: both;
	}
	.reply_list {
		position: relative;
		width: 90%;
		height: auto;
		border-radius: 1rem;
		padding: .5% .1% .1% 2%;
		margin: 2% 50% .8% 5%;
		background: rgba(255, 255, 255, .9) fixed;
		color: #595528;
		font-size: 1.1em;
		display: inline-block;
		overflow: hidden;
	}
	.rdel, .rmod, .r_date, .r_reply{
		float: right;
	    margin-right: 1%;
	    font-size: 90%;
	    display: inline-block;
	    margin-top: 5px;
	    padding: 2px 5px;
	}
	#pagers {
		text-align: center;
	}
	#pagers span {
		border: 0;
		font-weight: bold;
	}
	.clear{
		clear: both;
	}
</style>
</head>
<body>
	<c:import url="../tmp/header.jsp"/>
	
	<section class="main_section">
		<input type=hidden id=recipenum value="${view.recipeDTO.num }">
		<input type=hidden class=scrappers value="관리자">
		<c:forEach items="${view.scrapload }" var="scrappers">
			<input type=hidden class=scrappers value=${scrappers }>
		</c:forEach>
		<article class=top_section>
			<p>
				<div class="mainPictureDiv">
					<img src="../resources/upload/${view.recipeDTO.rep_pic }">
				</div>
				
				<span id=prof>
					<span class="overlap"></span>
					<c:if test="${view.rawprof eq 'sns'}">
						<c:if test="${view.snsprof eq null }">
							<img src="${pageContext.request.contextPath}/resources/images/common/default.png">
						</c:if>
						<c:if test="${view.snsprof ne null }">
							<img src=${view.snsprof }>
						</c:if>
					</c:if>
					<c:if test="${view.rawprof ne 'sns'}">
						<c:if test="${view.rawprof eq null }">
							<img  src="${pageContext.request.contextPath}/resources/images/common/default.png">
						</c:if>
						<c:if test="${view.rawprof ne null }">						
							<img src="/finalProject/resources/upload/${view.rawprof }">
						</c:if>
					</c:if>
				</span>
			<!-- </p> -->
			<br>
				<h3 class="infoWriter">
					<a href="/finalProject/member/myPage/myPage?nickName=${view.recipeDTO.writer}">
						${view.recipeDTO.writer}
					</a>
				</h3>
				<div class="infoTitle">${view.recipeDTO.title }</div>
				<h3>${view.recipeDTO.foodname}</h3>
			<br>
				<div>
					<img src="../resources/images/kdk/icon_marks1.png">
					<span class="infoR_intro">${view.recipeDTO.r_intro }</span>
					<img src="../resources/images/kdk/icon_marks2.png">
				</div>
			<br>
			<div class=amount-hit-scrap>
				<span>
					<img src='../resources/images/kdk/icon_man.png'>
					&nbsp;${view.recipeDTO.amount}인분
				</span>
				<span>
					<img src='../resources/images/kdk/clock (1).png'>
					&nbsp;${view.recipeDTO.elapsedtime}
				</span>
				<span>
					<img src='../resources/images/kdk/visibility-button.png'>
					&nbsp;${view.recipeDTO.hit }
				</span>
			</div>
			<div class=scrapbtn-claim>
				<c:if test="${memberDTO.nickName ne view.recipeDTO.writer && memberDTO.grade ne 2}">
					<button class="claimBtn" id="scrapbtn"></button>	
					<button class="claimBtn" onclick="messageWrite('general')">작성자&nbsp;&nbsp;<img src='../resources/images/kdk/envelope (1).png'></button>
					<button onclick="messageWrite('report')" class="reportBtn">신고</button>
				</c:if>
				<c:if test="${memberDTO.nickName eq view.recipeDTO.writer || memberDTO.grade eq 2}">
					<c:if test="${memberDTO.nickName eq view.recipeDTO.writer}">
						<a href="recipeUpdateForm?recipeNum=${view.recipeDTO.num}"><button class="modBtn">수정</button></a>					
					</c:if>
					<button class="deleteBtn">삭제</button>
				</c:if>
			</div>
		</article>
		<br>
		<article class=ing_section>
			<c:set var="tmp" value="0"/>
				<c:forEach items="${count}" var="c" varStatus="i">
					<c:set var="tmp" value="${c+tmp+1}"/>
						<c:if test="${i.index eq 0}">
							<div class="ingKind">[${ingredient[tmp-1].kind}]</div>
							<ul>
							<c:forEach begin="0" end="${c}" var="index">
								<li class="ingName">${ingredient[index].name}&nbsp;${ingredient[index].amount}</li>
								<li class="comma">,&nbsp;</li>
							</c:forEach>
							</ul>
						</c:if>
				<c:if test="${i.index ne 0}">
				<c:set var="tmp" value="${tmp}"/>
					<div class="ingKind">[${ingredient[tmp-1].kind}]</div>
						<ul>
						<c:forEach begin="${tmp-c-1}" end="${tmp-1}" var="index" varStatus="status">
							<li class="ingName">${ingredient[index].name}&nbsp;&nbsp;${ingredient[index].amount}</li>
							<li class="comma">,&nbsp;</li>
						</c:forEach>
						</ul>
					</c:if>
			</c:forEach>
		</article>
		<article class=step_section>
			<c:forEach items="${view.steps }" var="step">
				<div class="stepNum">${step.step+1}</div>
				<div class="stepExplain">${step.explain}</div>
				<div class="stepPicture"><img src="../resources/upload/${step.fname }"></div>
				<div class="clear"></div>
			</c:forEach>
		</article>
		<article class=tag_section>
			<span class="tagImgSpan"><img src="../resources/images/kdk/tag (2).png"></span>
			<c:forEach items="${view.hashtags }" var="tags">
				<div class="tagWrap"><a href="search?find=${tags.hashtag }">#${tags.hashtag }</a></div>
			</c:forEach>
		</article>
		<article class=reply-review_section>
			<div id=reply-review>
				<div title=active class=reply-review id=reply>댓글</div>
				<div title=inactive class=reply-review id=review>리뷰</div> 
			</div>
			<div id=comment_area></div>
		</article>
	</section>
		<!-- =============================The Message Modal Start===============================-->
		<div id="messageModal" class="modal in" role="dialog" aria-hidden="false" style="display: none; padding-right: 17px;">
	      <div class="modal-dialog" style="width:570px">
	        <div class="modal-content" style="padding:0;">
	          <div class="modal-header">
	            <button type="button" class="close" id="message_close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><img src="${pageContext.request.contextPath}/resources/images/common/btn_close.gif" alt="닫기"></span></button>
	            <h4 class="modal-title" id="msgModalTitle"></h4>
	          </div>
	          <!-- ============= Modal body ==============  -->
		          <div class="modal-body" id="messageModal_body" style="padding:10px;text-align:center;">
		               
			          
		           </div>
	           <!-- ============= Modal body ==============  -->
	        </div>
	      </div>
	    </div>
	<!-- =================================== Message Modal End ======================================= -->
	<c:import url="../tmp/footer.jsp"/>
</body>
<c:import url="ingSearch.jsp"></c:import>
<script>
	$(function() {
		/* $(".ing_section").css("height", $(".ing_section *").height()); */
		
		$(window).resize(function(){
			var imgWidth = $("#prof img").width();
			var imgOffset = $("#prof img").offset();
			
			$(".overlap").css("width", imgWidth + 15);
			$(".overlap").css("height", imgWidth + 15);
			$(".overlap").css("top", imgOffset.top - 7.5);
			$(".overlap").css("left", imgOffset.left - 7.5);
		}).resize();
		
		
		$(".stepNum").each(function() {
			var stepNum = $(this).text() * 1;
			
			if(stepNum < 10) {
				var index = $(this).index();
				$(this).html("0" + stepNum);
			}
		});
	});

	$(".deleteBtn").click(function() {
		var r = confirm("삭제하시겠습니까?");
		
		if(r == true) {
			var recipeNum = '${view.recipeDTO.num}' * 1;
			console.log(recipeNum);
			location.href = "./recipeDelete?recipeNum=" + recipeNum;
		}
	});
	var scrapper=document.getElementsByClassName('scrappers');
	for(i=0;i<scrapper.length;i++){
		if(scrapper[i].value=='${memberDTO.nickName}'){
			$('#scrapbtn').attr("title", "D");
			$('#scrapbtn').html("<img src='../resources/images/kdk/broken-heart.png'>&nbsp;스크랩 취소&nbsp;");
		}else{
			$('#scrapbtn').attr("title", "I");
			$('#scrapbtn').html("<img src='../resources/images/kdk/heart (1).png'>&nbsp;스크랩&nbsp;${view.recipeDTO.scrap }");
		}
	}
	$('#scrapbtn').click(function(){
		if("${memberDTO}"==""){
			alert("로그인 해주세요.");
			location.href="../member/login?path=/";
		}else{
			location.href="recipeScrap"+$(this).attr("title")+"?recipenum="+$('#recipenum').val()+"&nickname=${memberDTO.nickName}";
		}
	});
	function search(find){
	    if(event.keyCode == 13){
	    	location.href="search?find="+find.value
		}
	}
	function ingsearch(find){
		$.ajax({
			url:"inglist",
			type:"GET",
			data:{
				find:find.value
			},
			success:function(data){
				$('.ings').html(data.trim());
			}
		});
	}
	$('.ing_btn').click(function(){
		var ings=$('.ingkeyword').val();
		$('.ing_search').append('<span class="btn btn-warning ingx" style="margin: 0 1% 1% 0" title="'+ings+'">'+ings+'<strong class="badge ing" style="cursor:pointer">X</strong></span>');
		$('.ingkeyword').val('');
	});
	$('.ing_search').on("click", ".ingx", function(){
		$(this).remove();
	});
	$('.isearch_btn').click(function(){
		var url="isearch?curPage=1";
		var x=document.getElementsByClassName('ingx');
		for(i=0;i<x.length;i++){
			url+="&ingredients="+x[i].title;
		}
		if($('.ing_search').html()!=''){
			location.href=url;
		}else{
			alert('재료를 선택하신 후 검색해 주세요!');
		}
	});
	$('#comment_area').load("replyList?rnum="+$('#recipenum').val());
	$('#reply-review').on("click", "div", function(){
		$('.reply-review').attr('title', 'inactive');
		$(this).attr('title', 'active');
		$('#comment_area').load($(this).attr('id')+'List?rnum='+$('#recipenum').val());
	});
	
	/*  ===================== Message ============================= */
	$("#message_close").click(function() {
		$("#messageModal").css("display","none");

	});
	 
	 // 쪽지 쓰기
	 // messageWrite.jsp -> messageModal-body에 넣어줌
	 function messageWrite(category) {
		 if(category =='general'){
			 $("#msgModalTitle").text("쪽지 보내기");
		 }else{
			 $("#msgModalTitle").text("신고쪽지 보내기");
		 }
		var nickName = "${view.recipeDTO.writer }";
		 
		$.ajax({
			url : "../member/myPage/messageWrite",
			data : {
				nickName : nickName,
				category :category
			},
			success : function(data) {
				$("#messageModal_body").html(data);
				$("#messageModal").css("display","block");
			}
		});
	}
	 
	// message send  쪽지 보내기
	 $(".modal-body").on("click","#message_send",function() {
		 
		 	var get_nickName = 	$("#get_nickName").val(); 								
		 	var contents = $("#contents").val();				// 메세지 내용
		 	var title = $("#title").val();						
		 	var category = $("#category").val();				// 작성자에게 질문 하는 메세지 : general , 신고 = report
		 	var send_nickName = "${memberDTO.nickName}";		// 로그인한 계정의 닉네임
		 	
		 	var recipeNum =$('#recipenum').val();				// 레시피 번호
		 	if(category =='reportList'){
		 		send_nickName ='운영자';
		 	}
		 	
		 	if(title =='' || title==null){
			 	alert(title);
		 		alert("제목을 입력해주세요.");
		 	}
		 	else{
				$.ajax({
					url : "/finalProject/member/myPage/messageSend",
					type : "POST",
					data : {
						send_nickName : send_nickName,
						get_nickName : get_nickName,
						contents : contents,
						title : title,
						category : category,
						recipeNum : recipeNum
						
					},
					success : function(data) {
						alert("쪽지를 보냈습니다.");
						$("#messageModal").css("display","none");
					}
				}) 		
		 	}
	});
</script>
</html>