<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- Page level plugin styles START -->
<link href="<%=request.getContextPath() %>/resources/assets/plugins/fancybox/source/jquery.fancybox.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/resources/assets/plugins/owl.carousel/assets/owl.carousel.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/resources/assets/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css">
<link href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" rel="stylesheet" type="text/css"><!-- for slider-range -->
<link href="<%=request.getContextPath() %>/resources/assets/plugins/rateit/src/rateit.css" rel="stylesheet" type="text/css">
<!-- Page level plugin styles END -->

<script type="text/javascript">
	
	var strNow = "";
	
	jQuery(document).ready(function () {
		
		loopshowNowTime();
		
	});
	
	// 남은 일자 계산
	function showNowTime() {
		//경매종료일
		var endday = new Date("${acvo.actd_endday}");
		// 현재일(시간)
		var nowday = new Date();
		// 경매종료까지 남은 일수(시간)
		var remainday = new Date(endday - nowday);
				
		// 경매 남은시간 또는 경매종료를 출력해주는 문자열
		strNow = remainday.getDate() + "일 ";
				
		var hour = "";
		hour = remainday.getHours();
		
		var minute = "";
		if(remainday.getMinutes() < 10) {
			minute = "0"+remainday.getMinutes();
		} else {
			minute = ""+remainday.getMinutes();
		}
		
		var second = "";
		if(remainday.getSeconds() < 10) {
			second = "0"+remainday.getSeconds();
		} else {
			second = ""+remainday.getSeconds();
		}
		if (nowday < endday) {
			strNow += hour + "시간 " + minute + "분 " + second + "초";
		}
		else if (nowday == endday){
			var frm = document.tenderFrm;
			frm.method = "POST";
			frm.action = "inputAward.action";
			frm.submit();
		}
		else {
			strNow = "경매종료";
		}
		console.log(strNow);
		$("#clock").html("<span>"+strNow+"</span>");
	
	}// end of function showNowTime() -----------------------------
	
	// 남은 일자 1초마다 -시키기
	function loopshowNowTime() {
		showNowTime();
		
		var timejugi = 1000;   // 시간을 1초 마다 자동 갱신하려고.
		
		setTimeout(function() {
						loopshowNowTime();	
					}, timejugi);
		
	}// end of loopshowNowTime() --------------------------

	// 구매 후기(구매 게시판 후기)
	function reviewRegist() {
		var frm = document.reviewFrm;
		
		frm.method = "get";
		frm.action = "reviewRegist.action";
		frm.submit();
	}
	
	// 입찰하기 버튼
	function goTender() {
		if (strNow == "경매종료") {
			alert("경매기간이 지난 상품입니다.");
			return false;
		}
		else {
			var frm = document.tenderFrm;
			var url = "<%=request.getContextPath()%>/tender.action";
	    	window.open("", "tender",
	    			   "left=569px, top=885px, width=569px, height=885px status=1");
			frm.method = "POST";
			frm.action = url;
			frm.target = "tender";
			frm.submit();
		}
	}
	
	// 구매하기 버튼
	function goPay() {
		var fk_usernum = "${acvo.fk_usernum}";
		var usernum = "${sessionScope.loginuser.usernum}";
		var nowprice = "${nowprice}";
		var endprice = "${acvo.actd_price}";
		console.log(fk_usernum+" "+usernum+" "+nowprice+" "+endprice);
		if (strNow != "경매종료" && fk_usernum != usernum) {
			if(confirm("상품즉시구매!! 결제창으로 이동하시겠습니까?")) {
				// endprice와 usernum을 넘긴다.
				location.href="";
			}
			else {
				return false;
			}
		}
	}
</script>

