<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div id=pagearea>
<div id=inputarea>
	<input type="text" name="contents" id="reply_contents">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=button id=reply_btn class="btn btn-default" value="등록">
</div>
<div id=replyarea>
<c:forEach items="${list}" var="rdto">
	<div class="reply_list" id="${rdto.num}">
		<c:if test="${rdto.depth>0 }">
		<c:forEach begin="1" end="${rdto.depth }" step="1">
			&nbsp;&nbsp;
		</c:forEach>
		</c:if>
		<c:if test='${rdto.writer eq memberDTO.nickName}'>
		<span class="rmod" title="${rdto.num}" style="border:1px solid black; border-radius:3px; cursor:pointer;">수정</span>
		<span class="rdel" title="${rdto.num}" style="border:1px solid black; border-radius:3px; cursor:pointer;">삭제</span>
		</c:if> 
		<span class="r_reply" title="${rdto.num}" style="border:1px solid black; border-radius:3px; cursor:pointer;">답글</span>
		<span class="r_id" style="cursor:pointer;">${rdto.writer}</span>
		<span class="r_date"><fmt:formatDate value="${rdto.time}" pattern="YY/MM/dd HH:mm"/> </span>
		<br>
		<c:if test="${rdto.depth>0 }">
		<c:forEach begin="1" end="${rdto.depth }" step="1">
			<img style="margin-left: 20px;" src="../resources/images/kdk/arrow-down-and-right.png">
		</c:forEach>
		</c:if>
			<div class="r_con" style="display:inline">${rdto.contents}</div>
		<p id="replyinput${rdto.num }" style="display:none"><input type="text" name="contents" id="replyReply_contents${rdto.num }" class="replyReply_contents">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type=button id="replyReply_btn${rdto.num }" class="btn btn-default reply_replyBtn" value="등록">
			<input type=button class="btn btn-default reply_replyBtn cancellation" value="취소">
		</p>
	</div>
</c:forEach>
</div>
				<div id=pagers>
					<ul class="pagination">
						<c:if test="${listInfo.curBlock>1 }">
							<li><span title='${listInfo.startNum-1 }' style='cursor:pointer'>&lt;</span></li>
						</c:if>
						<c:forEach begin="${listInfo.startNum }" end="${listInfo.lastNum }" step="1" var="i">
							<li><span title='${i}' style='cursor:pointer'>${i}</span></li>
						</c:forEach>
						<c:if test="${listInfo.curBlock<listInfo.totalBlock }">
							<li><span title='${listInfo.lastNum+1 }' style='cursor:pointer'>&gt;</span></li>
						</c:if>
					</ul>
				</div>
<script>
	$('#reply_btn').click(function(){
		if('${memberDTO}' != ''){
			var repcont=$('#reply_contents').val();
			var writer = '${memberDTO.nickName}';
			if(repcont!=''){
				$.ajax({
					url:'replyWrite',
					method:"POST",
					data:{
						recipenum:$('#recipenum').val(),
						writer: writer,
						contents:repcont
					},
					success:function(data){
						location.reload();
					}
				});	
			}else{
				alert('내용이 필요합니다!');
			}
		}else{
			alert("로그인이 필요한 서비스입니다. 로그인 해주세요.");
			
		}
		
	});
	$(".reply_list").on("click",".rdel",function(){
		var num=$(this).attr("title");
		var rnum=$('#recipenum').val();
		if(confirm('정말로 삭제하시겠습니까?')){
			$.get("../recipe/replyDelete?num="+num+"&rnum="+rnum,function(data){
				location.reload();
			});
		}
	});
	$(".reply_list").on("click",".rmod",function(){
    	var num = $(this).attr("title");
    	var rnum=$('#recipenum').val();
    	$("#replyarea").load("../recipe/replyUpdate?num="+num+"&recipenum="+rnum);
     });	
	$(".reply_list").on("click", ".r_reply", function(){
		if('${memberDTO}' != ''){
			var num = $(this).attr("title");
	    	var rnum=$('#recipenum').val();
	    	var writer = '${memberDTO.nickName}';
	    	$('#replyinput'+num).css('display', 'block');
	    	$("#replyReply_btn"+num).click(function(){
	    		var modcon = $("#replyReply_contents"+num).val();
	    		$.get("replyReply", {num:num, recipenum:rnum, contents:modcon, writer:writer}, function(data){
	    			location.reload();
	    		});
	     	}); 
		}else{
			alert("로그인이 필요한 서비스입니다");
			location.href = "../member/login";
		}
		
	});
	$('.pagination').on("click", "span", function(){
		$.ajax({
			url: "replyList",
			method: "GET",
			data:{
				curPage:$(this).attr('title'),
				rnum:$('#recipenum').val()
			},
			success:function(data){
				$('#pagearea').html(data.trim());
			}
		});
	});
	$(".cancellation").on("click", function(){
		if(confirm('작성을 취소하시겠습니까?')){
			location.reload();	
		}
	});
</script>
</div>