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
		<div>
		
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
      <!-- 중간 까로세ㅇ에ㅔ에에에ㅔ에에에에에에루 -->
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
      <div class="col-md-6 shop-index-carousel">
        <div class="content-slider">
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
        </div>
      </div>
      <!-- END PROMO -->
    </div>        
    <!-- END TWO PRODUCTS & PROMO -->
  </div>
</div>