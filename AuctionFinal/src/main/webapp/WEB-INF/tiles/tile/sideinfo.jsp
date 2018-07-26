<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- ===== #38.  tiles 중 sideinfo 페이지 만들기 ===== --%>

<script type="text/javascript">
	$(document).ready(function() {
		loopshowNowTime();
		// 시간이 매 30분이 되면 기상청 날씨정보를 자동 갱신해서 가져오려고 함.
		// (정시마다 변경되어지는 날씨정보는 정시에 보내주지 않고 대략 20~30분이 지난 다음에 보내주므로)
		
	}); // end of ready(); ---------------------------------

	function showNowTime() {
		
		var now = new Date();
	
		var strNow = now.getFullYear() + "-" + (now.getMonth() + 1) + "-" + now.getDate();
		
		var hour = "";
		if(now.getHours() > 12) {
			hour = " 오후 " + (now.getHours() - 12);
		} else if(now.getHours() < 12) {
			hour = " 오전 " + now.getHours();
		} else {
			hour = " 정오 " + now.getHours();
		}
		
		var minute = "";
		if(now.getMinutes() < 10) {
			minute = "0"+now.getMinutes();
		} else {
			minute = ""+now.getMinutes();
		}
		
		var second = "";
		if(now.getSeconds() < 10) {
			second = "0"+now.getSeconds();
		} else {
			second = ""+now.getSeconds();
		}
		
		strNow += hour + ":" + minute + ":" + second;
		
		$("#clock").html("<span style='color:green; font-weight:bold;'>"+strNow+"</span>");
	
	}// end of function showNowTime() -----------------------------


	function loopshowNowTime() {
		showNowTime();
		
		var timejugi = 1000;   // 시간을 1초 마다 자동 갱신하려고.
		
		setTimeout(function() {
						loopshowNowTime();	
					//	showWeather();
					}, timejugi);
		
	}// end of loopshowNowTime() --------------------------
	
	
	// 날씨 정보 띄우기 단
	var apiURI = "http://api.openweathermap.org/data/2.5/weather?q="+city+"&appid="+"c2086d467918ca3a0300f821d4e8f86f";
	        $.ajax({
	            url: apiURI,
	            dataType: "json",
	            type: "GET",
	            async: "false",
	            success: function(resp) {
	                console.log(resp);
	                console.log("현재온도 : "+ (resp.main.temp- 273.15) );
	                console.log("현재습도 : "+ resp.main.humidity);
	                console.log("날씨 : "+ resp.weather[0].main );
	                console.log("상세날씨설명 : "+ resp.weather[0].description );
	                console.log("날씨 이미지 : "+ resp.weather[0].icon );
	                console.log("바람   : "+ resp.wind.speed );
	                console.log("나라   : "+ resp.sys.country );
	                console.log("도시이름  : "+ resp.name );
	                console.log("구름  : "+ (resp.clouds.all) +"%" );                 
	            }
	        });	
</script>

<div style="margin: 0 auto;" align="center">
	현재시각 :&nbsp; 
	<!-- <div id="sun" class="climacon climacon_sun" style="min-width: 10%; margin-top: 20px; padding-left: 10px; padding-right: 10px;">sun</div>
	<div id="sunFill" class="climacon climacon_sunFill" style="min-width: 10%; margin-top: 20px; padding-left: 10px; padding-right: 10px;">sunFill</div>
	<div id="moon" class="climacon climacon_moon" style="min-width: 10%; margin-top: 20px; padding-left: 10px; padding-right: 10px;">moon</div>
	<div id="moonFill" class="climacon climacon_moonFill" style="min-width: 10%; margin-top: 20px; padding-left: 10px; padding-right: 10px;">moonFill</div>
	<div id="sunsetAlt" class="climacon climacon_snowflake" style="min-width: 10%; margin-top: 20px; padding-left: 10px; padding-right: 10px;">sunsetAlt</div>
	<div id="snowflakeFill" class="climacon climacon_snowflakeFill" style="min-width: 90%; margin-top: 20px; padding-left: 10px; padding-right: 10px;">snowflakeFill</div>
	<div id="wind" class="climacon climacon_wind" style="min-width: 10%; margin-top: 20px; padding-left: 10px; padding-right: 10px;">sun</div> -->
	
	<div id="clock" style="display:inline;"></div>
	<div id="displayWeather" style="min-width: 90%; margin-top: 20px; padding-left: 10px; padding-right: 10px;"></div>
</div>

	
	
	
	
	
	