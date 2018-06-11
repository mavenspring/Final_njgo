<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	.searchModal .modal-content{
		background-color: #ff9966;
	}
	
	.searchModal .modal-header{
		border: none;
		background: none;
	}
	
	.searchModal .modal-body{
		text-align: center;
	}
	
	.searchModal .fridge{
	    margin: 0 auto;
	    text-align: center;
	    height: 60%;
		background: none;
		padding-top: 0px;
	    padding-bottom: 3%;
	    border-radius: 5px;
	}
	
	.searchModal .fridge h3{
		color: white;
		letter-spacing: -1px;
	}
	
	.searchModal .fridge h1 {
	    color: #006699;
	    font-weight: bold;
	}
	
	.searchModal .fridge .ingkeyword2{
		width: 400px;
		padding: 0 35px 0 0;
		border: 1px solid #006699;
		height: 50px;
	    text-align: center;
	    margin: 0 auto;
	    border-radius: 5px;
	}
	
	.searchModal .fridge .searchBtn{
		position: absolute;
	    margin-left: -35px;
	    margin-top: 13px;
	}
	
	.searchModal .fridge .ing_search2{
		height: 200px;
	    width: 400px;
	    border: 1px solid #006699;
	    padding: 0 0;
	    border-radius: 5px;
	    background-color: white;
	    margin: 1% auto;
	}
	
	.searchModal .isearch_btn2{
		width: 400px;
	    height: 50px;
	    background-color: white;
	    color: #006699;
	    border: 1px solid #006699;
	    font-size: 15px;
	    font-weight: bold;
	}
	
	.searchModal .ing_search2 .ing_search2_top{
		border-bottom: 1px solid lightgray;
	    height: 50px;
	    font-size: 19px;
	    font-weight: bold;
	    letter-spacing: -1px;
	    color: #ff9966;
	    line-height: 50px;
	}
	
	.searchModal .ing_search2 .ing_search2_bot{
		padding: 10px 5px;
	    font-size: 16px;
	    color: lightgray;
	}
	
	.searchModal .btn-warning {
	    background: none;
	    border: none;
	    display: block;
	    float: left;
	    height: 30px;
	    color: black;
	}
	
	.ingx2:HOVER{
		color: black;
		background: none;
	}
	
	.searchModal .modal-footer{
		border: none;
	}
	
	.modal-backdrop{
		display: none;
	}
</style>
<div class="modal fade searchModal" id="ingredientsSearch" role="dialog">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body">
				<article class="fridge">
					<h3>냉장고를 부탁해! 냉장고에 숨어 있는 재료로 맛있는 요리를 만들어보세요.</h3>
					<h1>내가 가진 재료로 레시피 추천받기</h1>
					<br>
					<div class=selections>
						<input type=text list="ings2" autocomplete="on" placeholder="재료명을 쓰고 Enter를 누르면 쉽게 찾을 수 있어요!" onkeydown="ingsearch2(this)" class="ingkeyword2">
						<img alt="" src="${pageContext.request.contextPath}/resources/images/csy/searchBtn.png" class="searchBtn">
						
						<datalist id="ings2" class="ings2">
						</datalist>
							
							<!-- 
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" class="btn btn-primary ing_btn2" value="추가"> -->
					</div>
					<div class=ing_search2>
						<div class="ing_search2_top">내가 선택한 재료</div>
						<div class="ing_search2_bot"></div>
					</div>
					<input type="button" class="btn btn-primary isearch_btn2" value="이 재료로 추천받기" data-dismiss="modal">
				</article>
			</div>
			
		</div>
	</div>
</div>