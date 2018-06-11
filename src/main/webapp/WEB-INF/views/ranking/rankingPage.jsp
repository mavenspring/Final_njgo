<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../resources/css/common/reset.css">
<c:import url="../tmp/Bootstrap.jsp" />
<link rel="stylesheet" href="../resources/css/common/basic.css">
<title>Insert title here</title>
<style type="text/css">
.main_wrap {
	width: 100%;
	margin-top: 150px;
}

.rank_st2 {
	border-bottom: 1px solid #dbdbdb;
}
.m-tcol-c{
    color: #333333;
    word-wrap: break-word;
}
.midImg{
	width: 100%;
	height: 342px;
	border-bottom: 5px solid #cccccc;
}
.midImg img{
	width: 100%;
	height: 100%;
}

</style>
</head>
<body>
<c:import url="../tmp/header.jsp" />
<!-- -------------------------------------------section----------------------------------------------------------  -->
<section class="main_section">
	<div class="main_wrap">
		<table width="100%" height="470" border="0" cellpadding="0" cellspacing="0">
			<tbody>
				<tr>
					<td align="center" valign="top">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tbody>
								<tr>
									<td  height="45"><span
										style="margin-left: 15px; font-weight: bold;">${board}</span><span
										class="rank_tt2">월간 ${board} 순위를 나타냅니다.</span></td>
								</tr>
							</tbody>
						</table>
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tbody>
								<tr>
									<td class="rank_st1"><table width="590" border="0"
											cellspacing="0" cellpadding="0">
											<tbody>
												<tr>
													<td width="120" height="30" align="center"
														class="rank_tab_off upload"><a href="uploadPage">셰프
															랭킹</a></td>
													<td width="120" height="30" align="center"
														class="rank_tab_off scrap"><a href="scrapPage">스크랩수
															랭킹</a></td>
													<td width="120" height="30" align="center"
														class="rank_tab_off hit"><a href="hitPage">조회수
															랭킹</a></td>
													<td width="230" height="30" align="right" valign="top"></td>
												</tr>
											</tbody>
										</table></td>
									</tr>
									<tr style="border-bottom: 5px solid #cccccc;">
										<td align="center">
											<table width="620" border="0" cellspacing="0" cellpadding="0"
												style=" margin-left: 30px;">
												<tbody>
													<tr><td height="27" colspan="6" align="center"></td></tr>
													<tr>
														<th width="40" valign="top"><img
															src="http://img.tygem.com/images/06/ranking/icon_rank1_1.gif"></th>
														<td width="140" valign="top"><table width="100%"
																border="0" cellspacing="0" cellpadding="0">
																<tbody>
																	<tr>
																		<!-- -------------------------------------------main-top---------------------------------------------------------  -->
																		<!-- 사진1 -->
																		<td align="left"><span class="rank_pic"
																			style="height: 111px; border-radius: 100px;">
																				<span style="cursor: hand;"> <img
																					id="rep_pic1" src="" border="0" width="107"
																					height="86"
																					style="height: 111px; border-radius: 100px;">
																			</span>
																		</span></td>
																	</tr>
																	<tr>
																		<td id="foodname1" style="padding-left: 20px;"
																			height="25" align="left" class="rank_id"><span
																			style="cursor: hand"></span></td>
																	</tr>
																	<tr>
																		<td id="hit1" style="padding-left: 20px;" height="25"
																			align="left" class="rank_r"><img
																			src="http://img.tygem.com/images/06/ranking/icon_rank1_2.gif"
																			align="absmiddle" style="margin-right: 6px"></td>
																	</tr>
																</tbody>
															</table></td>
														<th width="40" valign="top"><img
															src="http://img.tygem.com/images/06/ranking/icon_rank2_1.gif"></th>
														<td width="140" valign="top"><table width="100%"
																border="0" cellspacing="0" cellpadding="0">
																<tbody>
																	<tr>



																		<!-- 사진2 -->
																		<td align="left"><span class="rank_pic"
																			style="height: 111px; border-radius: 100px;">
																				<span style="cursor: hand;"> <img
																					id="rep_pic2" src="" border="0" width="107"
																					height="86"
																					style="height: 111px; border-radius: 100px;">
																			</span>
																		</span></td>
																	</tr>
																	<tr>
																		<td id="foodname2" style="padding-left: 22px;"
																			height="25" align="left" class="rank_id"><span
																			style="cursor: hand"></span></td>
																	</tr>
																	<tr>
																		<td id="hit2" style="padding-left: 22px;" height="25"
																			align="left" class="rank_r"><img
																			src="http://img.tygem.com/images/06/ranking/icon_rank2_2.gif"
																			align="absmiddle" style="margin-right: 6px"></td>
																	</tr>
																</tbody>
															</table></td>
														<th width="40" valign="top"><img
															src="http://img.tygem.com/images/06/ranking/icon_rank3_1.gif"></th>
														<td width="140" valign="top"><table width="100%"
																border="0" cellspacing="0" cellpadding="0">
																<tbody>
																	<tr>

																		<!-- 사진3 -->
																		<td align="left"><span class="rank_pic"
																			style="height: 111px; border-radius: 100px;">
																				<span style="cursor: hand;"> <img
																					id="rep_pic3" src="" border="0" width="107"
																					height="86"
																					style="height: 111px; border-radius: 100px;">
																			</span>
																		</span></td>
																	</tr>
																	<tr>
																		<td id="foodname3" style="padding-left: 25px;"
																			height="25" align="left" class="rank_id"><span
																			style="cursor: hand"></span></td>
																	</tr>
																	<tr>
																		<td id="hit3" style="padding-left: 25px;" height="25"
																			align="left" class="rank_r"><img
																			src="http://img.tygem.com/images/06/ranking/icon_rank3_2.gif"
																			align="absmiddle" style="margin-right: 6px"></td>
																	</tr>
																</tbody>
															</table></td>
													</tr>

												</tbody>
											</table>
										</td>
									</tr>
								</tbody>
							</table> <!-- -------------------------------------------main-select---------------------------------------------------------  -->
							<div class="midImg">
								<img src="../resources/images/csy/banner6.jpg">
							</div>
							
							<div id="view_txt" style="margin-top: 10px;">
								<link rel="stylesheet" type="text/css"
									href="http://img.tygem.com/images/06/css/ranking.css">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<form name="fo" method="post"
										action="/guinness/main_rank2017.html"></form>
									<tbody>
										<tr>
											<td width="49%"><span class="rank_tt3">랭킹</span> <select
												id="select1" name="before_date">
													<option value="201701">2017년 01월</option>
													<option value="201702">2017년 02월</option>
													<option value="201703">2017년 03월</option>
													<option value="201704">2017년 04월</option>
													<option value="201705">2017년 05월</option>
													<option value="201706">2017년 06월</option>
													<option value="201707">2017년 07월</option>
													<option value="201708" selected="">2017년 08월</option>
											</select></td>
											<td width="51%" align="right" valign="bottom"><span
												class="rank_tt2">실시간 업데이트</span></td>
										</tr>
									</tbody>
								</table>
								<br>
								<div id="main-list">
									<!-- -------------------------------------------main-list---------------------------------------------------------  -->
								</div>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</section>	
