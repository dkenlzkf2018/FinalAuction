<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- BEGIN SLIDER -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date" />

<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />

<script type="text/javascript">

	var weatherTimejugi = 0;

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

		// 날씨 정보 띄우기 단
/* 		var apiURI = "http://api.openweathermap.org/data/2.5/weather?id="+{citynum};
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
	        });	*/	
		
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
		}, (60*60*1000) ); // 60*60*1000 은 1시간 / 이게 아닌가봐 <- weatherTimejugi + (60*60*1000) );
	}	
	
</script>

<div class="page-slider margin-bottom-35">
    <div id="carousel-example-generic" class="carousel slide carousel-slider">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
            <li data-target="#carousel-example-generic" data-slide-to="3"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">
            <!-- First slide -->
            <div class="item carousel-item-four active">
                <div class="container">
                    <div class="carousel-position-four text-center">
                        <h2 class="margin-bottom-20 animate-delay carousel-title-v3 border-bottom-title text-uppercase" data-animation="animated fadeInDown">
							남성의류 <br/><span class="color-red-v2">SUPER SALE</span>
                        </h2>
                        <p class="carousel-subtitle-v2" data-animation="animated fadeInUp">낙찰가 10% 지원</p>
                    </div>
                </div>
            </div>
            
            <!-- Second slide -->
            <div class="item carousel-item-five">
                <div class="container">
                    <div class="carousel-position-four text-center">
                        <h2 class="animate-delay carousel-title-v4" style="font-weight: bold;" data-animation="animated fadeInDown">
							태블릿 PC
                        </h2>
                        <p class="carousel-subtitle-v2" data-animation="animated fadeInDown">
							지금 바로 입찰하세요
                        </p>
                        <a class="carousel-btn" href="#" data-animation="animated fadeInUp">경매 이동하기</a>
                    </div>
                    
                </div>
            </div>

            <!-- Third slide -->
            <div class="item carousel-item-six">
                <div class="container">
                    <div class="carousel-position-four text-center">
                        <span class="carousel-subtitle-v3 margin-bottom-15" data-animation="animated fadeInDown">
							여름 휴가철 필수아이템
                        </span>
                        <p class="carousel-title-v3" data-animation="animated fadeInDown">
							까만안경
                        </p>
                        <p class="carousel-subtitle-v3" data-animation="animated fadeInDown">
							지금 즉시 입찰하세요
                        </p>
                    </div>
                </div>
            </div>

            <!-- Fourth slide -->
            <div class="item carousel-item-seven">
               <div class="center-block">
                    <div class="center-block-wrap">
                        <div class="center-block-body">
                            <h2 class="carousel-title-v1 margin-bottom-20" data-animation="animated fadeInDown">
                               <span class="carousel-subtitle-v3" data-animation="animated fadeInDown">
                               	보조배터리의 혁명!!
                               </span>
                               <p class="carousel-title-v3" data-animation="animated fadeInDown"> 
                               	샤오미 보조배터리
                               </p>
                               <p class="carousel-subtitle-v3" data-animation="animated fadeInDown"> 
                               	지금 즉시 입찰하세요
                               </p>
                            </h2>
                            <a class="carousel-btn" href="#" data-animation="animated fadeInUp">But It Now!</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Controls -->
        <a class="left carousel-control carousel-control-shop" href="#carousel-example-generic" role="button" data-slide="prev">
            <i class="fa fa-angle-left" aria-hidden="true"></i>
        </a>
        <a class="right carousel-control carousel-control-shop" href="#carousel-example-generic" role="button" data-slide="next">
            <i class="fa fa-angle-right" aria-hidden="true"></i>
        </a>
    </div>
</div>
<!-- END SLIDER -->

