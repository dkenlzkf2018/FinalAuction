<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- ===== #39.  tiles 중 footer 페이지 만들기  ===== --%>
<!-- BEGIN FOOTER -->
<div class="footer">
  <div class="container">
    <div class="row">
      <!-- BEGIN COPYRIGHT -->
     <div class="col-md-4 col-sm-4 padding-top-10">
       2015 © Keenthemes. ALL Rights Reserved. 
     </div>
     <!-- END COPYRIGHT -->
     <!-- BEGIN PAYMENTS -->
     <div class="col-md-4 col-sm-4">
       <ul class="list-unstyled list-inline pull-right">
         <li><img src="<%=request.getContextPath() %>/resources/assets/corporate/img/payments/western-union.jpg" alt="We accept Western Union" title="We accept Western Union"></li>
         <li><img src="<%=request.getContextPath() %>/resources/assets/corporate/img/payments/american-express.jpg" alt="We accept American Express" title="We accept American Express"></li>
         <li><img src="<%=request.getContextPath() %>/resources/assets/corporate/img/payments/MasterCard.jpg" alt="We accept MasterCard" title="We accept MasterCard"></li>
         <li><img src="<%=request.getContextPath() %>/resources/assets/corporate/img/payments/PayPal.jpg" alt="We accept PayPal" title="We accept PayPal"></li>
         <li><img src="<%=request.getContextPath() %>/resources/assets/corporate/img/payments/visa.jpg" alt="We accept Visa" title="We accept Visa"></li>
       </ul>
     </div>
     <!-- END PAYMENTS -->
     <!-- BEGIN POWERED -->
     <div class="col-md-4 col-sm-4 text-right">
       <p class="powered">Powered by: <a href="http://www.keenthemes.com/">KeenThemes.com</a></p>
     </div>
     <!-- END POWERED -->
    </div>
  </div>
</div>
<!-- END FOOTER -->

<!-- BEGIN fast view of a product -->
<c:if test="${null ne newAuctionList}">
<c:forEach var="auctionvo" items="${newAuctionList}">
<div id="product-pop-up${auctionvo.actdnum}" style="display: none; width: 700px;">
   <div class="product-page product-pop-up">
     <div class="row">
       <div class="col-md-6 col-sm-6 col-xs-3">
         <div class="product-main-image">
           <img src="<%=request.getContextPath() %>/resources/actimages/${auctionvo.actimage}" alt="${auctionvo.orgFilename}" class="img-responsive">
         </div>
         <div class="product-other-images">
           <%-- <a href="javascript:;" class="active"><img alt="Berry Lace Dress" src="<%=request.getContextPath() %>/resources/assets/pages/img/products/model3.jpg"></a>
           <a href="javascript:;"><img alt="Berry Lace Dress" src="<%=request.getContextPath() %>/resources/assets/pages/img/products/model4.jpg"></a>
           <a href="javascript:;"><img alt="Berry Lace Dress" src="<%=request.getContextPath() %>/resources/assets/pages/img/products/model5.jpg"></a> --%>
          </div>
        </div>
        <div class="col-md-6 col-sm-6 col-xs-9">
          <h2>${auctionvo.actname}</h2>
          <div class="price-availability-block clearfix">
            <div class="price">
              <strong><span>현재경매가</span> ${auctionvo.startprice}<span> 원</span></strong>
              <br/><span>즉시구매가</span> ${auctionvo.actd_price}<span> 원</span>
            </div>
            <div class="availability">
				경매 상태: <strong>
				<c:if test="${auctionvo.actd_status == '1'}">
				경매 중!
				</c:if>
				<c:if test="${auctionvo.actd_status == '0'}">
				경매 종료!
				</c:if>
				</strong>
            </div>
          </div>
          <div class="description">
            <p>${auctionvo.actd_content}</p>
          </div>
          <%-- <div class="product-page-options">
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
          </div> --%>
			<div class="product-page-cart">
			<a href="<%=request.getContextPath() %>/viewAuction.action?actdnum=${auctionvo.actdnum}" class="btn btn-default" style="width:100px">상세보기</a>
     </div>
        </div>
      </div>
    </div>
</div>
</c:forEach>
</c:if>

<c:if test="${null ne auctionList}">
<c:forEach var="auctionvo" items="${auctionList}">
<div id="product-pop-up${auctionvo.actdnum}" style="display: none; width: 700px;">
   <div class="product-page product-pop-up">
     <div class="row">
       <div class="col-md-6 col-sm-6 col-xs-3">
         <div class="product-main-image">
           <img src="<%=request.getContextPath() %>/resources/actimages/${auctionvo.actimage}" alt="${auctionvo.orgFilename}" class="img-responsive">
         </div>
         <div class="product-other-images">
           <%-- <a href="javascript:;" class="active"><img alt="Berry Lace Dress" src="<%=request.getContextPath() %>/resources/assets/pages/img/products/model3.jpg"></a>
           <a href="javascript:;"><img alt="Berry Lace Dress" src="<%=request.getContextPath() %>/resources/assets/pages/img/products/model4.jpg"></a>
           <a href="javascript:;"><img alt="Berry Lace Dress" src="<%=request.getContextPath() %>/resources/assets/pages/img/products/model5.jpg"></a> --%>
          </div>
        </div>
        <div class="col-md-6 col-sm-6 col-xs-9">
          <h2>${auctionvo.actname}</h2>
          <div class="price-availability-block clearfix">
            <div class="price">
              <strong><span>현재경매가</span> ${auctionvo.startprice}<span> 원</span></strong>
              <br/><span>즉시구매가</span> ${auctionvo.actd_price}<span> 원</span>
            </div>
			<div class="pull-left">
				<label class="control-label">(종료 :  </label>
			<div style="display:inline;">${auctionvo.actd_endday})</div>
            </div>
            <div class="availability">
				경매 상태: <strong>
				<c:if test="${auctionvo.actd_status == '1'}">
				경매 중!
				</c:if>
				<c:if test="${auctionvo.actd_status == '0'}">
				경매 종료!
				</c:if>
				</strong>
            </div>
          </div>
          <div class="description">
            <p>${auctionvo.actd_content}</p>
          </div>
          <%-- <div class="product-page-options">
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
          </div> --%>
          <div class="product-page-cart">
            <a href="<%=request.getContextPath() %>/viewAuction.action?actdnum=${auctionvo.actdnum}" class="btn btn-default" style="width:100px">상세보기</a>
          </div>
        </div>
      </div>
    </div>
</div>
</c:forEach>
</c:if>
<!-- END fast view of a product -->