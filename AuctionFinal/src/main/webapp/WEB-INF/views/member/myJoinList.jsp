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

</style>

<script type="text/javascript">
	
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
      <form name="JoinListFrm">
      <table summary="Shopping cart">
        <tr>
          <th class="goods-page-actnum">상품번호</th>
          <th class="goods-page-awardnum">낙찰번호</th>
          <th class="goods-page-awardday">구매일자</th>
          <th class="goods-page-awardprice">입찰가</th>
          <th class="goods-page-endday">종료일</th>
        </tr>
        
        <c:if test="${JoinList != null}">
	        <c:forEach var="map" items="${JoinList}">
	         <tr class="ssi" style="margin-left:5%;">                  
	           
	           <td class="goods-page-actnnum">
	             ${map.ACTNUM}
	           </td>
	           <td class="goods-page-awardnum">
	             ${map.JOINACTNUM}
	           </td>
	           <td class="goods-page-awardday">
	             ${map.TENDERDAY}
	           </td>
	           <td class="goods-page-awardprice">
	             <strong><fmt:formatNumber value="${map.TENDERPRICE}" type="number"/></strong><span>원</span>
	           </td>
	           <td class="goods-page-endday">
	             ${map.ACTD_ENDDAY}
	           </td>
	         </tr>
	        </c:forEach>
        </c:if>
                  
        <c:if test="${JoinList == null}">
		 <tr>
		  	<td colspan="6">최근 입찰한 상품이 존재하지 않습니다.</td>
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
 
  