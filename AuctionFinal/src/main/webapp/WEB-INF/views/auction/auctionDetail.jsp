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
	
	// div태그에 보여질 시간, 경매종료, 텍스트
	var strNow = "";
	// tbl_auction_detail에서 상품의 즉시구매가를 가져온다.
	var actd_price = Number("${acvo.actd_price}");
	// 현재가를 얻어온다.
	var nowprice = Number("${nowprice}");
	// tbl_auction_detail에서 상품의 상태를 가져온다.(0이면 상품경매종료, 1이면 상품경매중)
	var actd_status = Number("${acvo.actd_status}");
	var coin = Number("${sessionScope.loginuser.coin}");
	
	jQuery(document).ready(function () {
		loopshowNowTime();
	});
	
	// 남은 일자 계산
	function showNowTime() {
		var end = new Date("${acvo.actd_endday}");
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
			strNow = "" + daysRound + " 일 " + hoursRound + " 시 " + minutesRound + " 분 " + secondsRound + " 초 남음";
		}
		else if (nowTime >= endTime){
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

	// 구매 후기(구매 게시판 후기)
	function reviewRegist() {
		var content = document.getElementById("ep_content").value.trim();
		var userid = "${sessionScope.loginuser.userid}";
		
		var frm = document.reviewFrm;
		frm.method = "get";
		frm.action = "reviewRegistLGH.action";
		frm.submit();
		
	}
	
	
	
	// 입찰하기 버튼
	function goTender() {
				
		if (strNow == "경매종료" || actd_status == 0 || actd_price == nowprice) {
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
		
		if (strNow == "경매종료" || actd_status == 0) {
			alert("경매종료된 상품입니다.");
			return false;
		}
		
		if (coin < actd_price) {
			if(confirm("coin이 "+(actd_price - coin)+"원 부족합니다. 충전하시겠습니까?")) {
				location.href="myPage.action";
			}
			else {
				return false;
			}
		}
		else {
			var fk_usernum = "${acvo.fk_usernum}";
			var usernum = "${sessionScope.loginuser.usernum}";
			
			//console.log(fk_usernum+" "+usernum+" "+nowprice+" "+actd_price);
			if (strNow != "경매종료" && fk_usernum != usernum && actd_status == 1) {
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
	}
</script>

<div class="main">
  <div class="container">
    <ul class="breadcrumb">
        <li><a href="index.action">Home</a></li>
        <li>${cvo.cname}</li>
        <li><a href="/auction/AuctionShow.action?fk_cdnum=${cvo.cdnum}">${cvo.cdname}</a></li>
        <li class="active">${acvo.actname}</li>
    </ul>
    <!-- BEGIN SIDEBAR & CONTENT -->
    <div class="row margin-bottom-40">
      <!-- BEGIN SIDEBAR -->
      <div class="sidebar col-md-3 col-sm-5">
        <ul class="list-group margin-bottom-25 sidebar-menu">
        
        <c:forEach var="categoryvo" items="${categoryList}" varStatus="status">
          <li class="list-group-item clearfix dropdown">
            <a class="collapsed">
              <i class="fa fa-angle-right"></i>
              ${categoryvo.cname}
            </a>
            
            
            <ul class="dropdown-menu" style="display:block;">
            <c:forEach var="categoryDetailvo" items="${categoryDetailList}">              
              	<c:if test="${categoryvo.cnum eq categoryDetailvo.fk_cnum}">
                	<li><a href="/auction/AuctionShow.action?fk_cdnum=${categoryDetailvo.cdnum}"><i class="fa fa-angle-right"></i> ${categoryDetailvo.cdname}</a></li>
                </c:if>
            </c:forEach>         
            </ul>
            
          </li>
          </c:forEach>
        </ul>
        

        
          <span style="font-weight: bold; font-size: 13pt;">Super Auction 파트너스</span>
          <br/>
         <div class="sidebar col-md-3 col-sm-5"> 
	          <a href="http://corners.auction.co.kr/corner/UsedMarket.aspx"> <img src="<%=request.getContextPath() %>/resources/images/logo_umarket.png"></a>
	          <br/><br/>
	          <a href="http://ebay.auction.co.kr/"><img src="<%=request.getContextPath() %>/resources/images/m_logo_auct_ebsh.png"></a>
	          <br/><br/>
	          <a href="http://www.bidbuy.co.kr/"><img src="<%=request.getContextPath() %>/resources/images/blogo.png"></a>  
	          <br/><br/>
	          <a href="https://auctions.yahoo.co.jp/"><img src="<%=request.getContextPath() %>/resources/images/logo_yahuoku_01.png"></a>
	          <!-- <i class="fa fa-angle-right"></i> -->
          
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
                <img src="<%=request.getContextPath() %>/resources/actimages/${acvo.actimage}" alt="${acvo.actname}" class="img-responsive" data-BigImgsrc="<%=request.getContextPath() %>/resources/actimages/${acvo.actimage}">
              </div>
              <%-- 세부이미지 아직 상품등록에 없음..
              	<div class="product-other-images">
                <a href="<%=request.getContextPath() %>/resources/assets/pages/img/products/model3.jpg" class="fancybox-button" rel="photos-lib"><img alt="Berry Lace Dress" src="<%=request.getContextPath() %>/resources/assets/pages/img/products/model3.jpg"></a>
                <a href="<%=request.getContextPath() %>/resources/assets/pages/img/products/model4.jpg" class="fancybox-button" rel="photos-lib"><img alt="Berry Lace Dress" src="<%=request.getContextPath() %>/resources/assets/pages/img/products/model4.jpg"></a>
                <a href="<%=request.getContextPath() %>/resources/assets/pages/img/products/model5.jpg" class="fancybox-button" rel="photos-lib"><img alt="Berry Lace Dress" src="<%=request.getContextPath() %>/resources/assets/pages/img/products/model5.jpg"></a>
              </div> --%>
            </div>
            <div class="col-md-6 col-sm-12">
              <h1>${acvo.actname}</h1>
              <div class="price-availability-block clearfix">
                <div class="pull-left">                  
	              <c:if test="${acvo.actd_status == '1'}">
	              
	              <label class="control-label">현  재  가  : </label>
	              <fmt:formatNumber value="${nowprice}" type="number"/>원
              	  &nbsp;/&nbsp;
              	  <label class="control-label">시  작  가  : </label>
              	  <span><fmt:formatNumber value="${acvo.startprice}" type="number"/>원</span>
              	  <br/>
              	  <label class="control-label">입찰 단위  : </label>
              	  <span><fmt:formatNumber value="${acvo.actd_lowertenderprice}" type="number"/>원</span>
              	  <br/>
              	  
              	  <span style="color:red;"><label class="control-label">즉시구매가  : </label>
              	  <strong style="font-size: 20pt;"><fmt:formatNumber value="${acvo.actd_price}" type="number"/>원</strong></span>
              	  <br/>
              	  
              	  <%-- <label class="control-label">수       량  : </label>
              	  <span><fmt:formatNumber value="${acvo.actd_qty}" type="number"/>개</span> --%>
              	  <br/>
              	  
              	  </c:if>
              	  <c:if test="${acvo.actd_status == '0'}">
	              
	              <span style="color:red;"><label class="control-label">낙  찰  가  : </label>
	              <fmt:formatNumber value="${nowprice}" type="number"/>원</span>
              	  &nbsp;/&nbsp;
              	  <label class="control-label">시  작  가  : </label>
              	  <span><fmt:formatNumber value="${acvo.startprice}" type="number"/>원</span>
              	  
              	  <br/>
              	  
              	  </c:if>
                </div>
                <form name="tenderFrm">
                	<input type="hidden" name="actnum" value="${acvo.actnum}"/>
                	<input type="hidden" name="actdnum" value="${acvo.actdnum}"/>
                	<input type="hidden" name="actname" value="${acvo.actname}"/>
                	<input type="hidden" name="actd_endday" value="${acvo.actd_endday}"/>
                	<input type="hidden" name="actd_qty" value="${acvo.actd_qty}"/>
                	<input type="hidden" name="startprice" value="${acvo.startprice}"/>
                	<input type="hidden" name="actd_price" value="${acvo.actd_price}"/>
                	<input type="hidden" name="fk_usernum" value="${acvo.fk_usernum}"/>
                	<input type="hidden" name="actd_lowertenderprice" value="${acvo.actd_lowertenderprice}"/>
                	<input type="hidden" id="nowprice" name="nowprice" value="${nowprice}"/>
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
	              	<c:if test="${pr1 < pr2}">
		               <!-- <div class="pull-left">
		             	  <label class="control-label">수량 : </label>
		             	  <input id="qty" name="qty" type="number" value="1" min="1" max="100"/>
		               </div>
		               <br/><br/><br/> -->
		               	
		              	<button class="btn btn-primary" type="button" onclick="goTender()">입찰하기</button>&nbsp;
		              	
		               <!-- 형님께서 상품등록 하실 때 최소입찰가와 즉시구매가격이 같다면 '즉시구매' 버튼을 활성화시킨다. -->
		               
			            <button class="btn btn-default" type="button" onclick="goPay()">즉시구매</button>&nbsp;
	                </c:if>
		                
		            <c:if test="${pr1 >= pr2}">
	                	<div class="pull-left">
		             		상품판매가 종료되었습니다.  
		            	</div>
		            </c:if>
	              </c:if>
	              <c:if test="${sessionScope.loginuser.usernum == acvo.fk_usernum}">
	              	상품을 등록하신 회원께서는 입찰 및 즉시구매를 할 수 없습니다.
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
                <!-- <li><a href="#Information" data-toggle="tab">Information</a></li> -->
                <li class="active"><a href="#Reviews" data-toggle="tab">Reviews (${hugisize})</a></li>
              </ul>
              <div id="myTabContent" class="tab-content">
                <div class="tab-pane fade" id="Description">
                  <p>${acvo.actd_content}</p>
                </div>
<%-- 규호 정보!!////////////////////////////////////////////////////////////////// --%>                
                <!-- <div class="tab-pane fade" id="Information">
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
                </div> -->
                
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
                  <form class="reviews-form" name="reviewFrm">
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