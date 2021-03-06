<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- ===== #38.  tiles 중 sideinfo 페이지 만들기 ===== --%>

<script type="text/javascript">

	var weatheRound = 0;

	$(document).ready(function() {
		loopshowNowTime();
		
		// 시간이 30분 00초가 되면 기상청 날씨정보를 업데이트 한다,.
		// (정시마다 변경되는 정보는 정시에 오지 않고, 20~30 분 정도 후에 전송되기 때문이다.)
		var now = new Date();
		var minutes = now.getMinutes();
		
		if(minutes < 30) {
			weatheRound = (30-minutes)*60*1000;
		}
		else if (minutes == 30) {
			weatheRound = 1000;
		}
		else { // 30분 이후
			weatheRound = (60-minutes+30)*60*1000;
		}
		
		loopshowWeather(); // 기상청 날씨정보 공공 API XML 데이터 호출하기
		
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
					}, timejugi);
		
	}// end of loopshowNowTime() --------------------------

	function showWeather() {
		
		$.ajax({
			url:"<%= request.getContextPath()%>/weatherXML.action",
		//	url:"http://www.kma.go.kr/XML/weather/sfc_web_map.xml", // 안됨. 데이터를 불러올 수 없다.
			type: "GET",
			dataType:"XML",
			success: function(xml){
				var rootElement = $(xml).find(":root");
				// console.log($(rootElement).prop("tagName")); //
				var weather = $(rootElement).find("weather");
				// console.log($(weather).attr("year") +"년"+$(weather).attr("month") +"월" +$(weather).attr("day") +"일" + $(weather).attr("hour") +"시");
				var updateTime = $(weather).attr("year") +"년"+$(weather).attr("month") +"월" +$(weather).attr("day") +"일" + $(weather).attr("hour") +"시";
				
				var localArr = $(rootElement).find("local");
				// console.log(localArr.length); // 95개
				
				var html = "업데이트 : <span style='font-weight:bold;'>"+updateTime+"</span><br/>";
					html +="<table class='table table-hover' align='center'>";
					html +="<tr>";
					html +="<th>지역</th>";
					html +="<th>날씨</th>";
					html +="<th>기온</th>";
					html +="</tr>";
				
				for (var i=0; i<localArr.length; i++) {
					var local = $(localArr).eq(i);
					/*
						.eq(index) 는 선택된 요소들을 인덱스 번호로 찾을 수 있는 선택자다.
						마치 배열의 인덱스(index)로 값(value)을 찾는 것과 같은 효과를 낸다.
					*/
					// console.log( $(local).text() +" desc : " + $(local).attr("desc") + " ta : " + $(local).attr("ta") );
					
					html += "<tr>";
					html += "<td>"+$(local).text()+"</td>";
					html += "<td>"+$(local).attr("desc")+"</td>";
					html += "<td>"+$(local).attr("ta")+"</td>";
					html += "</tr>";
					
				}
				html += "</table>";
				
				$("#weather").html(html);
			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		});
		
	}// showWeather() end
	
	function loopshowWeather() {
		
		showWeather();
		
		setTimeout(function() {
						loopshowNowTime();	
					}, weatheRound);
		
		setTimeout(function() {
						loopshowNowTime();	
					}, (60*60*1000) );
	} // loopshowWeather() end
	
</script>


<div style="margin: 0 auto;" align="center">
	현재시각 :&nbsp; 
	<div id="clock" style="display:inline;"></div>
	<div id="weather" style="min-width: 90%; margin-top:10px; " ></div>
</div>

	
	
	
	
	
	