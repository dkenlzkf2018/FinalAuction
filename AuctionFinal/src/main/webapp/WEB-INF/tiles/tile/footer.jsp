<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">

	//div태그에 보여질 시간, 경매종료, 텍스트
	var strNow = "";
	// tbl_auction_detail에서 상품의 즉시구매가를 가져온다.
	var actd_price = Number("${auctionvo.actd_price}");
	// 현재가를 얻어온다.
	var nowprice = Number("${nowprice}");
	// tbl_auction_detail에서 상품의 상태를 가져온다.(0이면 상품경매종료, 1이면 상품경매중)
	var actd_status = Number("${auctionvo.actd_status}");
	
	jQuery(document).ready(function () {
		
		loopshowNowTime();
	});
	
	// 남은 일자 계산
	function showNowTime() {
		var end = new Date("${auctionvo.actd_endday}");
		var endTime = parseInt(end.getTime()/1000);
		var now = new Date();
		var nowTime = parseInt(now.getTime()/1000);
		
		days = (end - now) / 1000 / 60 / 60 / 24;
		daysRound = Math.floor(days); 
		hours = (end - now) / 1000 / 60 / 60 - (24 * daysRound); 
		hoursRound = Math.floor(hours); 
		minutes = (end - now) / 1000 / 60 - (24 * 60 * daysRound) - (60 * hoursRound); 
		minutesRound = Math.floor(minutes); 
		seconds = (end - now) / 1000 - (24 * 60 * 60 * daysRound) - (60 * 60 * hoursRound) - (60 * minutesRound); 
		secondsRound = Math.round(seconds);
	
		if (nowTime < endTime) {
			if (actd_status == 1) {
				strNow = "" + daysRound + " 일 " + hoursRound + " 시 " + minutesRound + " 분 " + secondsRound + " 초 남음";
			}
			/* 
			if (nowprice != actd_price && actd_status == 1) {
				strNow = "" + daysRound + " 일 " + hoursRound + " 시 " + minutesRound + " 분 " + secondsRound + " 초 남음";
			}
			else if (nowprice == actd_price && actd_status == 1) {
				strNow = "경매종료";
				var frm = document.tenderFrm;
				frm.method = "POST";
				frm.action = "inputAward.action";
				frm.submit();
			} else {
				strNow = "경매종료";
			}*/
		}
		else if (nowTime == endTime && actd_status == 1){
			strNow = "경매종료";
			var frm = document.tenderFrm;
			frm.method = "POST";
			frm.action = "inputAward.action";
			frm.submit();
		}
		else if (nowTime > endTime){
			strNow = "경매종료";
		}
		
		//console.log(strNow);
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

	// 입찰하기 버튼
	function goTender() {
				
		if (strNow == "경매종료" || actd_price == nowprice) {
			alert("경매종료된 상품입니다.");
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
		if (strNow == "경매종료") {
			alert("경매종료된 상품입니다.");
			return false;
		}
		
		var fk_usernum = "${auctionvo.fk_usernum}";
		var usernum = "${sessionScope.loginuser.usernum}";
		console.log(fk_usernum+" "+usernum+" "+nowprice+" "+actd_price);
		if (strNow != "경매종료" && fk_usernum != usernum) {
			if(confirm("즉시구매 하시겠습니까?")) {
				// endprice와 usernum을 넘긴다.
				
				var frm = document.tenderFrm;
				frm.method = "POST";
				frm.action = "quickgumae.action";
				frm.submit();
				
			}
			else {
				return false;
			}
		}
	}
</script>

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