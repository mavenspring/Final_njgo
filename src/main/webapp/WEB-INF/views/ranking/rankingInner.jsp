<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<table class="t_type1" width="778" style="margin-bottom: 0px;">
		<tbody>
			<tr>											
				<th width="90">랭킹</th>
				<c:if test="${kind eq 'upload'}">
					<th colspan="2" width="170" style="padding-left: 45px;">셰프명</th>												
					<!-- <th width="80">조회수</th>												
					<th width="130">누적조회수</th> -->	
					<th width="130">요리업로드수</th>		
				</c:if>	
				<c:if test="${kind eq 'hit'}">
					<th colspan="2" width="170">요리명</th>												
					<th width="80">조회수</th>												
					<th width="130">누적조회수</th>	
					<th width="130">닉네임</th>		
				</c:if>		
				<c:if test="${kind eq 'scrap'}">
					<th colspan="2" width="170">요리명</th>
					<th width="80">스크랩수</th>												
					<th width="130">누적스크랩수</th>	
					<th width="130">닉네임</th>		
				</c:if>																												
			</tr>											
			<c:forEach items="${listAll}" var="list" varStatus="i">								
				<tr id="list">											
					<td width="90">${list.rownum}</td>
					<c:if test="${kind eq 'upload'}">
						<td colspan="2" width="170" style="padding-left: 45px;"><span style="cursor: pointer">${list.writer}</span></td>
						<%-- <td width="80">${list.hit}</td>
						<td width="130">${list.hit}</td> --%>
						<td width="130">${list.ct}</td>						
					</c:if>	
					<c:if test="${kind eq 'hit'}">
						<td colspan="2" width="170"><span style="cursor: pointer">${list.foodname}</span></td>
						<td width="80">${list.hit}</td>
						<td width="130">${thit[i.index]}</td>
						<td width="130">${list.writer}</td>						
					</c:if>												
					<c:if test="${kind eq 'scrap'}">
						<td colspan="2" width="170"><span style="cursor: pointer">${list.foodname}</span></td>
						<td width="80">${list.scrap}</td>
						<td width="130">${tscrap[i.index]}</td>
						<td width="130">${list.writer}</td>	
					</c:if>												
																																																	
				</tr>									
			</c:forEach> 													
		</tbody>
	</table>
		<%-- <div class="prev-next" style="margin-top: -10px;margin-bottom: 5px;">
			<table summary="페이지 네이게이션" class="Nnavi" align="center">
				<tbody>
					<tr>
						<c:if test="${listInfo.curBlock>1}">
      				 		<td class="go" id="${listInfo.startNum-1}">
      				 			<a href="${kind}Page?curPage=${listInfo.startNum-1}">[이전]</a>
      				 		</td>
   						</c:if>
  						<c:forEach begin="${listInfo.startNum}" end="${listInfo.lastNum}" var="i">
     				 		<td class="go" id="${i}" style="font-weight: 900; cursor: pointer;">
     				 			<div onclick="paging(${i});" class="m-tcol-c" style="margin-left: 5px;">${i}</div>
     				 		</td>
   						</c:forEach>	
   						<c:if test="${listInfo.curBlock < listInfo.totalBlock}">
      						<td class="go" id="${listInfo.lastNum+1}">
      							<a href="${kind}Page?curPage=${listInfo.lastNum+1}">[다음]</a>
      						</td>
   						</c:if>
					</tr>
				</tbody>
			</table>
		</div> --%>
		
		
		<script>
			function paging(curPage) {
				var startDate = $('#select1').val();
				$.ajax({
					method: 'GET',
					url: 'rankingInner',
					data: {startDate:startDate, kind:kind, curPage: curPage},
					success: function(data){
						$('#main-list').html(data);
					}
				});
			}
		</script>