<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <c:forEach var="list" items="${list}" step="1" end="4" varStatus="i">
		<div id="recipecard${i.count}" style="width: 150px;" draggable="true" ondragstart="dragSearch(event)">
			
			<!-- foodname -->
			<span class="recipetitle">
				<span class="recipecard-image">
					<img src="${pageContext.request.contextPath}/resources/upload/${list.rep_pic}" draggable="false" id="food${i.count}" >
				</span>
				<a href="${pageContext.request.contextPath}/recipe/recipeView?num=${list.num}" draggable="false">${list.foodname}</a>
			</span>
		</div><br><br>
	</c:forEach>




<script type="text/javascript">

/* $('.ui-draggable').addClass("aaa"); */

 function dragSearch(event) {
	
		
			event.dataTransfer.setData("text",event.target.id);
}


function dropSearch(ev) {
	ev.preventDefault();
	var data = ev.dataTransfer.getData("text");
/* 	ev.target.append(document.getElementById(data)); */
	$('#'+data).appendTo("#"+ev.target.id);
}

function allowDrop(ev) {
	ev.preventDefault();
} 




/* $(function(){
		
	$("#recommend> ul>li").droppable({
		drop: function(event) {
		
			event.preventDefault();
			var data = event.dataTransfer.getData("text");
			event.tartget.appendChild(document.getElementById(data)); */
			
			/* 	var droptitle = $(this).attr("title");
			var drophtml = $(this).html();	
			var dragid = ui.draggable.attr("id");
			
			
			var img = $(this).attr()
			var id  = $(this).attr("id");
			$("#"+id).attr("src",)
			
			
			if( dragid == droptitle ) {
				
			
				ui.draggable.draggable( "option", "revert", false );
				var droppableOffset = $(this).offset();
				var x = droppableOffset.left + 1;
				var y = droppableOffset.top + 19;
				ui.draggable.offset({ top: y, left: x }); */
/* 				$(this).css('height','90px'); */
				/* $('.recipetitle').append('<li id="loc" title="recipecard" style="height: 37px; width: 133.33px;"></li>'); */
			//}
/* 		}
	});
	});
	 */

	

</script>