<div class="main">
  <div class="container">
    <ul class="breadcrumb">
        <li><a href="index.action">Home</a></li>
        <li>${cvo.cname}</li>
        <li><a href="">${cvo.cdname}</a></li>
        <li class="active">${acvo.actname}</li>
    </ul>
    <!-- BEGIN SIDEBAR & CONTENT -->
    <div class="row margin-bottom-40">
      <!-- BEGIN SIDEBAR -->
      <div class="sidebar col-md-3 col-sm-5">
        <ul class="list-group margin-bottom-25 sidebar-menu">
          <li class="list-group-item clearfix"><a href="shop-product-list.html"><i class="fa fa-angle-right"></i> Ladies</a></li>
          <li class="list-group-item clearfix dropdown active">
            <a href="shop-product-list.html" class="collapsed">
              <i class="fa fa-angle-right"></i>
              Mens
              
            </a>
            <ul class="dropdown-menu" style="display:block;">
              <li class="list-group-item dropdown clearfix active">
                <a href="shop-product-list.html" class="collapsed"><i class="fa fa-angle-right"></i> Shoes </a>
                  <ul class="dropdown-menu" style="display:block;">
                    <li class="list-group-item dropdown clearfix">
                      <a href="shop-product-list.html"><i class="fa fa-angle-right"></i> Classic </a>
                      <ul class="dropdown-menu">
                        <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i> Classic 1</a></li>
                        <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i> Classic 2</a></li>
                      </ul>
                    </li>
                    <li class="list-group-item dropdown clearfix active">
                      <a href="shop-product-list.html" class="collapsed"><i class="fa fa-angle-right"></i> Sport  </a>
                      <ul class="dropdown-menu" style="display:block;">
                        <li class="active"><a href="shop-product-list.html"><i class="fa fa-angle-right"></i> Sport 1</a></li>
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
          <li class="list-group-item clearfix"><a href="shop-product-list.html"><i class="fa fa-angle-right"></i> Home &amp; Garden</a></li>
          <li class="list-group-item clearfix"><a href="shop-product-list.html"><i class="fa fa-angle-right"></i> Custom Link</a></li>
        </ul>

        <div class="sidebar-products clearfix">
          <h2>Bestsellers</h2>
          <div class="item">
            <a href="shop-item.html"><img src="<%=request.getContextPath() %>/resources/assets/pages/img/products/k1.jpg" alt="Some Shoes in Animal with Cut Out"></a>
            <h3><a href="shop-item.html">Some Shoes in Animal with Cut Out</a></h3>
            <div class="price">$31.00</div>
          </div>
          <div class="item">
            <a href="shop-item.html"><img src="<%=request.getContextPath() %>/resources/assets/pages/img/products/k4.jpg" alt="Some Shoes in Animal with Cut Out"></a>
            <h3><a href="shop-item.html">Some Shoes in Animal with Cut Out</a></h3>
            <div class="price">$23.00</div>
          </div>
          <div class="item">
            <a href="shop-item.html"><img src="<%=request.getContextPath() %>/resources/assets/pages/img/products/k3.jpg" alt="Some Shoes in Animal with Cut Out"></a>
            <h3><a href="shop-item.html">Some Shoes in Animal with Cut Out</a></h3>
            <div class="price">$86.00</div>
          </div>
        </div>
      </div>
      <!-- END SIDEBAR -->

      <!-- BEGIN CONTENT -->
      <div class="col-md-9 col-sm-7">
        <div class="product-page">
          <div class="row">
            <div class="col-md-6 col-sm-6">
              
              <!-- 
              		경매번호를 이용하여 이미지 얻어오기
              		auction 테이블, auction_image 테이블 조인
               -->
              
              
              <div class="product-main-image">
                <img src="<%=request.getContextPath() %>/resources/assets/pages/img/products/model7.jpg" alt="${acvo.actname}" class="img-responsive" data-BigImgsrc="<%=request.getContextPath() %>/resources/assets/pages/img/products/model7.jpg">
              </div>
              <div class="product-other-images">
                <a href="<%=request.getContextPath() %>/resources/assets/pages/img/products/model3.jpg" class="fancybox-button" rel="photos-lib"><img alt="Berry Lace Dress" src="<%=request.getContextPath() %>/resources/assets/pages/img/products/model3.jpg"></a>
                <a href="<%=request.getContextPath() %>/resources/assets/pages/img/products/model4.jpg" class="fancybox-button" rel="photos-lib"><img alt="Berry Lace Dress" src="<%=request.getContextPath() %>/resources/assets/pages/img/products/model4.jpg"></a>
                <a href="<%=request.getContextPath() %>/resources/assets/pages/img/products/model5.jpg" class="fancybox-button" rel="photos-lib"><img alt="Berry Lace Dress" src="<%=request.getContextPath() %>/resources/assets/pages/img/products/model5.jpg"></a>
              </div>
            </div>
            <div class="col-md-6 col-sm-6">
              <h1>${acvo.actname}</h1>
              <div class="price-availability-block clearfix">
                <div class="pull-left">                  
	              <label class="control-label">현  재  가  : </label>
	              <fmt:formatNumber value="${nowprice}" type="number"/>원
              	  
              	  <br/>
              	  <label class="control-label">시  작  가  : </label>
              	  <span><fmt:formatNumber value="${acvo.startprice}" type="number"/>원</span>
              	  <br/>
              	  <span style="color:red;"><label class="control-label">즉시구매가  : </label>
              	  <strong style="font-size: 20pt;"><fmt:formatNumber value="${acvo.actd_price}" type="number"/>원</strong></span>
                </div>
                <form name="tenderFrm">
                	<input type="hidden" name="actnum" value="${acvo.actnum}"/>
                	<input type="hidden" name="actname" value="${acvo.actname}"/>
                	<input type="hidden" name="actd_endday" value="${acvo.actd_endday}"/>
                	<input type="hidden" name="actd_qty" value="${acvo.actd_qty}"/>
                	<input type="hidden" name="startprice" value="${acvo.startprice}"/>
                	<input type="hidden" name="actd_price" value="${acvo.actd_price}"/>
                	<input type="hidden" name="fk_usernum" value="${acvo.fk_usernum}"/>
                	<input type="hidden" name="nowprice" value="${nowprice}"/>
                </form>
              	  
              	
              </div>
                            
              <div class="product-page-options">
                <div class="pull-left">
                  <label class="control-label">입  찰  수 : </label>
                  <input style="border:none;" type="text" value="${count}" readonly />
                </div>
                <div class="pull-left">
                  <label class="control-label">남은시간 :  </label>
                  <div id="clock" style="display:inline;"></div>
                </div>
                <div class="pull-left">
                  <label class="control-label">(종료 :  </label>
                  <div style="display:inline;">${acvo.actd_endday})</div>
                </div>
              </div>
              
              <div class="product-page-cart">
              <c:if test="${sessionScope.loginuser.usernum != acvo.fk_usernum}">
                <div class="pull-left">
              	  <label class="control-label">수량 : </label>
              	  <input type="text" value="${acvo.actd_qty}" />
                </div>
                <br/><br/><br/>
                	<c:if test="${pr1 < pr2}">
                	<button class="btn btn-primary" type="button" onclick="goTender()">입찰하기</button>&nbsp;
                	
	                <!-- 형님께서 상품등록 하실 때 최소입찰가와 즉시구매가격이 같다면 '즉시구매' 버튼을 활성화시킨다. -->
	                
		            <button class="btn btn-default" type="button" onclick="goPay()">구매하기</button>&nbsp;
		                
		            <button class="btn btn-default" type="submit">관심상품등록</button>
	                </c:if>
	                
	                <c:if test="${nowprice >= acvo.actd_price}">
                	
	                <!-- 형님께서 상품등록 하실 때 최소입찰가와 즉시구매가격이 같다면 '즉시구매' 버튼을 활성화시킨다. -->
	                
		            <button class="btn btn-primary" type="button" onclick="goTender()">입찰하기</button>&nbsp;
		                
		            <button class="btn btn-default" type="submit">관심상품등록</button>
	                </c:if>
                </c:if>
              </div>
              <!-- <div class="review">
                <input type="range" value="4" step="0.25" id="backing4">
                <div class="rateit" data-rateit-backingfld="#backing4" data-rateit-resetable="false"  data-rateit-ispreset="true" data-rateit-min="0" data-rateit-max="5">
                </div>
                <a href="javascript:;">7 reviews</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="javascript:;">Write a review</a>
              </div> -->
              <ul class="social-icons">
                <li><a class="facebook" data-original-title="facebook" href="javascript:;"></a></li>
                <li><a class="twitter" data-original-title="twitter" href="javascript:;"></a></li>
                <li><a class="googleplus" data-original-title="googleplus" href="javascript:;"></a></li>
                <li><a class="evernote" data-original-title="evernote" href="javascript:;"></a></li>
                <li><a class="tumblr" data-original-title="tumblr" href="javascript:;"></a></li>
              </ul>
              
            </div>


