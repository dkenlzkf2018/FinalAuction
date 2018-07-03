<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- ===== #38.  tiles 중 sideinfo 페이지 만들기 ===== --%>

<script type="text/javascript">
	
	var weatherTimejugi = 0;

	$(document).ready(function() {
		loopshowNowTime();
		// 시간이 매 30분이 되면 기상청 날씨정보를 자동 갱신해서 가져오려고 함.
		// (정시마다 변경되어지는 날씨정보는 정시에 보내주지 않고 대략 20~30분이 지난 다음에 보내주므로)
		var now = new Date();
		var minute = now.getMinutes();	// 현재 분.
		
		if(minute < 30) {
			weatherTimejugi = (30-minute)*60*1000;
		}
		else if(minute == 30) {
			weatherTimejugi = 1000;
		}
		else {	// 현재 시간의 분이 30분을 넘어섰을 경우
			weatherTimejugi = ((60-minute)+30)*60*1000;
		}
	//	showWeather();	// 기상청 날씨정보 XML데이터 호출하기
		loopshowWeather();	// 기상청 날씨정보 XML데이터 호출하기
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

	function showWeather() {
		$.ajax({
			url: "<%=request.getContextPath()%>/weatherXML.action",
		//	url: "http://www.kma.go.kr/XML/weather/sfc_web_map.xml",
			type: "GET",
			dataType: "XML",
			success: function(xml) {
				var rootElement = $(xml).find(":root");
			//	console.log($(rootElement).prop("tagName")); ==> current
				var weather = $(rootElement).find("weather");
			//	console.log($(weather).attr("year")+"년 "+$(weather).attr("month")+"월 "+$(weather).attr("day")+"일 "+$(weather).attr("hour")+"시"); ==> 2018년 06월 28일 16시
				var updateTime = $(weather).attr("year")+"년 "+$(weather).attr("month")+"월 "+$(weather).attr("day")+"일 "+$(weather).attr("hour")+"시";
				
				var localArr = $(rootElement).find("local");
			//	console.log(localArr.length); ==> 95
				var html = "업데이트 시각 : <span style='font-weight: bold;'>"+updateTime+"</span>&nbsp;";
				html += "<span style='color: blue; cursor: pointer;' onClick='javascript:showWeather();'>업데이트</span><br/>";
				html += "<table class='table table-hover' align='center'>";
				html += "<tr>";
				html += "<th>지역</th>";
				html += "<th>날씨</th>";
				html += "<th>기온</th>";
				html += "</tr>";
				
				for(var i=0; i<localArr.length; i++) {
					var local = $(localArr).eq(i);
					/* 
						.eq(index)는 선택된 요소들을 인덱스 번호로 찾을 수 있는 선택자이다.
						마치 배열의 인덱스(index)로 값(value)을 찾는것과 같은 효과를 낸다. 
					*/
				//	console.log($(local).text() + ", desc:" + $(local).attr("desc") + ", ta:" + $(local).attr("ta"));
					/* 
						속초, desc:-, ta:27.3
						북춘천, desc:천둥번개, ta:20.6
						철원, desc:-, ta:19.8
						동두천, desc:-, ta:18.1
						파주, desc:-, ta:17.0
						대관령, desc:-, ta:21.6
						춘천, desc:-, ta:22.4
					*/
					html += "<tr>";
					html += "<td>"+$(local).text()+"</td>";
					html += "<td>"+$(local).attr("desc")+"</td>";
					html += "<td>"+$(local).attr("ta")+"</td>";
					html += "</tr>";
				}
				
				html += "</table>";
				
				$("#displayWeather").html(html);
			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		});
	}
	
	function loopshowWeather() {
		showWeather();
		
		setTimeout(function() {
			showWeather();
		}, weatherTimejugi);
		
		setTimeout(function() {
			loopshowWeather();
		}, weatherTimejugi+(60*60*1000));
	}
	
</script>


<div style="margin: 0 auto;" align="center">
	현재시각 :&nbsp; 
	<div id="clock" style="display:inline;"></div>
	<div id="displayWeather" style="min-width: 90%; margin-top: 20px; padding-left: 10px; padding-right: 10px;"></div>
</div>

	
	
	
	
	
	