<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- BEGIN SLIDER -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />

<style type="text/css" >
svg, img, canvas {
  display: block;
}
</style>

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
              <h3 align="center"><a href="<%=request.getContextPath() %>/viewAuction.action?actdnum=${auctionvo.actdnum}">${auctionvo.actname}</a></h3>
				<div align="center" style="color:pink; font-size:14pt;">현재경매가 : ${auctionvo.startprice} 원</div>
				<div class="row"></div>
				<div align="center" class="">즉시구매가 : ${auctionvo.actd_price} 원</div>
				<div class="row"></div>
				<div align="center"class="">${auctionvo.actd_endday} 까지</div>
				<div class="row"></div>
				<div align="center">
				<a href="<%=request.getContextPath() %>/viewAuction.action?actdnum=${auctionvo.actdnum}" class="btn btn-default" style="width:100px">상세보기</a>
				</div>
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
    <div class="row margin-bottom-40">
      <!-- BEGIN SIDEBAR -->
     
     <br/>
      <div class="sidebar col-md-3 col-sm-4">
		<div> <span style="font-weight: bold; font-size: 13pt;">Super Auction 파트너스</span></div>
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
      
      
      <!-- 중간 까로세ㅇ에ㅔ에에에ㅔ에에에에에에루 -->
      <div class="col-md-9 col-sm-8">
        <h2>베스트 경매!</h2>
        <div class="owl-carousel owl-carousel3">
            <c:forEach var="auctionvo" items="${bestAuctionList}">
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
              <h3 align="center">
              	<a href="<%=request.getContextPath() %>/viewAuction.action?actdnum=${auctionvo.actdnum}">${auctionvo.actname}</a>
              	</h3>
				<div align="center" style="color:pink; font-size:14pt;">현재경매가 : ${auctionvo.startprice} 원</div>
				<div class="row"></div>
				<div align="center" class="">즉시구매가 : ${auctionvo.actd_price} 원</div>
				<div class="row"></div>
				<div align="center" class="">${auctionvo.actd_endday} 까지</div>
				<div class="row"></div>
				<div align="center">
				<a href="<%=request.getContextPath() %>/viewAuction.action?actdnum=${auctionvo.actdnum}" class="btn btn-default" style="width:100px">상세보기</a>
				</div>
				<c:if test="${auctionvo.actd_startday == today}">
              		<div class="sticker sticker-new"></div>
				</c:if>
            </div>
            </div>
            </c:forEach>
      	</div>
      </div>
      <!-- 중간 까로세ㅇ에ㅔ에에에ㅔ에에에에에에루 -->
    </div>
    <!-- END SIDEBAR & CONTENT -->

    <!-- BEGIN 안팔리는 까로세에에에ㅔ에에에레ㅔ레레레레ㅔ에레ㅔㅇ레에레ㅔㄹ -->
    <div class="row margin-bottom-35 ">
      <!-- BEGIN TWO PRODUCTS -->
      <div class="col-md-6 two-items-bottom-items">
        <h2>추천 경매품</h2>
        <div class="owl-carousel owl-carousel2">
            <c:forEach var="auctionvo" items="${worstAuctionList}">
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
              <h3 align="center"><a href="<%=request.getContextPath() %>/viewAuction.action?actdnum=${auctionvo.actdnum}">${auctionvo.actname}</a></h3>
				<div align="center" style="color:pink; font-size:14pt;">현재경매가 : ${auctionvo.startprice} 원</div>
				<div class="row"></div>
				<div align="center" class="">즉시구매가 : ${auctionvo.actd_price} 원</div>
				<div class="row"></div>
				<div align="center" class="">${auctionvo.actd_endday} 까지</div>
				<div class="row"></div>
				<div align="center">
				<a href="<%=request.getContextPath() %>/viewAuction.action?actdnum=${auctionvo.actdnum}" class="btn btn-default" style="width:100px">상세보기</a>
				</div>
				<c:if test="${auctionvo.actd_startday == today}">
              		<div class="sticker sticker-new"></div>
				</c:if>
            </div>
            </div>
            </c:forEach>
      	</div>
      </div>
      <!-- END TWO PRODUCTS -->
 <!-- <iframe src=http://www.nalsee.com/nalsee/banner2.html?id=dudrud126 
WIDTH=400 HEIGHT=65 frameborder=no scrolling=no></iframe>
    </div> -->
 
