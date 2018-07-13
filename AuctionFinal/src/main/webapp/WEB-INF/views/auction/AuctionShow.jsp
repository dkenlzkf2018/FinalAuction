<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.finalc.auction.model.CategoryVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<STYLE type="text/css">
	
</STYLE>

<Script type="text/javascript">

</Script>

<c:forEach var="auctionvo" items="${auctionList}">
	<c:if test="${auctionvo.fk_cnum == cnum }" >
		<form> 
			<div class="product-item" onClick="goProductPage(${auctionvo.actnum})">
					<div class="pi-img-wrapper">
						<img src="<%=request.getContextPath() %>/resources/assets/pages/img/products/model1.jpg" class="img-responsive" alt="Berry Lace Dress">
					<div>
						<a href="<%=request.getContextPath() %>/resources/assets/pages/img/products/model1.jpg" class="btn btn-default fancybox-button">Zoom</a>
						<a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
					</div>
					</div>
					<h3><a href="shop-item.html">Berry Lace Dress</a></h3>
					<div class="pi-price">$29.00</div>
					<a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
					<div class="sticker sticker-sale"></div>
			</div>
		</form>
	</c:if>

</c:forEach>
