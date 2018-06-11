<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">
	.table thead th, td{
		text-align: center;
	}
	.table .title{
		text-align: left;
	}
	div.scrollmenu{
		color: darkgray;
	}
	div.scrollmenu a {
	    color: gray;
	    font-size: 12px;
	    font-weight: initial;
	}
	div.scrollmenu a:HOVER {
		color: #ffcc00;
	}
	h2{
		font-size: 25px;
	    font-weight: bold;
	    letter-spacing: -1px;
	}
</style>
</head>
<body>
	
<div class="messageList">
  <h2>${messageList_title }</h2>
   <input type="hidden" id="message_category" value="${category }">
  <table class="table">
    <thead>
      <tr>
        <th width="10%">No.</th>
        <th width="15%">
        	<c:if test="${category eq 'send' }">
        		받는사람
        	</c:if>
        	<c:if test="${category eq 'general' || category eq 'report' || category eq'reportList' }">
        		보낸사람
        	</c:if>
        </th>
        <th width="50%">제목</th>
        <th width="15%">날짜</th>
      </tr>
    </thead>
    <tbody>
	    <c:forEach items="${m_List }" var="list" step="1"  varStatus="i">
		      <tr>
		        <td><strong>${listInfo.startRow-1 + i.count }</strong></td>
		        <c:if test="${category eq 'general' || category eq 'report' || category eq'reportList'}">
			        <td>${list.send_nickName }</td>
        		</c:if>
        		  <c:if test="${category eq 'send' }">
			        <td>${list.get_nickName }</td>
        		</c:if>
		        <td class="title"><a role="button" onclick="messageView('${list.m_num}')">
		        <c:if test="${list.status == 0 || list.category eq 'send'}"><strong> ${list.title }</strong> </c:if>
		      	<c:if test="${list.status == 1 && list.category ne 'send'}"><span style="color: #777;">${list.title }</span> </c:if>
		        
		        </a></td>
		        <td>${list.send_time }</td>
		      </tr>
    	
    	</c:forEach>
     
    </tbody>
  </table>
  
  <!-- ============================================== 페이징 ====================================  -->		
		<div class="paging_sy">
			<c:if test="${listInfo.totalBlock > 1}">
			<span class="first scollEv" onclick="messageList(1,'${category }')"><img src="../../resources/images/csy/prev_arr_off.gif"></span>
			</c:if>
			<c:if test="${listInfo.curBlock>1}">
			<span class="prev scollEv" onclick="messageList(${listInfo.startNum-1},'${category }'))"><img src="../../resources/images/csy/prev_off.gif"></span>
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
							<a onclick="messageList(${i},'${category }')" class="scollEv">${i}</a>&nbsp;
						</c:if>
						<c:if test="${i eq listInfo.lastNum}">
							<a onclick="messageList(${i},'${category }')" class="last scollEv">${i}</a>&nbsp;
						</c:if>
					</c:if>							
				</c:forEach>
			</span> 
			<c:if test="${listInfo.curBlock < listInfo.totalBlock}">
			<span class="next scollEv" onclick="messageList(${listInfo.lastNum+1},'${category }')"><img src="../../resources/images/csy/next_off.gif"></span>
			</c:if>
			<c:if test="${makePage.totalBlock > 1}">
			<span class="last scollEv" onclick="messageList(${listInfo.lastNum},'${category }')"><img src="../../resources/images/csy/next_arr_off.gif"></span>
			</c:if>
		</div>
  
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
</div>

<script type="text/javascript">
	$("#message_close").click(function() {
		$("#messageModal").css("display","none");
		
		messageList(1 , $("#category").val());
	});
	//message send  쪽지 보내기
	$(".modal-body").on("click","#message_send",function() {
		 
		 	var get_nickName = 	$("#get_nickName").val(); 								
		 	var contents = $("#contents").val();				// 메세지 내용
		 	var title = $("#title").val();						
		 	var category = $("#category").val();				// 작성자에게 질문 하는 메세지 : general , 신고 = report
		 	var send_nickName = "${memberDTO.nickName}";		// 로그인한 계정의 닉네임
		 	if(category =='reportList'){
		 		send_nickName ='운영자';
		 	}
		 	
			$.ajax({
				url : "messageSend",
				type : "POST",
				data : {
					send_nickName : send_nickName,
					get_nickName : get_nickName,
					contents : contents,
					title : title,
					category : category,
					
				},
				success : function(data) {
					alert("쪽지를 보냈습니다.");
					messageList(1 , category);
					$("#messageModal").css("display","none");
				}
			})
	});
	if("${messageCheck}">0){
        $(".newImg").show();
    }else{
  	   $(".newImg").hide();
    }
</script>
</body>
</html>

