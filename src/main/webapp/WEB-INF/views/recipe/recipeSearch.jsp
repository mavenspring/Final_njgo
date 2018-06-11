<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/kdk/recipeList_Search.css">
		<c:forEach items="${list.listPack }" var="dto" varStatus="i">
				<div class=main_concep_channel title=${dto.num } style="cursor:pointer">		
					<div class="channel_img" style='background-image:url("${pageContext.request.contextPath}/resources/upload/${dto.rep_pic }")'>
						<div id="overlays${dto.num }" class=overlays>
							<div id="counts${dto.num }" class=counts></div>
							<div id="creators${dto.num }" class=creators>by ${dto.writer}</div>
						</div>
						<a href="/finalProject/member/myPage/myPage?nickName=${dto.writer}">
						<div class="writerImg" data-writer="${dto.writer}">
							<c:if test="${list.rawprof[i.index] eq 'sns'}">
								<c:if test="${list.snsprof[i.index] eq null }">
									<img  src="${pageContext.request.contextPath}/resources/images/common/default.png">
								</c:if>
								<c:if test="${list.snsprof[i.index] ne null }">
									<img src="${list.snsprof[i.index]}">
								</c:if>
							</c:if>
							<c:if test="${list.rawprof[i.index] ne 'sns'}">
								<c:if test="${list.rawprof[i.index] eq null }">
									<img  src="${pageContext.request.contextPath}/resources/images/common/default.png">
								</c:if>
								<c:if test="${list.rawprof[i.index] ne null }">
									<img src="${pageContext.request.contextPath}/resources/upload/${list.rawprof[i.index]}">								
								</c:if>
							</c:if>
							<%-- <img alt="" src="../resources/upload/${list.snsprof[i.index]}"> --%>
						</div>
						</a>
					</div>			
					<div class="channel_title">				
						<div class="chTitle">${dto.foodname }</div>		
					</div>
					<div class="channel_info">
						<div style="overflow:hidden; text-overflow:ellipsis; white-space:nowrap;">${dto.title }</div><div></div>
					</div>
					<div class=misc>
						<div class="elaspedtime">
							<img src="${pageContext.request.contextPath}/resources/images/csy/clock.png">
							<div class="miscCnt">${dto.elapsedtime }</div>
						</div>
						<div class="scraps" style="display:inline">
							<img src="${pageContext.request.contextPath}/resources/images/csy/like.png">
							<div class="miscCnt">${dto.scrap}</div>
						</div>
						<div class="ratings" style="display:inline">
							<img src="${pageContext.request.contextPath}/resources/images/csy/fridge.png">
							<div class="miscCnt">${dto.rating }</div>
						</div>
					</div>
				</div>
			</c:forEach>	
		
		<div class="clear"></div>
		<div id=pagers title='${list.totalCount }'>
			<ul class="pagination">
				<c:if test="${list.listInfo.curBlock>1 }">
					<li><span title='${list.listInfo.startNum-1 }' style='cursor:pointer'>&lt;</span></li>
				</c:if>
				<c:forEach begin="${list.listInfo.startNum }" end="${list.listInfo.lastNum }" step="1" var="i">
					<li><span title='${i}' style='cursor:pointer'>${i}</span></li>
				</c:forEach>
				<c:if test="${list.listInfo.curBlock<listInfo.totalBlock }">
					<li><span title='${list.listInfo.lastNum+1 }' style='cursor:pointer'>&gt;</span></li>
				</c:if>
			</ul>
		</div>
		
		<c:forEach items="${curIng }" var="ings">
			<input type="hidden" name="curIng" value="${ings }">
		</c:forEach>
		<input type="hidden" id="find" value="${list.listInfo.find }">			
		<script>
		var tc_sum = '${list.totalCount}';
		$(".tc_sum").html(tc_sum);
		
		$('.overlays').css("background", "none");
		$('.creators').css("visibility", "hidden");
		$('.counts').css("visibility", "hidden");
			
		$('.main_concep_channel').mouseover(function(){	
			var num=$(this).attr('title');
			$('#overlays'+num).css("background-image", "url('${pageContext.request.contextPath}/resources/images/kdk/thumb_over_rev1.png')");
			$('#overlays'+num).css("background-position", "center");
			$('#creators'+num).css("visibility", "visible");
			$('#counts'+num).css("visibility", "visible");
		});
		$('.main_concep_channel').mouseleave(function(){	
			var num=$(this).attr('title');
			$('#overlays'+num).css("background", "none");
			$('#creators'+num).css("visibility", "hidden");
			$('#counts'+num).css("visibility", "hidden");		
		});
		$('.main_concep_channel').click(function(){
			var curIng=document.getElementsByName('curIng');
			var url="${pageContext.request.contextPath}/recipe/recipeView?num="+$(this).attr('title');
			if(curIng.length*1!=0){
				for(i=0;i<curIng.length;i++){
					url+="&curIng="+curIng[i].value;
				}
			}else{
				url+="&curIng=undefined"
			}
			location.href=url;
		});
		$('.c_kind').click(function(){
			$('.c_kind').attr('title', 'inactive');
			$(this).attr('title', 'active');
			jQuery.ajaxSettings.traditional = true;
			var ar=new Array();
			var curIng=document.getElementsByName('curIng');
			for(i=0;i<curIng.length;i++){
				ar.push(curIng[i].value);
			}
			if(curIng.length*1==0){
				ar.push('undefined');
			}
			$.ajax({
				url: "${pageContext.request.contextPath}/recipe/catesearch",
				type: "GET",
				data:{
					c_kind:$(this).html(),
					c_situation:$('.c_situation[title=active]').html(),
					c_ingredient:$('.c_ingredient[title=active]').html(),
					c_procedure:$('.c_procedure[title=active]').html(),
					curIng:ar,
					find:$('#find').val()
				},
				success:function(data){
					$('#searchresult').html(data.trim());
				}
			});	
		});
		$('.c_situation').click(function(){
			$('.c_situation').attr('title', 'inactive');
			$(this).attr('title', 'active');
			jQuery.ajaxSettings.traditional = true;
			var ar=new Array();
			var curIng=document.getElementsByName('curIng');
			for(i=0;i<curIng.length;i++){
				ar.push(curIng[i].value);
			}
			if(curIng.length*1==0){
				ar.push('undefined');
			}
			$.ajax({
				url: "${pageContext.request.contextPath}/recipe/catesearch",
				type: "GET",
				data:{
					c_kind:$('.c_kind[title=active]').html(),
					c_situation:$(this).html(),
					c_ingredient:$('.c_ingredient[title=active]').html(),
					c_procedure:$('.c_procedure[title=active]').html(),
					curIng:ar,
					find:$('#find').val()
				},
				success:function(data){
					$('#searchresult').html(data.trim());
				}
			});	
		});
		$('.c_ingredient').click(function(){
			$('.c_ingredient').attr('title', 'inactive');
			$(this).attr('title', 'active');
			jQuery.ajaxSettings.traditional = true;
			var ar=new Array();
			var curIng=document.getElementsByName('curIng');
			for(i=0;i<curIng.length;i++){
				ar.push(curIng[i].value);
			}
			if(curIng.length*1==0){
				ar.push('undefined');
			}
			$.ajax({
				url: "${pageContext.request.contextPath}/recipe/catesearch",
				type: "GET",
				data:{
					c_kind:$('.c_kind[title=active]').html(),
					c_situation:$('.c_situation[title=active]').html(),
					c_ingredient:$(this).html(),
					c_procedure:$('.c_procedure[title=active]').html(),
					curIng:ar,
					find:$('#find').val()
				},
				success:function(data){
					$('#searchresult').html(data.trim());
				}
			});	
		});
		$('.c_procedure').click(function(){
			$('.c_procedure').attr('title', 'inactive');
			$(this).attr('title', 'active');
			jQuery.ajaxSettings.traditional = true;
			var ar=new Array();
			var curIng=document.getElementsByName('curIng');
			for(i=0;i<curIng.length;i++){
				ar.push(curIng[i].value);
			}
			if(curIng.length*1==0){
				ar.push('undefined');
			}
			$.ajax({
				url: "${pageContext.request.contextPath}/recipe/catesearch",
				type: "GET",
				data:{
					c_kind:$('.c_kind[title=active]').html(),
					c_situation:$('.c_situation[title=active]').html(),
					c_ingredient:$('.c_ingredient[title=active]').html(),
					c_procedure:$(this).html(),
					curIng:ar,
					find:$('#find').val()
				},
				success:function(data){
					$('#searchresult').html(data.trim());
				}
			});	
		});
		$('.pagination').on("click", "span", function(){
			jQuery.ajaxSettings.traditional = true;
			var ar=new Array();
			var curIng=document.getElementsByName('curIng');
			for(i=0;i<curIng.length;i++){
				ar.push(curIng[i].value);
			}
			if(curIng.length*1==0){
				ar.push('undefined');
			}
			$.ajax({
				url: "${pageContext.request.contextPath}/recipe/catesearch",
				method: "GET",
				data:{
					curPage:$(this).attr('title'),
					c_kind:$('.c_kind[title=active]').html(),
					c_situation:$('.c_situation[title=active]').html(),
					c_ingredient:$('.c_ingredient[title=active]').html(),
					c_procedure:$('.c_procedure[title=active]').html(),
					curIng:ar,
					find:$('#find').val()
				},
				success:function(data){
					$('#searchresult').html(data.trim());
				}
			});
		});
		function search(find){
		    if(event.keyCode == 13){
		    	location.href="${pageContext.request.contextPath}/recipe/search?find="+find.value
			}
		}
		function ingsearch(find){
			$.ajax({
				url:"${pageContext.request.contextPath}/recipe/inglist",
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
			var url="${pageContext.request.contextPath}/recipe/isearch";
			var x=document.getElementsByClassName('ingx');
			for(i=0;i<x.length;i++){
				url+="?ingredients="+x[i].title+"&";
			}
			url+="curPage=1";
			if($('.ing_search').html()!=''){
				location.href=url;
			}else{
				alert('재료를 선택하신 후 검색해 주세요!');
			}
		});
		</script>