<div class="main">
  <div class="container">
    <!-- BEGIN SALE PRODUCT & NEW ARRIVALS -->
    <div class="row margin-bottom-40">
      <!-- BEGIN SALE PRODUCT -->
      <div class="col-md-12 sale-product">
        <h2>새로운 경매!</h2>
        <div class="owl-carousel owl-carousel5">
            <c:forEach var="auctionvo" items="${newAuctionList}">
            <div>
            <div class="product-item">
              <div class="pi-img-wrapper" align="center">
				<img src="<%=request.getContextPath() %>/resources/actimages/${auctionvo.actimage}" 
                	 class="img-responsive"
                	 alt="${auctionvo.orgFilename}"
                	 style="width:auto; height:100px;">
                <div>
                  <a href="<%=request.getContextPath() %>/resources/actimages/${auctionvo.actimage}" class="btn btn-default fancybox-button">Zoom</a>
                  <a href="#product-pop-up${auctionvo.actdnum}" class="btn btn-default fancybox-fast-view">View</a>
                </div>
              </div>
              <h3><a href="<%=request.getContextPath() %>/viewAuction.action?actdnum=${auctionvo.actdnum}">${auctionvo.actname}</a></h3>
				<div class="pi-price">현재경매가 : ${auctionvo.startprice} 원</div>
				<div class="row"></div>
				<div align="right" class="">즉시구매가 : ${auctionvo.actd_price} 원</div>
				<div class="row"></div>
				<div class="">${auctionvo.actd_endday} 까지</div>
				<div class="row"></div>
				<a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
				<c:if test="${auctionvo.actd_startday == today}">
              		<div class="sticker sticker-new"></div>
				</c:if>
            </div>
            </div>
            </c:forEach>
      	</div>
      </div>
      <!-- END SALE PRODUCT -->
    </div>
    <!-- END SALE PRODUCT & NEW ARRIVALS -->

    <!-- BEGIN SIDEBAR & CONTENT -->
    <div class="row margin-bottom-40 ">
      <!-- BEGIN SIDEBAR -->
     <div> <span style="font-weight: bold; font-size: 13pt;">Super Auction 파트너스</span></div>
     <br/>
      <div class="sidebar col-md-3 col-sm-4">
          <a href="http://corners.auction.co.kr/corner/UsedMarket.aspx"> <img src="<%=request.getContextPath() %>/resources/images/logo_umarket.png"></a>
          <br/><br/>
          <a href="http://ebay.auction.co.kr/"><img src="<%=request.getContextPath() %>/resources/images/m_logo_auct_ebsh.png"></a>
          <br/><br/>
          <a href="http://www.bidbuy.co.kr/"><img src="<%=request.getContextPath() %>/resources/images/blogo.png"></a>  
          <br/><br/>
          <a href="https://auctions.yahoo.co.jp/"><img src="<%=request.getContextPath() %>/resources/images/logo_yahuoku_01.png"></a>
          <!-- <i class="fa fa-angle-right"></i> -->
      </div>
      <!-- END SIDEBAR -->
      <!-- BEGIN CONTENT -->
      <div class="col-md-9 col-sm-8">
        <h2>Three items</h2>
        <div class="owl-carousel owl-carousel3">
          <div>
            <div class="product-item">
              <div class="pi-img-wrapper">
                <img src="<%=request.getContextPath() %>/resources/assets/pages/img/products/k1.jpg" class="img-responsive" alt="Berry Lace Dress">
                <div>
                  <a href="<%=request.getContextPath() %>/resources/assets/pages/img/products/k1.jpg" class="btn btn-default fancybox-button">Zoom</a>
                  <a href="#product-pop-up${auctionvo.actdnum}" class="btn btn-default fancybox-fast-view">View</a>
                </div>
              </div>
              <h3><a href="shop-item.html">Berry Lace Dress</a></h3>
              <div class="pi-price">$29.00</div>
              <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
              <div class="sticker sticker-new"></div>
            </div>
          </div>
          <div>
            <div class="product-item">
              <div class="pi-img-wrapper">
                <img src="<%=request.getContextPath() %>/resources/assets/pages/img/products/k2.jpg" class="img-responsive" alt="Berry Lace Dress">
                <div>
                  <a href="<%=request.getContextPath() %>/resources/assets/pages/img/products/k2.jpg" class="btn btn-default fancybox-button">Zoom</a>
                  <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                </div>
              </div>
              <h3><a href="shop-item.html">Berry Lace Dress2</a></h3>
              <div class="pi-price">$29.00</div>
              <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
            </div>
          </div>
          <div>
            <div class="product-item">
              <div class="pi-img-wrapper">
                <img src="<%=request.getContextPath() %>/resources/assets/pages/img/products/k3.jpg" class="img-responsive" alt="Berry Lace Dress">
                <div>
                  <a href="<%=request.getContextPath() %>/resources/assets/pages/img/products/k3.jpg" class="btn btn-default fancybox-button">Zoom</a>
                  <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                </div>
              </div>
              <h3><a href="shop-item.html">Berry Lace Dress3</a></h3>
              <div class="pi-price">$29.00</div>
              <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
            </div>
          </div>
          <div>
            <div class="product-item">
              <div class="pi-img-wrapper">
                <img src="<%=request.getContextPath() %>/resources/assets/pages/img/products/k4.jpg" class="img-responsive" alt="Berry Lace Dress">
                <div>
                  <a href="<%=request.getContextPath() %>/resources/assets/pages/img/products/k4.jpg" class="btn btn-default fancybox-button">Zoom</a>
                  <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                </div>
              </div>
              <h3><a href="shop-item.html">Berry Lace Dress4</a></h3>
              <div class="pi-price">$29.00</div>
              <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
              <div class="sticker sticker-sale"></div>
            </div>
          </div>
          <div>
            <div class="product-item">
              <div class="pi-img-wrapper">
                <img src="<%=request.getContextPath() %>/resources/assets/pages/img/products/k1.jpg" class="img-responsive" alt="Berry Lace Dress">
                <div>
                  <a href="<%=request.getContextPath() %>/resources/assets/pages/img/products/k1.jpg" class="btn btn-default fancybox-button">Zoom</a>
                  <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                </div>
              </div>
              <h3><a href="shop-item.html">Berry Lace Dress5</a></h3>
              <div class="pi-price">$29.00</div>
              <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
            </div>
          </div>
          <div>
            <div class="product-item">
              <div class="pi-img-wrapper">
                <img src="<%=request.getContextPath() %>/resources/assets/pages/img/products/k2.jpg" class="img-responsive" alt="Berry Lace Dress">
                <div>
                  <a href="<%=request.getContextPath() %>/resources/assets/pages/img/products/k2.jpg" class="btn btn-default fancybox-button">Zoom</a>
                  <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                </div>
              </div>
              <h3><a href="shop-item.html">Berry Lace Dress6</a></h3>
              <div class="pi-price">$29.00</div>
              <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
            </div>
          </div>
        </div>
      </div>
      <!-- END CONTENT -->
    </div>
    <!-- END SIDEBAR & CONTENT -->

    <!-- BEGIN TWO PRODUCTS & PROMO -->
    <div class="row margin-bottom-35 ">
      <!-- BEGIN TWO PRODUCTS -->
      <div class="col-md-6 two-items-bottom-items">
        <h2>Two items</h2>
        <div class="owl-carousel owl-carousel2">
          <div>
            <div class="product-item">
              <div class="pi-img-wrapper">
                <img src="<%=request.getContextPath() %>/resources/assets/pages/img/products/k4.jpg" class="img-responsive" alt="Berry Lace Dress">
                <div>
                  <a href="<%=request.getContextPath() %>/resources/assets/pages/img/products/k4.jpg" class="btn btn-default fancybox-button">Zoom</a>
                  <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                </div>
              </div>
              <h3><a href="shop-item.html">Berry Lace Dress</a></h3>
              <div class="pi-price">$29.00</div>
              <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
            </div>
          </div>
          <div>
            <div class="product-item">
              <div class="pi-img-wrapper">
                <img src="<%=request.getContextPath() %>/resources/assets/pages/img/products/k2.jpg" class="img-responsive" alt="Berry Lace Dress">
                <div>
                  <a href="<%=request.getContextPath() %>/resources/assets/pages/img/products/k2.jpg" class="btn btn-default fancybox-button">Zoom</a>
                  <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                </div>
              </div>
              <h3><a href="shop-item.html">Berry Lace Dress</a></h3>
              <div class="pi-price">$29.00</div>
              <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
            </div>
          </div>
          <div>
            <div class="product-item">
              <div class="pi-img-wrapper">
                <img src="<%=request.getContextPath() %>/resources/assets/pages/img/products/k3.jpg" class="img-responsive" alt="Berry Lace Dress">
                <div>
                  <a href="<%=request.getContextPath() %>/resources/assets/pages/img/products/k3.jpg" class="btn btn-default fancybox-button">Zoom</a>
                  <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                </div>
              </div>
              <h3><a href="shop-item.html">Berry Lace Dress</a></h3>
              <div class="pi-price">$29.00</div>
              <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
            </div>
          </div>
          <div>
            <div class="product-item">
              <div class="pi-img-wrapper">
                <img src="<%=request.getContextPath() %>/resources/assets/pages/img/products/k1.jpg" class="img-responsive" alt="Berry Lace Dress">
                <div>
                  <a href="<%=request.getContextPath() %>/resources/assets/pages/img/products/k1.jpg" class="btn btn-default fancybox-button">Zoom</a>
                  <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                </div>
              </div>
              <h3><a href="shop-item.html">Berry Lace Dress</a></h3>
              <div class="pi-price">$29.00</div>
              <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
            </div>
          </div>
          <div>
            <div class="product-item">
              <div class="pi-img-wrapper">
                <img src="<%=request.getContextPath() %>/resources/assets/pages/img/products/k4.jpg" class="img-responsive" alt="Berry Lace Dress">
                <div>
                  <a href="<%=request.getContextPath() %>/resources/assets/pages/img/products/k4.jpg" class="btn btn-default fancybox-button">Zoom</a>
                  <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                </div>
              </div>
              <h3><a href="shop-item.html">Berry Lace Dress</a></h3>
              <div class="pi-price">$29.00</div>
              <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
            </div>
          </div>
          <div>
            <div class="product-item">
              <div class="pi-img-wrapper">
                <img src="<%=request.getContextPath() %>/resources/assets/pages/img/products/k3.jpg" class="img-responsive" alt="Berry Lace Dress">
                <div>
                  <a href="<%=request.getContextPath() %>/resources/assets/pages/img/products/k3.jpg" class="btn btn-default fancybox-button">Zoom</a>
                  <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                </div>
              </div>
              <h3><a href="shop-item.html">Berry Lace Dress</a></h3>
              <div class="pi-price">$29.00</div>
              <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
            </div>
          </div>
        </div>
      </div>
      <!-- END TWO PRODUCTS -->
      <!-- BEGIN PROMO -->
