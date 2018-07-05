<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Page level plugin styles START -->
<link href="<%=request.getContextPath() %>/resources/assets/plugins/fancybox/source/jquery.fancybox.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/resources/assets/plugins/owl.carousel/assets/owl.carousel.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/resources/assets/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css">
<link href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" rel="stylesheet" type="text/css"><!-- for slider-range -->
<link href="<%=request.getContextPath() %>/resources/assets/plugins/rateit/src/rateit.css" rel="stylesheet" type="text/css">
<!-- Page level plugin styles END -->

<script type="text/javascript">
	function reviewRegist() {
		var frm = document.reviewFrm;
		
		frm.method = "get";
		frm.action = "reviewRegist.action";
		frm.submit();
	}
</script>

<div class="main">
  <div class="container">
    <ul class="breadcrumb">
        <li><a href="index.html">Home</a></li>
        <li><a href="">Store</a></li>
        <li class="active">Cool green dress with red bell</li>
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
              <div class="product-main-image">
                <img src="<%=request.getContextPath() %>/resources/assets/pages/img/products/model7.jpg" alt="Cool green dress with red bell" class="img-responsive" data-BigImgsrc="<%=request.getContextPath() %>/resources/assets/pages/img/products/model7.jpg">
              </div>
              <div class="product-other-images">
                <a href="<%=request.getContextPath() %>/resources/assets/pages/img/products/model3.jpg" class="fancybox-button" rel="photos-lib"><img alt="Berry Lace Dress" src="<%=request.getContextPath() %>/resources/assets/pages/img/products/model3.jpg"></a>
                <a href="<%=request.getContextPath() %>/resources/assets/pages/img/products/model4.jpg" class="fancybox-button" rel="photos-lib"><img alt="Berry Lace Dress" src="<%=request.getContextPath() %>/resources/assets/pages/img/products/model4.jpg"></a>
                <a href="<%=request.getContextPath() %>/resources/assets/pages/img/products/model5.jpg" class="fancybox-button" rel="photos-lib"><img alt="Berry Lace Dress" src="<%=request.getContextPath() %>/resources/assets/pages/img/products/model5.jpg"></a>
              </div>
            </div>
            <div class="col-md-6 col-sm-6">
              <h1>Cool green dress with red bell</h1>
              <div class="price-availability-block clearfix">
                <div class="price">
                  <strong><span>$</span>47.00</strong>
                  <em>$<span>62.00</span></em>
                </div>
                <div class="availability">
                  Availability: <strong>In Stock</strong>
                </div>
              </div>
              <div class="description">
                <p>Lorem ipsum dolor ut sit ame dolore  adipiscing elit, sed nonumy nibh sed euismod laoreet dolore magna aliquarm erat volutpat 
				Nostrud duis molestie at dolore.</p>
              </div>
              <div class="product-page-options">
                <div class="pull-left">
                  <label class="control-label">Size:</label>
                  <select class="form-control input-sm">
                    <option>L</option>
                    <option>M</option>
                    <option>XL</option>
                  </select>
                </div>
                <div class="pull-left">
                  <label class="control-label">Color:</label>
                  <select class="form-control input-sm">
                    <option>Red</option>
                    <option>Blue</option>
                    <option>Black</option>
                  </select>
                </div>
              </div>
              <div class="product-page-cart">
                <div class="product-quantity">
                    <input id="product-quantity" type="text" value="1" readonly class="form-control input-sm">
                </div>
                <button class="btn btn-primary" type="submit">Add to cart</button>
              </div>
              <div class="review">
                <input type="range" value="4" step="0.25" id="backing4">
                <div class="rateit" data-rateit-backingfld="#backing4" data-rateit-resetable="false"  data-rateit-ispreset="true" data-rateit-min="0" data-rateit-max="5">
                </div>
                <a href="javascript:;">7 reviews</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="javascript:;">Write a review</a>
              </div>
              <ul class="social-icons">
                <li><a class="facebook" data-original-title="facebook" href="javascript:;"></a></li>
                <li><a class="twitter" data-original-title="twitter" href="javascript:;"></a></li>
                <li><a class="googleplus" data-original-title="googleplus" href="javascript:;"></a></li>
                <li><a class="evernote" data-original-title="evernote" href="javascript:;"></a></li>
                <li><a class="tumblr" data-original-title="tumblr" href="javascript:;"></a></li>
              </ul>
            </div>

            <div class="product-page-content">
              <ul id="myTab" class="nav nav-tabs">
                <li><a href="#Description" data-toggle="tab">Description</a></li>
                <li><a href="#Information" data-toggle="tab">Information</a></li>
                <li class="active"><a href="#Reviews" data-toggle="tab">Reviews (2)</a></li>
              </ul>
              <div id="myTabContent" class="tab-content">
                <div class="tab-pane fade" id="Description">
                  <p>Lorem ipsum dolor ut sit ame dolore  adipiscing elit, sed sit nonumy nibh sed euismod laoreet dolore magna aliquarm erat sit volutpat Nostrud duis molestie at dolore. Lorem ipsum dolor ut sit ame dolore  adipiscing elit, sed sit nonumy nibh sed euismod laoreet dolore magna aliquarm erat sit volutpat Nostrud duis molestie at dolore. Lorem ipsum dolor ut sit ame dolore  adipiscing elit, sed sit nonumy nibh sed euismod laoreet dolore magna aliquarm erat sit volutpat Nostrud duis molestie at dolore. </p>
                </div>
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