<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<section class="left_menu">
	<div class="ranking_tab">
		<ul>
			<li class="active" title="hit">
				<a href="./ranking/hitPage"><img alt="" src="./resources/images/common/hit.png"></a>
			</li>
			<li title="scrap">
				<a href="./ranking/scrapPage"><img alt="" src="./resources/images/common/scrap.png"></a>
			</li>
			<li title="upload">
				<a href="./ranking/uploadPage"><img alt="" src="./resources/images/common/upload.png"></a>
			</li>
		</ul>
	</div>
	<div class="ranking_contents ranking_contents_hit" style="display: inline-block;" title="hit">
		<div class="ranking_image"><img alt="" src=""></div>
		<div class="ranking_title"></div>
		<div class="ranking_writer"></div>
		
		<article class="title_menu title_menu_active" data-id="0">
			<img alt="" src="./resources/images/common/gold-medal.png">
			<span class="ranking_title_0 rankingTitleMenu"></span>
		</article>
		<article class="title_menu" data-id="1">
			<img alt="" src="./resources/images/common/silver-medal.png">
			<span class="ranking_title_1 rankingTitleMenu"></span>
		</article>
		<article class="title_menu" data-id="2">
			<img alt="" src="./resources/images/common/bronze-medal.png">
			<span class="ranking_title_2 rankingTitleMenu"></span>
		</article>
	</div>
	
	<div class="ranking_contents ranking_contents_scrap" title="scrap">
		<div class="ranking_image"><img alt="" src=""></div>
		<div class="ranking_title"></div>
		<div class="ranking_writer"></div>
		
		<article class="title_menu title_menu_active" data-id="0">
			<img alt="" src="./resources/images/common/gold-medal.png">
			<span class="ranking_title_0 rankingTitleMenu"></span>
		</article>
		<article class="title_menu" data-id="1">
			<img alt="" src="./resources/images/common/silver-medal.png">
			<span class="ranking_title_1 rankingTitleMenu"></span>
		</article>
		<article class="title_menu" data-id="2">
			<img alt="" src="./resources/images/common/bronze-medal.png">
			<span class="ranking_title_2 rankingTitleMenu"></span>
		</article>
	</div>
	
	<div class="ranking_contents ranking_contents_upload" title="upload">
		<div class="ranking_image"><img alt="" src=""></div>
		<div class="ranking_title"></div>
		<div class="ranking_writer"></div>
		
		<article class="user_menu title_menu_active" data-id="0">
			<img alt="" src="./resources/images/common/gold-medal.png">
			<span class="ranking_title_0 rankingTitleMenu"></span>
		</article>
		<article class="user_menu" data-id="1">
			<img alt="" src="./resources/images/common/silver-medal.png">
			<span class="ranking_title_1 rankingTitleMenu"></span>
		</article>
		<article class="user_menu" data-id="2">
			<img alt="" src="./resources/images/common/bronze-medal.png">
			<span class="ranking_title_2 rankingTitleMenu"></span>
		</article>
	</div>
</section>
<style>
	.left_menu {
		width: 12%;
		height: 100px;
		top: 110px;
		position: absolute;
		float: left;
	}
	.title_menu img, .user_menu img {
		width: 24px;
		height: 20px;
	}
	.ranking_tab {
		width: 100%;
		height: 35px;
		margin-top: -10px;
	}
	.ranking_tab img {
		width: 60px;
		height: 30px;
	}
	.ranking_tab li {
		list-style: none;
		float: left;
		width: 33.33%;
		height: 35px;
		border: 1px solid #d7d7d7;
		background-color: white;
		padding-top: 5px;
		text-align: center;
	}
	.ranking_tab li:first-child {
		border-bottom: 0;
		background-color: white;
	}
	.ranking_tab li:not(:last-child) {
		border-right: 0;
	}
	.ranking_contents {
		width: 99.99%;
		height: 320px;
		border: 1px solid #d7d7d7;
		border-top: 0;
		background-color: white;
		display: none;
		padding: 20px;
	}
	.ranking_image {
		text-align: center;	
	}
	.ranking_image img {
		width: 110px;
		height: 110px;
	}
	.ranking_title {
		font-size: medium;
		text-align: center;
		font-weight: bold;
		margin-top: 20px;
	}
	.ranking_writer {
		text-align: center;
		margin-bottom: 20px;
	}
	.title_menu, .user_menu {
		margin-bottom: 10px;
	}
	.ranking_title, .ranking_writer {
		max-width: 180px;
		overflow: hidden;
		white-space: nowrap;
		text-overflow: ellipsis;
	}
	.rankingTitleMenu {
		max-width: 140px;
		overflow: hidden;
		white-space: nowrap;
		text-overflow: ellipsis;
		display: block;
	}
	.title_menu img, .user_menu img {
		float: left;
	}
