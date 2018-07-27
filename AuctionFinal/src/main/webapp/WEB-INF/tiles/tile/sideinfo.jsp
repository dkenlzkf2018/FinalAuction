<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- ===== #38.  tiles 중 sideinfo 페이지 만들기 ===== --%>

<script type="text/javascript">

<i id="icon"></i>
<span id="cloud" class="font-bold"></span>

	function showWeather() {

	$('#icon').html(response.weather[0].icon);
	$('#cloud').text(response.clouds.all);
		
	// 날씨 정보 띄우기 단
		var apiURI = "http://api.openweathermap.org/data/2.5/weather?q="+city+"&appid="+"c2086d467918ca3a0300f821d4e8f86f";
        $.ajax({
            url: apiURI,
            dataType: "json",
            type: "GET",
            async: "false",
            success: function(resp) {
                console.log(resp);
                console.log("도시ID : "+ resp.id );
                console.log("도시이름  : "+ resp.name );
                console.log("현재온도 : "+ (resp.main.temp- 273.15) );
                console.log("현재습도 : "+ resp.main.humidity);
                console.log("날씨 : "+ resp.weather[0].main );
                console.log("날씨 이미지 : "+ resp.weather[0].icon );
            }
        });
        
        // svg 띄우기
        function drawInlineSVG(svg, img, canvas) {

        	var svg = document.querySelector('svg');
        	var img = document.querySelector('img');
        	var canvas = document.querySelector('canvas');

        	// get svg data
        	var xml = new XMLSerializer().serializeToString(svg);

        	// make it base64
        	var svg64 = btoa(xml);
        	var b64Start = 'data:image/svg+xml;base64,';

        	// prepend a "header"
        	var image64 = b64Start + svg64;

        	// set it as the source of the img element
        	img.src = image64;

        	// draw the image onto the canvas
        	canvas.getContext('2d').drawImage(img, 0, 0);
        	
    	}
        
        
    	/* function loopshowWeather() {
    		
    		showWeather();
    		
    		setTimeOut(function() {
    			loopShowWeather();
    		}, weatherTimejugi);
    		
    		setTimeOut(function() {
    			loopShowWeather();
    		}, (60*60*1000) ); // 60*60*1000 은 1시간
    	} */

    	
    	
/*     	function drawInlineSVG(ctx, rawSVG, callback) {

    	    var svg = new Blob([rawSVG], {type:"/resources/assets/pages/img/svg; charset=utf-8"}),
    	        domURL = self.URL || self.webkitURL || self,
    	        url = domURL.createObjectURL(svg),
    	        img = new Image;

    	    img.onload = function () {
    	        ctx.drawImage(this, 0, 0);     
    	        domURL.revokeObjectURL(url);
    	        callback(this);
    	    };

    	    img.src = url;0
    	}

    	// usage:
    	drawInlineSVG(ctxt, svgText, function() {
    	    console.log(canvas.toDataURL());  // -> PNG data-uri
    	}); */

<%-- 	var weatherTimejugi = 0;

	$(document).ready(function() {
		loopshowNowTime();
		
		// 시간이 30분 00초가 되면 기상청 날씨정보를 업데이트 한다,.
		// (정시마다 변경되는 정보는 정시에 오지 않고, 20~30 분 정도 후에 전송되기 때문이다.
		var now = new Date();
		var minute = now.getMinutes();
		
		if(minute < 30) {
			weatherTimejugi = (30-minute)*60*1000; // 매번 12분뒤에 함
		}
		else if (minute == 30) {
			weatherTimejugi  = 1000;
		}
		else { // 30분 이후
			weatherTimejugi = (60-minutes+30)*60*1000;
		}
		
	//	showWeather();	// 기상청 날씨정보 공공API XML 데이터호출하기
		loopshowWeather(); // 기상청 날씨정보 공공API XML 데이터호출하기
	
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
		//	url: "http://www.kma.go.kr/XML/weather/sfc_web_map.xml", // 안됨. 데이터를 불러올 수 없다.
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
				var html = "업데이트 시각 : <span style='font-weight: bold;'>"+updateTime+"</span><br/>";
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
				//	console.log($(local).text() + ", desc:" + $(local).attr("desc") + ", ta : " + $(local).attr("ta"));
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
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error : "+ error);
			}
		});
	}
	
	
	function loopshowWeather() {
		
		showWeather();
		
		setTimeOut(function() {
			loopShowWeather();
		}, weatherTimejugi);
		
		setTimeOut(function() {
			loopShowWeather();
		}, (60*60*1000) ); // 60*60*1000 은 1시간
	} --%>	
	
</script>


<div style="margin: 0 auto;" align="center">
<p>var imgURL = "http://openweathermap.org/img/w/" + resp.weather[0].icon + ".png";
							 $("html컴포넌트").attr("src", imgURL);
							</p>

<!-- 	현재시각 :&nbsp; 
	<div id="clock" style="display:inline;"></div>
	<div id="displayWeather" style="min-width: 90%; margin-top: 10px;"></div> -->
</div>