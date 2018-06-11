/**
 * 
 */
$('#ui-accordion-accordion-header-9').click(function() {		
		var kind='다이어트식단';
		/* location.href="recommend?kind="+kind; */
		$.ajax({
			type:'GET',
			url:'recommend',
			data:{kind:kind},
			success : function(data) {
				$('.container-bottom').html(data);
				$('.container-bottom').css("display", "block");
				$('.c_1').css("color", "#ffcc00");
				$('#ui-accordion-accordion-header-9').css("display","none");
				$('#ui-accordion-accordion-panel-0').css("height", "244px");
			}
		});
	});
	$('.break1').click(function () {
		$('#break1').css('display','block');
	});
	$('#break1').blur(function () {
		$(this).css('display','none');
		$('#p_break1').html($('#break1').val());
		$('#p_break1').css('color','#ffcc00');
		$('#p_break1').css('font-weight','900');
		if($('#break1').val() != ''){
			$('#p_break1').append('<span class="span" style="color: red; margin:0 5px 0 5px; cursor:pointer">x</span>');	
		}
	});
	$('#p_break1').click(function () {
		$(this).empty();
	});
	$('.break2').click(function () {
		$('#break2').css('display','block');
	});
	$('#break2').blur(function () {
		$(this).css('display','none');
		$('#p_break2').html($('#break2').val());
		$('#p_break2').css('color','#ffcc00');
		$('#p_break2').css('font-weight','900');
		if($('#break2').val() != ''){
			$('#p_break2').append('<span class="span" style="color: red; margin:0 5px 0 5px; cursor:pointer">x</span>');	
		}
	});
	$('#p_break2').click(function () {
		$(this).empty();
	});
	$('.break3').click(function () {
		$('#break3').css('display','block');
	});
	$('#break3').blur(function () {
		$(this).css('display','none');
		$('#p_break3').html($('#break3').val());
		$('#p_break3').css('color','#ffcc00');
		$('#p_break3').css('font-weight','900');
		if($('#break3').val() != ''){
			$('#p_break3').append('<span class="span" style="color: red; margin:0 5px 0 5px; cursor:pointer">x</span>');	
		}
	});
	$('#p_break3').click(function () {
		$(this).empty();
	});
	$('.break4').click(function () {
		$('#break4').css('display','block');
	});
	$('#break4').blur(function () {
		$(this).css('display','none');
		$('#p_break4').html($('#break1').val());
		$('#p_break4').css('color','#ffcc00');
		$('#p_break4').css('font-weight','900');
		if($('#break4').val() != ''){
			$('#p_break4').append('<span class="span" style="color: red; margin:0 5px 0 5px; cursor:pointer">x</span>');	
		}
	});
	$('#p_break4').click(function () {
		$(this).empty();
	});
	$('.break5').click(function () {
		$('#break5').css('display','block');
	});
	$('#break5').blur(function () {
		$(this).css('display','none');
		$('#p_break5').html($('#break5').val());
		$('#p_break5').css('color','#ffcc00');
		$('#p_break5').css('font-weight','900');
		if($('#break5').val() != ''){
			$('#p_break5').append('<span class="span" style="color: red; margin:0 5px 0 5px; cursor:pointer">x</span>');	
		}
	});
	$('#p_break5').click(function () {
		$(this).empty();
	});
	$('.break6').click(function () {
		$('#break6').css('display','block');
	});
	$('#break6').blur(function () {
		$(this).css('display','none');
		$('#p_break6').html($('#break6').val());
		$('#p_break6').css('color','#ffcc00');
		$('#p_break6').css('font-weight','900');
		if($('#break6').val() != ''){
			$('#p_break6').append('<span class="span" style="color: red; margin:0 5px 0 5px; cursor:pointer">x</span>');	
		}
	});
	$('#p_break6').click(function () {
		$(this).empty();
	});
	$('.break7').click(function () {
		$('#break7').css('display','block');
	});
	$('#break7').blur(function () {
		$(this).css('display','none');
		$('#p_break7').html($('#break7').val());
		$('#p_break7').css('color','#ffcc00');
		$('#p_break7').css('font-weight','900');
		if($('#break7').val() != ''){
			$('#p_break7').append('<span class="span" style="color: red; margin:0 5px 0 5px; cursor:pointer">x</span>');	
		}
	});
	$('#p_break7').click(function () {
		$(this).empty();
	});
	
	/***************************************************lunch****************************************************/
	$('.lunch1').click(function () {
		$('#lunch1').css('display','block');
	});
	$('#lunch1').blur(function () {
		$(this).css('display','none');
		$('#p_lunch1').append($('#lunch1').val());
		$('#p_lunch1').css('color','#ffcc00');
		$('#p_lunch1').css('font-weight','900');
		if($('#lunch1').val() != ''){
			$('#p_lunch1').append('<span class="span" style="color: red; margin:0 5px 0 5px; cursor:pointer">x</span>');	
		}
	});
	$('#p_lunch1').click(function () {
		$(this).empty();
	});
	$('.lunch2').click(function () {
		$('#lunch2').css('display','block');
	});
	$('#lunch2').blur(function () {
		$(this).css('display','none');
		$('#p_lunch2').append($('#lunch2').val());
		$('#p_lunch2').css('color','#ffcc00');
		$('#p_lunch2').css('font-weight','900');
		if($('#lunch2').val() != ''){
			$('#p_lunch2').append('<span class="span" style="color: red; margin:0 5px 0 5px; cursor:pointer">x</span>');	
		}
	});
	$('#p_lunch2').click(function () {
		$(this).empty();
	});
	$('.lunch3').click(function () {
		$('#lunch3').css('display','block');
	});
	$('#lunch3').blur(function () {
		$(this).css('display','none');
		$('#p_lunch3').append($('#lunch3').val());
		$('#p_lunch3').css('color','#ffcc00');
		$('#p_lunch3').css('font-weight','900');
		if($('#lunch3').val() != ''){
			$('#p_lunch3').append('<span class="span" style="color: red; margin:0 5px 0 5px; cursor:pointer">x</span>');	
		}
	});
	$('#p_lunch3').click(function () {
		$(this).empty();
	});
	$('.lunch4').click(function () {
		$('#lunch4').css('display','block');
	});
	$('#lunch4').blur(function () {
		$(this).css('display','none');
		$('#p_lunch4').append($('#lunch4').val());
		$('#p_lunch4').css('color','#ffcc00');
		$('#p_lunch4').css('font-weight','900');
		if($('#lunch4').val() != ''){
			$('#p_lunch4').append('<span class="span" style="color: red; margin:0 5px 0 5px; cursor:pointer">x</span>');	
		}
	});
	$('#p_lunch4').click(function () {
		$(this).empty();
	});
	$('.lunch5').click(function () {
		$('#lunch5').css('display','block');
	});
	$('#lunch5').blur(function () {
		$(this).css('display','none');
		$('#p_lunch5').append($('#lunch5').val());
		$('#p_lunch5').css('color','#ffcc00');
		$('#p_lunch5').css('font-weight','900');
		if($('#lunch5').val() != ''){
			$('#p_lunch5').append('<span class="span" style="color: red; margin:0 5px 0 5px; cursor:pointer">x</span>');	
		}
	});
	$('#p_lunch5').click(function () {
		$(this).empty();
	});
	$('.lunch6').click(function () {
		$('#lunch6').css('display','block');
	});
	$('#lunch6').blur(function () {
		$(this).css('display','none');
		$('#p_lunch6').append($('#lunch6').val());
		$('#p_lunch6').css('color','#ffcc00');
		$('#p_lunch6').css('font-weight','900');
		if($('#lunch6').val() != ''){
			$('#p_lunch6').append('<span class="span" style="color: red; margin:0 5px 0 5px; cursor:pointer">x</span>');	
		}
	});
	$('#p_lunch6').click(function () {
		$(this).empty();
	});
	$('.lunch7').click(function () {
		$('#lunch7').css('display','block');
	});
	$('#lunch7').blur(function () {
		$(this).css('display','none');
		$('#p_lunch7').append($('#lunch7').val());
		$('#p_lunch7').css('color','#ffcc00');
		$('#p_lunch7').css('font-weight','900');
		if($('#lunch7').val() != ''){
			$('#p_lunch7').append('<span class="span" style="color: red; margin:0 5px 0 5px; cursor:pointer">x</span>');	
		}
	});
	$('#p_lunch7').click(function () {
		$(this).empty();
	});
	
	
	/*************************************************dinner********************************************************/
	$('.dinner1').click(function () {
		$('#dinner1').css('display','block');
	});
	$('#dinner1').blur(function () {
		$(this).css('display','none');
		$('#p_dinner1').append($('#dinner1').val());
		$('#p_dinner1').css('color','#ffcc00');
		$('#p_dinner1').css('font-weight','900');
		if($('#dinner1').val() != ''){
			$('#p_dinner1').append('<span class="span" style="color: red; margin:0 5px 0 5px; cursor:pointer">x</span>');	
		}
	});
	$('#p_dinner1').click(function () {
		$(this).empty();
	});
	$('.dinner2').click(function () {
		$('#dinner2').css('display','block');
	});
	$('#dinner2').blur(function () {
		$(this).css('display','none');
		$('#p_dinner2').append($('#dinner2').val());
		$('#p_dinner2').css('color','#ffcc00');
		$('#p_dinner2').css('font-weight','900');
		if($('#dinner2').val() != ''){
			$('#p_dinner2').append('<span class="span" style="color: red; margin:0 5px 0 5px; cursor:pointer">x</span>');	
		}
	});
	$('#p_dinner2').click(function () {
		$(this).empty();
	});
	$('.dinner3').click(function () {
		$('#dinner3').css('display','block');
	});
	$('#dinner3').blur(function () {
		$(this).css('display','none');
		$('#p_dinner3').append($('#dinner3').val());
		$('#p_dinner3').css('color','#ffcc00');
		$('#p_dinner3').css('font-weight','900');
		if($('#dinner3').val() != ''){
			$('#p_dinner3').append('<span class="span" style="color: red; margin:0 5px 0 5px; cursor:pointer">x</span>');	
		}
	});
	$('#p_dinner3').click(function () {
		$(this).empty();
	});
	$('.dinner4').click(function () {
		$('#dinner4').css('display','block');
	});
	$('#dinner4').blur(function () {
		$(this).css('display','none');
		$('#p_dinner4').append($('#dinner4').val());
		$('#p_dinner4').css('color','#ffcc00');
		$('#p_dinner4').css('font-weight','900');
		if($('#dinner4').val() != ''){
			$('#p_dinner4').append('<span class="span" style="color: red; margin:0 5px 0 5px; cursor:pointer">x</span>');	
		}
	});
	$('#p_dinner4').click(function () {
		$(this).empty();
	});
	$('.dinner5').click(function () {
		$('#dinner5').css('display','block');
	});
	$('#dinner5').blur(function () {
		$(this).css('display','none');
		$('#p_dinner5').append($('#dinner5').val());
		$('#p_dinner5').css('color','#ffcc00');
		$('#p_dinner5').css('font-weight','900');
		if($('#dinner5').val() != ''){
			$('#p_dinner5').append('<span class="span" style="color: red; margin:0 5px 0 5px; cursor:pointer">x</span>');	
		}
	});
	$('#p_dinner5').click(function () {
		$(this).empty();
	});
	$('.dinner6').click(function () {
		$('#dinner6').css('display','block');
	});
	$('#dinner6').blur(function () {
		$(this).css('display','none');
		$('#p_dinner6').append($('#dinner6').val());
		$('#p_dinner6').css('color','#ffcc00');
		$('#p_dinner6').css('font-weight','900');
		if($('#dinner6').val() != ''){
			$('#p_dinner6').append('<span class="span" style="color: red; margin:0 5px 0 5px; cursor:pointer">x</span>');	
		}
	});
	$('#p_dinner6').click(function () {
		$(this).empty();
	});
	$('.dinner7').click(function () {
		$('#dinner7').css('display','block');
	});
	$('#dinner7').blur(function () {
		$(this).css('display','none');
		$('#p_dinner7').append($('#dinner7').val());
		$('#p_dinner7').css('color','#ffcc00');
		$('#p_dinner7').css('font-weight','900');
		if($('#dinner7').val() != ''){
			$('#p_dinner7').append('<span class="span" style="color: red; margin:0 5px 0 5px; cursor:pointer">x</span>');	
		}
	});
	$('#p_dinner7').click(function () {
		$(this).empty();
	});
	
	
	
	/********************************************************add menu***************************************************************/
	$('.add1').click(function () {
		$('#add1').css('display','block');
	});
	$('#add1').blur(function () {
		$(this).css('display','none');
		$('#p_add1').append($('#add1').val());
		$('#p_add1').css('color','#ffcc00');
		$('#p_add1').css('font-weight','900');
		if($('#add1').val() != ''){
			$('#p_add1').append('<span class="span" style="color: red; margin:0 5px 0 5px; cursor:pointer">x</span>');	
		}
	});
	$('#p_add1').click(function () {
		$(this).empty();
	});
	$('.add2').click(function () {
		$('#add2').css('display','block');
	});
	$('#add2').blur(function () {
		$(this).css('display','none');
		$('#p_add2').append($('#add2').val());
		$('#p_add2').css('color','#ffcc00');
		$('#p_add2').css('font-weight','900');
		if($('#add2').val() != ''){
			$('#p_add2').append('<span class="span" style="color: red; margin:0 5px 0 5px; cursor:pointer">x</span>');	
		}
	});
	$('#p_add2').click(function () {
		$(this).empty();
	});
	$('.add3').click(function () {
		$('#add3').css('display','block');
	});
	$('#add3').blur(function () {
		$(this).css('display','none');
		$('#p_add3').append($('#add3').val());
		$('#p_add3').css('color','#ffcc00');
		$('#p_add3').css('font-weight','900');
		if($('#add3').val() != ''){
			$('#p_add3').append('<span class="span" style="color: red; margin:0 5px 0 5px; cursor:pointer">x</span>');	
		}
	});
	$('#p_add3').click(function () {
		$(this).empty();
	});
	$('.add4').click(function () {
		$('#add4').css('display','block');
	});
	$('#add4').blur(function () {
		$(this).css('display','none');
		$('#p_add4').append($('#add4').val());
		$('#p_add4').css('color','#ffcc00');
		$('#p_add4').css('font-weight','900');
		if($('#add4').val() != ''){
			$('#p_add4').append('<span class="span" style="color: red; margin:0 5px 0 5px; cursor:pointer">x</span>');	
		}
	});
	$('#p_add4').click(function () {
		$(this).empty();
	});
	$('.add5').click(function () {
		$('#add5').css('display','block');
	});
	$('#add5').blur(function () {
		$(this).css('display','none');
		$('#p_add5').append($('#add5').val());
		$('#p_add5').css('color','#ffcc00');
		$('#p_add5').css('font-weight','900');
		if($('#add5').val() != ''){
			$('#p_add5').append('<span class="span" style="color: red; margin:0 5px 0 5px; cursor:pointer">x</span>');	
		}
	});
	$('#p_add5').click(function () {
		$(this).empty();
	});
	$('.add6').click(function () {
		$('#add6').css('display','block');
	});
	$('#add6').blur(function () {
		$(this).css('display','none');
		$('#p_add6').append($('#add6').val());
		$('#p_add6').css('color','#ffcc00');
		$('#p_add6').css('font-weight','900');
		if($('#add6').val() != ''){
			$('#p_add6').append('<span class="span" style="color: red; margin:0 5px 0 5px; cursor:pointer">x</span>');	
		}
	});
	$('#p_add6').click(function () {
		$(this).empty();
	});
	$('.add7').click(function () {
		$('#add7').css('display','block');
	});
	$('#add7').blur(function () {
		$(this).css('display','none');
		$('#p_add7').append($('#add7').val());
		$('#p_add7').css('color','#ffcc00');
		$('#p_add7').css('font-weight','900');
		if($('#add7').val() != ''){
			$('#p_add7').append('<span class="span" style="color: red; margin:0 5px 0 5px; cursor:pointer">x</span>');	
		}
	});
	$('#p_add7').click(function () {
		$(this).empty();
	});
	
	
	$('#mealplan-save').click(function() {
		$("#frm").submit();
	});