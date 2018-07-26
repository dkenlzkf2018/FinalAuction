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

<%--
	#Buy 1. 구매 리스트 view 단

1. 구매리스트는 회원만 조회할 수 있다.
2. 페이징 처리
3.  
 --%>
<style type="text/css">
	table, tr, th  {
		text-align: center;
	}
	
	table, tr, td {
		
	}
	
</style>

<script type="text/javascript">
	function awardCancel() {
		var coin = Number("${coin}");
		var awardprice = document.buyListFrm.awardprice.value;
		if (coin >= (Number(awardprice)/10)) {
			if (confirm("보증금("+(awardprice/10)+"원)이 판매자에게 납부됩니다. 낙찰받은 상품을 취소하시겠습니까?")) {
				var frm = document.buyListFrm;
				frm.method = "POST";
				frm.action = "awardCancel.action";
				frm.submit();
			}
			else {
				return false;
			}
		}
		else {
			alert("보유하신 coin이 보증금보다 낮습니다. 충전하여 주십시오.");
			location.href="myPage.action";
		}
		
	}
	
	function pay() {
		if (confirm("이 상품을 결제하시겠습니까?")) {
			var frm = document.buyListFrm;
			var url = "<%=request.getContextPath()%>/pay.action";
	    	window.open("", "pay",
	    			   "left=569px, top=885px, width=569px, height=885px status=1");
			frm.method = "POST";
			frm.action = url;
			frm.target = "pay";
			frm.submit();
		}
		else {
			return false;
		}
		
		
	}
</script>

<div class="main">
<div class="container">      
<!-- BEGIN SIDEBAR & CONTENT -->
<div class="row margin-bottom-40">
  <!-- BEGIN CONTENT -->
<div class="col-md-12 col-sm-12">
  <h1>낙찰 목록</h1>
  <div class="goods-page">
    <div class="goods-data clearfix">
      <div class="table-wrapper-responsive">
      <form name="buyListFrm">
      <table summary="Shopping cart">
        <tr>
          <th class="goods-page-awardnum">상품이미지</th>
          <th class="goods-page-actname">상품명</th>
          <th class="goods-page-awardday">구매일자</th>
          <th class="goods-page-panmaeja">판매자</th>
          <th class="goods-page-awardprice">낙찰가</th>
          <th class="goods-page-pay">낙찰상태</th>
        </tr>
        
        <c:if test="${buyMapList != null}">
	        <c:forEach var="map" items="${buyMapList}">
	         <tr class="ssi" style="margin-left:5%;">                  
	           <td class="goods-page-awardnum">
	             <%-- ${map.AWARDNUM} --%>
	             <a style="cursor: pointer;" href="<%=request.getContextPath() %>/viewAuction.action?actdnum=${map.ACTDNUM}"><img style="width: 90px; height: 90px; overflow: hidden" src="<%=request.getContextPath() %>/resources/actimages/${map.ACTIMAGE}" /></a>
	           </td>
	           <td class="goods-page-actname">
	             <h3>${map.CNAME} > ${map.CDNAME} > <a style="cursor: pointer;" href="<%=request.getContextPath() %>/viewAuction.action?actdnum=${map.ACTDNUM}">${map.ACTNAME}</a></h3>
	             <%--  --%>
	             <%-- <a style="cursor:pointer;"><em>상세보기</em></a> --%>
	           </td>
	           <td class="goods-page-awardday">
	             ${map.AWARDDAY}
	           </td>
	           <td class="goods-page-panmaeja">
	             ${map.PANMAEJA}
	           </td>
	           <td class="goods-page-awardprice">
	             <strong><fmt:formatNumber value="${map.AWARDPRICE}" type="number"/></strong><span>원</span>
	           </td>
	           <td class="goods-page-pay">
	           	 <c:if test="${map.AWARD_STATUS == '0'}">
	             	<strong><a href="javascript:pay();" style='cursor: pointer;'>결제</a> / <a href="javascript:awardCancel();" style='cursor: pointer;'>낙찰취소</a></strong>
	             </c:if>
	             <c:if test="${map.AWARD_STATUS == '1'}">
	             	<c:if test="${map.DELIVERSTATUS == '0'}">			                    
			             <strong>주문완료</strong>			           
			        </c:if>
					<c:if test="${map.DELIVERSTATUS == '1'}">
			             <strong>배송중</strong>			          
			        </c:if>
			        <c:if test="${map.DELIVERSTATUS == '2'}">
			             <strong>배송완료</strong>			          
		            </c:if>
	             </c:if>
	             <c:if test="${map.AWARD_STATUS == '2'}">
	             	낙찰취소
	             </c:if>
	           </td>
	           <%--
	             --%>        
	         </tr>
	         <input type="hidden" name="awardnum" value="${map.AWARDNUM}" />
			 <input type="hidden" name="panmaeuserid" value="${map.PANMAEJA}" />
			 <input type="hidden" name="actdnum" value="${map.ACTDNUM}" />
			 <input type="hidden" name="awardprice" value="${map.AWARDPRICE}" />
			 <input type="hidden" name="coin" value="${sessionScope.loginuser.coin}" />
			 <input type="hidden" name="panmaeusernum" value="${map.PANMAEUSERNUM}" />
			 
	        </c:forEach>
        </c:if>
                  
        <c:if test="${buyMapList == null}">
		 <tr>
		  	<td colspan="6">최근 낙찰받은 상품이 존재하지 않습니다.</td>
		 </tr>
		 </c:if> 
		 
      </table>
      
      </form>
      </div>
    
   
                        
                        
      
	<div style="margin-top: 3%;"  class="row">
      <div class="col-md-12 col-sm-12 col-xs-12">
        <ul class="pagination pull-right">
          <li>${pagebar}</li>
        </ul>
      </div>
    </div>
    
    
    
    
    </div>
    
    
  </div>
  
</div>

<!-- BEGIN PAGINATOR -->
    
<!-- END PAGINATOR -->
</div>
<!-- END CONTENT -->
</div>
<!-- END SIDEBAR & CONTENT -->
</div>
<!-- BEGIN TOP SEARCH -->
			

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
 
  