</style>
<script>
	var jsonData;
	$(function() {
		$.get("./recipe/rank", function(data) {
			jsonData = data;
			
			for(var i=0;i<data.hit.length;i++) {
				$(".ranking_contents_hit").find(".ranking_title_"+ i).text(data.hit[i].title);
			}
			for(var i=0;i<data.scrap.length;i++) {
				$(".ranking_contents_scrap").find(".ranking_title_"+ i).text(data.scrap[i].title);
			}			
			for(var i=0;i<data.upload.length;i++) {
				$(".ranking_contents_upload").find(".ranking_title_"+ i).text(data.upload[i].nickName);
			}
			
			$(".ranking_tab li").eq(0).css("background-color", "#f7e7da");
			$(".ranking_contents").css("background-color", "#f7e7da");
			$(".ranking_image img").attr("src", "./resources/upload/" + data.hit[0].rep_pic);
			$(".ranking_title").text(data.hit[0].title);
			$(".ranking_writer").text(data.hit[0].writer + " 님");
		});
		
		$(document).on("mouseover", ".title_menu", function() {
			titleMenu($(this));
		});
		
		$(document).on("mouseover", ".user_menu", function() {
			userMenu($(this));
		});
		
		$(document).on("mouseover", ".ranking_tab li", function() {
			mouseoverMenu($(this));
		});
		
		$(window).resize(function(){
			var mainOffset = $(".main_section").offset();
			var leftWidth = $(".left_menu").width();
			$(".left_menu").css("left", mainOffset.left - leftWidth - 20);
		}).resize();
	});
function mouseoverMenu(select) {
	var num = select.index();
	$(".ranking_tab li").css("background-color", "white");
	$(".ranking_tab li").css("border-bottom", "1px solid #d7d7d7");

	$(".ranking_contents").css("display", "none");
	var color;
	if(num == 0) {
		color = "#f7e7da";
	} else if(num == 1) {
		color = "#c3ebeb";
	} else {
		color = "#ffdee4";
	}
	
	select.css("background-color", color);
	$(".ranking_contents").css("background-color", color);
	select.css("border-bottom", "0");
	select.attr("class", "active");
	
	if( select.attr("title") == "hit") {
		titleMenu($(".ranking_contents_hit").find("article").eq(0));
	} else if( select.attr("title") == "scrap") {
		titleMenu($(".ranking_contents_scrap").find("article").eq(0));
	} else {
		userMenu($(".ranking_contents_upload").find("article").eq(0));
	}
	
	$(".ranking_contents").eq(num).css("display", "inline-block");
}
function titleMenu(select) {
	var parent = select.parent().attr("title");
	var num = select.attr("data-id");
	var json;
	
	if(parent == "hit") {
		json = jsonData.hit[num];
	} else if(parent == "scrap") {
		json = jsonData.scrap[num];
	} else {
		json = jsonData.upload[num];
	}
	
	$(".ranking_image img").attr("src", "./resources/upload/" + json.rep_pic);
	$(".ranking_title").text(json.title);
	$(".ranking_writer").text(json.writer + " 님");	
}

function userMenu(select) {
	var parent = select.parent().attr("title");
	var num = select.attr("data-id");
	var json;
	
	if(parent == "hit") {
		json = jsonData.hit[num];
	} else if(parent == "scrap") {
		json = jsonData.scrap[num];
	} else {
		json = jsonData.upload[num];
	}
	var image = '${pageContext.request.contextPath}/resources/images/common/default.png';
	if(json.myPhoto == 'sns'){
		if(json.sns_photo != null){							
			image = json.sns_photo;
		}
	}else{
		if(json.myPhoto != null || json.myPhoto != ''){
			image = '${pageContext.request.contextPath}/resources/upload/'+json.myPhoto;
		}
	}
	$(".ranking_image img").attr("src", image);
	$(".ranking_title").text(json.nickName + " 님");
	$(".ranking_writer").text(json.email);
}
</script>