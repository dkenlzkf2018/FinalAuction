<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.finalc.auction.model.CategoryVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<STYLE type="text/css">
	
</STYLE>

<Script type="text/javascript">
	
	function goProductPage(actnum){
		
	}
	
</Script>

<div class="slot">
<div id="AuctionNav">
	<h3>전체경매수 <span id="totalCnt" >${totalCnt}</span> 개</h3>
	<div >
		<select>
			<option value="">선택하세요</option>
			<option value="type1">입찰인기순</option>
			<option value="type2">신규등록순</option>
			<option value="type3">낮은가격순</option>
			<option value="type4">경매이름순</option>
		</select>
	</div>
</div>
<div class="row">

<c:forEach var="auctionvo" items="${auctionList}">
	<c:if test="${ auctionvo.fk_cdnum == fk_cdnum || fk_cdnum == null}" >
		<form>
		<div class="auction" onClick="goProductPage(${auctionvo.actnum})">
			<div class="col-md-3 col-sm-6 col-xs-12">
				<div class="product-item">
					<div class="pi-img-wrapper">
						<img src="<%=request.getContextPath() %>/resources/actimages/${auctionvo.actimage}" width="100%" class="img-responsi ve" alt="${auctionvo.orgFilename}" />
						<div>
							<a href="<%=request.getContextPath() %>/resources/actimages/${auctionvo.actimage}" class="btn btn-default fancybox-button">Zoom</a>
							<a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
						</div>
					</div>
					<h3><a onClick="goProductPage(${auctionvo.actnum})">${auctionvo.actname}</a></h3>
					<div class="pi-price">현재경매가 : ${auctionvo.startprice} 원</div>
					<div class="row"></div>
					<div class="pi-price">즉시구매가 : ${auctionvo.actd_price} 원</div>
					<div class="row"></div>
					<div class="">${auctionvo.actd_endday} 까지</div>
					<div class="row"></div>
					<a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
				</div>
			</div>
		</div>
		</form>
	</c:if>
</c:forEach>
</div>
</div>
<div class="row" style="margin-top:10pt; margin-bottom:10pt;"></div>