<div style="margin: 0 auto;" align="center">
	현재시각 :&nbsp; 
	<div id="clock" style="display:inline;"></div>
	<div id="displayWeather" style="min-width: 90%; margin-top: 10px;"></div>
</div>
	      <!-- start of weather widget -->
	       <!-- col-md-6 col-sm-6 col-xs-12 -->
 		      <div class="product-item col-md-6 col-sm-6 col-xs-12">
		        <div class="card">
		          <div class="card-header">
		            <h2>Daily active Weather <small>Sessions</small></h2>
		            <div class="clearfix"></div>
		          </div>
		          <div class="x_content">
		            <div class="row">
		              <div class="col-sm-6">
		                <div class="temperature"><b>Monday</b>, 07:30 AM
		                  <span>F</span>
		                  <span><b>C</b></span>
		                </div>
		              </div>
		            </div>
		            <div class="row">
		              <div class="col-sm-4">
		                <div class="weather-icon">
		                  <canvas height="84" width="84" id=""></canvas>
		                </div>
		              </div>
		              <div class="col-sm-8">
		                <div class="weather-text">
		                  <h2>Texas <br><i>Partly Cloudy Day</i></h2>
		                </div>
		              </div>
		            </div>
		            <div class="col-sm-8">
		              <div class="weather-text pull-right">
		                <h3 class="degrees">23</h3>
		              </div>
		            </div>
		
		            <div class="clearfix"></div>
		
		            <div class="row weather-days">
		              <div class="col-sm-2">
		                <div class="daily-weather">	
		                  <h2 class="day">Mon</h2>
		                  <h3 class="degrees">25</h3>
		                  <canvas id="clear-day" width="32" height="32"></canvas>
		                  <h5>15 <i>km/h</i></h5>
		                </div>
		              </div>
		              <div class="col-sm-2">
		                <div class="daily-weather">
		                  <h2 class="day">Tue</h2>
		                  <h3 class="degrees">25</h3>
		                  <canvas height="32" width="32" id="rain"></canvas>
		                  <h5>12 <i>km/h</i></h5>
		                </div>
		              </div>
		              <div class="col-sm-2">
		                <div class="daily-weather">
		                  <h2 class="day">Wed</h2>
		                  <h3 class="degrees">27</h3>
		                  <canvas height="32" width="32" id="snow"></canvas>
		                  <h5>14 <i>km/h</i></h5>
		                </div>
		              </div>
		              <div class="col-sm-2">
		                <div class="daily-weather">
		                  <h2 class="day">Thu</h2>
		                  <h3 class="degrees">28</h3>
		                  <canvas height="32" width="32" id="sleet"></canvas>
		                  <h5>15 <i>km/h</i></h5>
		                </div>
		              </div>
		              <div class="col-sm-2">
		                <div class="daily-weather">
		                  <h2 class="day">Fri</h2>
		                  <h3 class="degrees">28</h3>
		                  <canvas height="32" width="32" id="wind"></canvas>
		                  <h5>11 <i>km/h</i></h5>
		                </div>
		              </div>
		              <div class="col-sm-2">
		                <div class="daily-weather">
		                  <h2 class="day">Sat</h2>
		                  <h3 class="degrees">26</h3>
		                  <canvas height="32" width="32" id="cloudy"></canvas>
		                  <h5>10 <i>km/h</i></h5>
		                </div>
		              </div>
		              <div class="clearfix"></div>
		            </div>
		          </div>
		        </div>
			</div>
      <!-- end of weather widget -->      	
<%-- <div class="content-slider">
          <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
              <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
              <li data-target="#myCarousel" data-slide-to="1"></li>
              <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
              <div class="item active">
                <img src="<%=request.getContextPath() %>/resources/assets/pages/img/index-sliders/slide1.jpg" class="img-responsive" alt="Berry Lace Dress">
              </div>
              <div class="item">
                <img src="<%=request.getContextPath() %>/resources/assets/pages/img/index-sliders/slide2.jpg" class="img-responsive" alt="Berry Lace Dress">
              </div>
              <div class="item">
                <img src="<%=request.getContextPath() %>/resources/assets/pages/img/index-sliders/slide3.jpg" class="img-responsive" alt="Berry Lace Dress">
              </div>
            </div>
          </div>
        </div> --%> 
      
      <!-- END PROMO -->
    </div>        
    <!-- END TWO PRODUCTS & PROMO -->
  </div>
</div>