<c:import url="../tmp/footer.jsp" />
<script type="text/javascript">
	//조회수 1-3
	var kind = '${kind}';
	if(kind =='hit'){
	$('.hit').attr('class','rank_tab_on');
	$.ajax({
		method: 'GET',
		url: '${pageContext.request.contextPath}/ranking/rankingHit',
		success: function(data){
			$(data).each(function(index){
				if(index==0){
					$('#rep_pic1').attr('src','${pageContext.request.contextPath}/resources/upload/'+this.rep_pic);
					$('#foodname1>span').text(this.foodname);
					$('#hit1').append(this.hit);	
				}else if(index==1){
					$('#rep_pic2').attr('src','${pageContext.request.contextPath}/resources/upload/'+this.rep_pic);
					$('#foodname2>span').text(this.foodname);
					$('#hit2').append(this.hit);
				}else if(index==2){
					$('#rep_pic3').attr('src','${pageContext.request.contextPath}/resources/upload/'+this.rep_pic);
					$('#foodname3>span').text(this.foodname);
					$('#hit3').append(this.hit);
				}
			});
		}
	});
	}
	else if(kind == 'scrap'){
	$('.scrap').attr('class','rank_tab_on');
	$.ajax({
		method: 'GET',
		url: '${pageContext.request.contextPath}/ranking/rankingScrap',
		success: function(data){
			$(data).each(function(index){
				if(index==0){
					$('#rep_pic1').attr('src','${pageContext.request.contextPath}/resources/upload/'+this.rep_pic);
					$('#foodname1>span').text(this.foodname);
					$('#hit1').append(this.scrap);	
				}else if(index==1){
					$('#rep_pic2').attr('src','${pageContext.request.contextPath}/resources/upload/'+this.rep_pic);
					$('#foodname2>span').text(this.foodname);
					$('#hit2').append(this.scrap);
				}else if(index==2){
					$('#rep_pic3').attr('src','${pageContext.request.contextPath}/resources/upload/'+this.rep_pic);
					$('#foodname3>span').text(this.foodname);
					$('#hit3').append(this.scrap);
				}
			});
		}
	});
	}else if(kind == 'upload'){
	$('.upload').attr('class','rank_tab_on');
	$.ajax({
		method: 'GET',
		url: '${pageContext.request.contextPath}/ranking/rankingUpload',
		success: function(data){
			$(data).each(function(index){
				var image = '${pageContext.request.contextPath}/resources/images/common/default.png';
				if(this.myphoto == 'sns'){
					if(this.sns_photo != null){							
						image = this.sns_photo;
					}
				}else{
					if(this.myphoto != null || this.myphoto != ''){
						image = '${pageContext.request.contextPath}/resources/upload/'+this.myphoto;
					}
				}
				if(index==0){
					$('#rep_pic1').attr('src',image);
					$('#foodname1>span').text(this.writer);
					$('#hit1').append(this.ct);	
				}else if(index==1){
					$('#rep_pic2').attr('src',image);
					$('#foodname2>span').text(this.writer);
					$('#hit2').append(this.ct);
				}else if(index==2){
					$('#rep_pic3').attr('src',image);
					$('#foodname3>span').text(this.writer);
					$('#hit3').append(this.ct);
				}
			});
		}
	});
	}
	var startDate='201708';
	$.ajax({
		method: 'GET',
		url: 'rankingInner',
		data: {startDate:startDate, kind:kind},
		success: function(data){
			$('#main-list').html(data);
		}
	});
	
	$('#select1').change(function() {
		var startDate = $(this).val();
		$.ajax({
			method: 'GET',
			url: 'rankingInner',
			data: {startDate:startDate, kind:kind},
			success: function(data){
				$('#main-list').html(data);
			}
		}); 
	}); 


		/* location.href="rankingPage?startDate="+startDate;  $(data).find('#list').html()*/
</script>
</body>
</html>