<!-- weather widget start --><div id="m-booked-weather-bl250-90195"> <div class="booked-wzs-250-175 weather-customize" style="background-color:#137AE9;width:380px;" id="width3"> <div class="booked-wzs-250-175_in"> <div class="booked-wzs-250-175-data"> <div class="booked-wzs-250-175-left-img wrz-01"> <a target="_blank" href="http://www.booked.net/"> <img src="//s.bookcdn.com/images/letter/logo.gif" alt="http://www.booked.net/" /> </a> </div> <div class="booked-wzs-250-175-right"> <div class="booked-wzs-day-deck"> <div class="booked-wzs-day-val"> <div class="booked-wzs-day-number"><span class="plus">+</span>33</div> <div class="booked-wzs-day-dergee"> <div class="booked-wzs-day-dergee-val">&deg;</div> <div class="booked-wzs-day-dergee-name">C</div> </div> </div> <div class="booked-wzs-day"> <div class="booked-wzs-day-d">H: <span class="plus">+</span>33&deg;</div> <div class="booked-wzs-day-n">L: <span class="plus">+</span>28&deg;</div> </div> </div> <div class="booked-wzs-250-175-info"> <div class="booked-wzs-250-175-city">서울특별시 </div> <div class="booked-wzs-250-175-date">월요일, 30 7월</div> <div class="booked-wzs-left"> <span class="booked-wzs-bottom-l">7일 예보 보기</span> </div> </div> </div> </div> <a target="_blank" href="http://booked.kr/weather/seoul-18406"> <table cellpadding="0" cellspacing="0" class="booked-wzs-table-250"> <tr> <td>화</td> <td>수</td> <td>목</td> <td>금</td> <td>토</td> <td>일</td> </tr> <tr> <td class="week-day-ico"><div class="wrz-sml wrzs-18"></div></td> <td class="week-day-ico"><div class="wrz-sml wrzs-18"></div></td> <td class="week-day-ico"><div class="wrz-sml wrzs-18"></div></td> <td class="week-day-ico"><div class="wrz-sml wrzs-18"></div></td> <td class="week-day-ico"><div class="wrz-sml wrzs-18"></div></td> <td class="week-day-ico"><div class="wrz-sml wrzs-01"></div></td> </tr> <tr> <td class="week-day-val"><span class="plus">+</span>29&deg;</td> <td class="week-day-val"><span class="plus">+</span>30&deg;</td> <td class="week-day-val"><span class="plus">+</span>32&deg;</td> <td class="week-day-val"><span class="plus">+</span>31&deg;</td> <td class="week-day-val"><span class="plus">+</span>31&deg;</td> <td class="week-day-val"><span class="plus">+</span>34&deg;</td> </tr> <tr> <td class="week-day-val"><span class="plus">+</span>24&deg;</td> <td class="week-day-val"><span class="plus">+</span>24&deg;</td> <td class="week-day-val"><span class="plus">+</span>23&deg;</td> <td class="week-day-val"><span class="plus">+</span>24&deg;</td> <td class="week-day-val"><span class="plus">+</span>23&deg;</td> <td class="week-day-val"><span class="plus">+</span>23&deg;</td> </tr> </table> </a> </div></div> </div><script type="text/javascript"> var css_file=document.createElement("link"); css_file.setAttribute("rel","stylesheet"); css_file.setAttribute("type","text/css"); css_file.setAttribute("href",'https://s.bookcdn.com/css/w/booked-wzs-widget-275.css?v=0.0.1'); document.getElementsByTagName("head")[0].appendChild(css_file); function setWidgetData(data) { if(typeof(data) != 'undefined' && data.results.length > 0) { for(var i = 0; i < data.results.length; ++i) { var objMainBlock = document.getElementById('m-booked-weather-bl250-90195'); if(objMainBlock !== null) { var copyBlock = document.getElementById('m-bookew-weather-copy-'+data.results[i].widget_type); objMainBlock.innerHTML = data.results[i].html_code; if(copyBlock !== null) objMainBlock.appendChild(copyBlock); } } } else { alert('data=undefined||data.results is empty'); } } </script> <script type="text/javascript" charset="UTF-8" src="https://widgets.booked.net/weather/info?action=get_weather_info&ver=6&cityID=18406&type=3&scode=124&ltid=3458&domid=593&anc_id=9134&cmetric=1&wlangID=24&color=137AE9&wwidth=380&header_color=ffffff&text_color=333333&link_color=08488D&border_form=1&footer_color=ffffff&footer_text_color=333333&transparent=0"></script><!-- weather widget end -->    
<!-- clock widget start -->
<!-- <script type="text/javascript" var css_file=document.createElement("link"); css_file.setAttribute("rel","stylesheet"); css_file.setAttribute("type","text/css"); css_file.setAttribute("href","//s.bookcdn.com//css/cl/bw-cl-150x100t.css"); document.getElementsByTagName("head")[0].appendChild(css_file); &lt;/script&gt; &lt;div id="tw_8_263014722"&gt;&lt;div style="width:150px; height:100px; margin: 0 auto;"&gt;&lt;a href="http://booked.kr/time/seoul-18406"&gt;서울특별시&lt;/a&gt;&lt;br/&gt;&lt;/div&gt;&lt;/div&gt; &lt;script type="text/javascript"&gt; function setWidgetData_263014722(data){ if(typeof(data) != 'undefined' &amp;&amp; data.results.length &gt; 0) { for(var i = 0; i &lt; data.results.length; ++i) { var objMainBlock = ''; var params = data.results[i]; objMainBlock = document.getElementById('tw_'+params.widget_type+'_'+params.widget_id); if(objMainBlock !== null) objMainBlock.innerHTML = params.html_code; } } } var clock_timer_263014722 = -1; &lt;/script&gt; &lt;script type="text/javascript" charset="UTF-8" src="https://widgets.booked.net/time/info?ver=2&amp;domid=593&amp;type=8&amp;id=263014722&amp;scode=124&amp;city_id=18406&amp;wlangid=24&amp;mode=1&amp;details=0&amp;background=rgba(0,0,0,0.6)&amp;color=ffffff&amp;add_background=ffffff&amp;add_color=ffffff&amp;head_color=ffffff&amp;border=0&amp;transparent=1"></script>
 --><!-- clock widget end -->
      
    <!-- END TWO PRODUCTS & PROMO -->
  </div>
</div>