<%-- 규호 소개!!////////////////////////////////////////////////////////////////// --%>
            <div class="product-page-content">
              <ul id="myTab" class="nav nav-tabs">
                <li><a href="#Description" data-toggle="tab">Description</a></li>
                <li><a href="#Information" data-toggle="tab">Information</a></li>
                <li class="active"><a href="#Reviews" data-toggle="tab">Reviews (2)</a></li>
              </ul>
              <div id="myTabContent" class="tab-content">
                <div class="tab-pane fade" id="Description">
                  <p>${acvo.actd_content}</p>
                </div>
<%-- 규호 정보!!////////////////////////////////////////////////////////////////// --%>                
                <div class="tab-pane fade" id="Information">
                  <table class="datasheet">
                    <tr>
                      <th colspan="2">Additional features</th>
                    </tr>
                    <tr>
                      <td class="datasheet-features-type">Value 1</td>
                      <td>21 cm</td>
                    </tr>
                    <tr>
                      <td class="datasheet-features-type">Value 2</td>
                      <td>700 gr.</td>
                    </tr>
                    <tr>
                      <td class="datasheet-features-type">Value 3</td>
                      <td>10 person</td>
                    </tr>
                    <tr>
                      <td class="datasheet-features-type">Value 4</td>
                      <td>14 cm</td>
                    </tr>
                    <tr>
                      <td class="datasheet-features-type">Value 5</td>
                      <td>plastic</td>
                    </tr>
                  </table>
                </div>
                
