<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- BEGIN SLIDER -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date" />

<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />

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
                  <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                </div>
              </div>
              <h3><a href="<%=request.getContextPath() %>/viewAuction.action?actdnum=${auctionvo.actdnum}">${auctionvo.actname}</a></h3>
				<div class="pi-price">현재경매가 : ${auctionvo.startprice} 원</div>
				<div class="row"></div>
				<div class="pi-price">즉시구매가 : ${auctionvo.actd_price} 원</div>
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
      <div class="sidebar col-md-3 col-sm-4">
        <ul class="list-group margin-bottom-25 sidebar-menu">
          <li class="list-group-item clearfix"><a href="shop-product-list.html"><i class="fa fa-angle-right"></i> Ladies</a></li>
          <li class="list-group-item clearfix dropdown">
            <a href="shop-product-list.html">
              <i class="fa fa-angle-right"></i>
              Mens
              
            </a>
            <ul class="dropdown-menu">
              <li class="list-group-item dropdown clearfix">
                <a href="shop-product-list.html"><i class="fa fa-angle-right"></i> Shoes </a>
                  <ul class="dropdown-menu">
                    <li class="list-group-item dropdown clearfix">
                      <a href="shop-product-list.html"><i class="fa fa-angle-right"></i> Classic </a>
                      <ul class="dropdown-menu">
                        <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i> Classic 1</a></li>
                        <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i> Classic 2</a></li>
                      </ul>
                    </li>
                    <li class="list-group-item dropdown clearfix">
                      <a href="shop-product-list.html"><i class="fa fa-angle-right"></i> Sport  </a>
                      <ul class="dropdown-menu">
                        <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i> Sport 1</a></li>
                        <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i> Sport 2</a></li>
                      </ul>
                    </li>
                  </ul>
              </li>
              <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i> Trainers</a></li>
              <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i> Jeans</a></li>
              <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i> Chinos</a></li>
              <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i> T-Shirts</a></li>
            </ul>
          </li>
          <li class="list-group-item clearfix"><a href="shop-product-list.html"><i class="fa fa-angle-right"></i> Kids</a></li>
          <li class="list-group-item clearfix"><a href="shop-product-list.html"><i class="fa fa-angle-right"></i> Accessories</a></li>
          <li class="list-group-item clearfix"><a href="shop-product-list.html"><i class="fa fa-angle-right"></i> Sports</a></li>
          <li class="list-group-item clearfix"><a href="shop-product-list.html"><i class="fa fa-angle-right"></i> Brands</a></li>
          <li class="list-group-item clearfix"><a href="shop-product-list.html"><i class="fa fa-angle-right"></i> Electronics</a></li>
          <li class="list-group-item clearfix"><a href="shop-product-list.html"><i class="fa fa-angle-right"></i> Home & Garden</a></li>
          <li class="list-group-item clearfix"><a href="shop-product-list.html"><i class="fa fa-angle-right"></i> Custom Link</a></li>
        </ul>
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
                  <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
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
      <div class="animated fadeIn">
      <!-- start of weather widget -->
      <div class="row"> <!-- col-md-6 col-sm-6 col-xs-12 -->
	      <div class="col-md-6">
	        <div class="card">
	          <div class="card-header">
	            <h2>Daily active users <small>Sessions</small></h2>
	            <ul class="nav navbar-right panel_toolbox">
	              <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
	              </li>
	              <li class="dropdown">
	                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
	                <ul class="dropdown-menu" role="menu">
	                  <li><a href="#">Settings 1</a>
	                  </li>
	                  <li><a href="#">Settings 2</a>
	                  </li>
	                </ul>
	              </li>
	              <li><a class="close-link"><i class="fa fa-close"></i></a>
	              </li>
	            </ul>
	            <div class="clearfix"></div>
	          </div>
	          <div class="x_content">
	            <div class="row">
	              <div class="col-sm-12">
	                <div class="temperature"><b>Monday</b>, 07:30 AM
	                  <span>F</span>
	                  <span><b>C</b></span>
	                </div>
	              </div>
	            </div>
	            <div class="row">
	              <div class="col-sm-4">
	                <div class="weather-icon">
	                  <canvas height="84" width="84" id="partly-cloudy-day"></canvas>
	                </div>
	              </div>
	              <div class="col-sm-8">
	                <div class="weather-text">
	                  <h2>Texas <br><i>Partly Cloudy Day</i></h2>
	                </div>
	              </div>
	            </div>
	            <div class="col-sm-12">
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
      </div>
      <!-- END PROMO -->
    </div>        
    <!-- END TWO PRODUCTS & PROMO -->
  </div>
</div>