var options = {timeout: 30000, enableHighAccuracy: true, maximumAge: 75000};
var recommendArray = new Array();

function success(position) {
	console.log(position.coords.latitude + ", " + position.coords.longitude);
	realTimeWeather(position.coords.latitude, position.coords.longitude);
}

function error(error) {
    console.log(error.code);
    realTimeWeather(37.566535, 126.97796919999999);
}

function getLocation() {
	if("geolocation" in navigator) {
		navigator.geolocation.getCurrentPosition(success, error, options);
	} else {
		console.log("지오로케이션 없음");
	}
}
function realTimeWeather(latitude, longitude) {	
	var apiKey = '50fffd4dab5b991490697a45b247c4b3';
	var	forecastURL = 'http://api.openweathermap.org/data/2.5/weather?lat=' + latitude + '&lon=' + longitude + '&appid=' + apiKey;
	
	console.log(forecastURL);
	$.ajax({
		url: forecastURL,
		type: 'GET',
		success: function(msg) {			
			var weatherId = JSON.stringify(msg.weather[0].id);
			var weather;
			
			switch(weatherId.substring(0,1)) {
				case '2': 
					weather = '천둥번개';
					$("#weather_img").attr("src","./resources/images/common/cloud-and-lightnings.png");
					break;
				case '3' :
					weather = '비';
					$("#weather_img").attr("src","./resources/images/common/raindrops-falling-of-a-black-cloud.png");
					break;
				case '5' :
					weather = '비';
					$("#weather_img").attr("src","./resources/images/common/raindrops-falling-of-a-black-cloud.png");
					break;
				case '6' :
					weather = '눈';
					$("#weather_img").attr("src","./resources/images/common/snowflake.png");
					break;
				case '7' :
					weather = '구름많음';
					$("#weather_img").attr("src","./resources/images/common/plain-cloud (2).png");
					break;
				case '8' :
					if(weatherId == '800') {
						weather = '맑음';
						$("#weather_img").attr("src","./resources/images/common/sun.png");
					} else {
						weather = '구름약간';
						$("#weather_img").attr("src","./resources/images/common/icon.png");
					}
					break;
				case '9' :
					weather = '기타';
					$("#weather_img").attr("src","./resources/images/common/flood-danger-for-a-house-beside-the-sea.png");
			}
			
			var temperature;
			var c_temp = (JSON.stringify(msg.main.temp) - 273.15).toFixed(0);
			
			if(c_temp < 5) {
				temperature = '추움';
			} else if(c_temp >= 5 && c_temp < 13) {
				temperature = '쌀쌀';
			} else if(c_temp >= 14 && c_temp < 22) {
				temperature = '따뜻';
			} else if(c_temp >= 22 && c_temp < 29) {
				temperature = '더움';
			} else if(c_temp >= 29) {
				temperature = '폭염';
			}
			
			$("#temperature").html(c_temp + '°');
			console.log(temperature + ", " + weather);
			
			saveWeather(temperature, weather);
			searchRecommend(temperature, weather);
		}, error: function() {
			console.log("error");
		}
	});	
}
function saveWeather(temperature, weather) {
	$.post("./recipe/saveWeather",
	{
		temperature: temperature,
		weather: weather
	}, function(data) {
	});
}
function searchRecommend(temperature, weather) {
	var recommendRecipe;
	$.post("./recipe/recommend", 
	{
		temperature: temperature,
		weather: weather
	}, function(data) {
		if(JSON.stringify(data) != '[]') {
			for(var i=0;i<data.length;i++) {
				recommendArray.push(data[i].recipe);
			}
			var result = Math.floor(Math.random() * recommendArray.length);
			$("#recommendFood").html('"' + recommendArray[result] + '"');
			
			$.post("./recipe/recommendRecipe", 
			{
				recommend: recommendArray[result]
			}, function(data) {
				if(data.length != 0) {
					for(var i=0;i<data.length;i++) {
						var str = '<div class="recommendRecipe_sub">';
						str += '<img alt="" src="./resources/upload/' + data[i].rep_pic + '" title="' + data[i].num + '">';
						str += '<a href="./recipe/recipeView?num=' + data[i].num + '"><div class="overlap_recipeImg"></div></a>'
						str += '<div class="recommendRecipe_sub_title">' + data[i].title + '</div>';
						str += '</div>';
						
						$(".recommendRecipe").append(str);
					}
				} else {
					$(".recommendRecipe").text('"' + recommendArray[result] + '"의 레시피가 없습니다. 다른 분들을 위해 레시피를 올려주세요!');
				}
			});
		} else {
			$("#recommendFood").html('"오이냉국"');
			
			$.post("./recipe/recommendRecipe", 
			{
				recommend: '오이냉국'
			}, function(data) {
				if(data.length != 0) {
					for(var i=0;i<data.length;i++) {
						var str = '<div class="recommendRecipe_sub">';
						str += '<img alt="" src="./resources/upload/' + data[i].rep_pic + '" title="' + data[i].num + '">';
						str += '<a href="./recipe/recipeView?num=' + data[i].num + '"><div class="overlap_recipeImg"></div></a>'
						str += '<div class="recommendRecipe_sub_title">' + data[i].title + '</div>';
						str += '</div>';
						
						$(".recommendRecipe").append(str);
					}
				} else {
					$(".recommendRecipe").text('"오이냉국"의 레시피가 없습니다. 다른 분들을 위해 레시피를 올려주세요!');
				}
			});
		}
	});
}

function todayRecipeMouseOver(selector) {
	var index = $(".recommendRecipe_sub img").index();
	var offset = selector.offset();
	var width = selector.width();
	
	$(".overlap_recipeImg").eq(index).css(
	{
		width: width + "px",
		top: offset.top + "px",
		left: offset.left + "px",
		display: "inline-block"
	});
}