<%-- 규호 리뷰!!////////////////////////////////////////////////////////////////// --%>
                <div class="tab-pane fade in active" id="Reviews">
                  <!--<p>There are no reviews for this product.</p>-->
                  <c:forEach var="hugiboardvo" items="${hugiBoardList}">
                  	<div class="review-item clearfix">
                      <div class="review-item-submitted">
                        <strong>${hugiboardvo.fk_userid}</strong>
                        <em>${hugiboardvo.ep_writeday}</em>
                        <div class="rateit" data-rateit-value="${hugiboardvo.ep_satisfaction/2}" data-rateit-ispreset="true" data-rateit-readonly="true"></div>
                      </div>                                              
                      <div class="review-item-content">
                        <p>${hugiboardvo.ep_content}</p>
                      </div>
                    </div>
                  </c:forEach>
                  <!-- BEGIN FORM-->
                  <form action="#" class="reviews-form" role="form" name="reviewFrm">
                  	<input type="hidden" name="actdnum" value="${actdnum}"/>
                    <h2>Write a review</h2>
                    <div class="form-group">
                      <label for="name">아이디 <span class="require">*</span></label>
                      <input type="text" class="form-control" id="fk_userid" name="fk_userid" value="${sessionScope.loginuser.userid}" readonly/>
                    </div>
                    <div class="form-group">
                      <label for="review">리뷰 <span class="require">*</span></label>
                      <textarea class="form-control" rows="8" id="ep_content" name="ep_content"></textarea>
                    </div>
                    <div class="form-group">
                      <label for="email">만족도</label>
                      <input type="range" value="4" step="0.25" id="backing5" name="ep_satisfaction"/>
                      <div class="rateit" data-rateit-backingfld="#backing5" data-rateit-resetable="false"  data-rateit-ispreset="true" data-rateit-min="0" data-rateit-max="5">
                      </div>
                    </div>
                    <div class="padding-top-20">                  
                      <button type="submit" class="btn btn-primary" onClick="reviewRegist();">등록</button>
                    </div>
                  </form>
                  <!-- END FORM--> 
                </div>
              </div>
            </div>

            <div class="sticker sticker-sale"></div>
          </div>
        </div>
      </div>
      <!-- END CONTENT -->
    </div>
    <!-- END SIDEBAR & CONTENT -->

    <!-- BEGIN SIMILAR PRODUCTS -->
    <div class="row margin-bottom-40">
      <div class="col-md-12 col-sm-12">
        <h2>Most popular products</h2>
        <div class="owl-carousel owl-carousel4">
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
    </div>
    <!-- END SIMILAR PRODUCTS -->
  </div>
</div>

<!-- BEGIN PAGE LEVEL JAVASCRIPTS (REQUIRED ONLY FOR CURRENT PAGE) -->
<script src="<%=request.getContextPath() %>/resources/assets/plugins/fancybox/source/jquery.fancybox.pack.js" type="text/javascript"></script><!-- pop up -->
<script src="<%=request.getContextPath() %>/resources/assets/plugins/owl.carousel/owl.carousel.min.js" type="text/javascript"></script><!-- slider for products -->
<script src='<%=request.getContextPath() %>/resources/assets/plugins/zoom/jquery.zoom.min.js' type="text/javascript"></script><!-- product zoom -->
<script src="<%=request.getContextPath() %>/resources/assets/plugins/bootstrap-touchspin/bootstrap.touchspin.js" type="text/javascript"></script><!-- Quantity -->
<script src="<%=request.getContextPath() %>/resources/assets/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/resources/assets/plugins/rateit/src/jquery.rateit.js" type="text/javascript"></script>

<script src="<%=request.getContextPath() %>/resources/assets/corporate/scripts/layout.js" type="text/javascript"></script>
<script type="text/javascript">
    jQuery(document).ready(function() {
        Layout.init();    
        Layout.initOWL();
        Layout.initTwitter();
        Layout.initImageZoom();
        Layout.initTouchspin();
        Layout.initUniform();
    });
</script>
<!-- END PAGE LEVEL JAVASCRIPTS -->