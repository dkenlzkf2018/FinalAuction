<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.InetAddress"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
	jQuery(document).ready(function(){
		
	});
</script>

<!-- BEGIN TOP BAR -->
    <div class="pre-header"> 
        <div class="container">
            <div class="row">
                <!-- BEGIN TOP BAR LEFT PART -->
                <div class="col-md-6 col-sm-6 additional-shop-info">
                    <ul class="list-unstyled list-inline">
                        <li><i class="fa fa-phone"></i><span>1544 9970</span></li>
                    </ul>
                </div>
                <!-- END TOP BAR LEFT PART -->
                <!-- BEGIN TOP BAR MENU -->
                <div class="col-md-6 col-sm-6 additional-nav">
                    <ul class="list-unstyled list-inline pull-right">
                        <li><a href="shop-account.html">My Account</a></li>
                        <li><a href="buyList.action">낙찰 목록</a></li>
                        <li><a href="boardlist.action">자유게시판</a></li>
                        <c:if test="${sessionScope.loginuser == null}">
                        	<li><a href="login.action">Log In</a></li>
                        </c:if>
                        <c:if test="${sessionScope.loginuser != null}">
                        	<c:if test="${sessionScope.loginuser.userid eq 'admin'}">
                        		<li><a href="adminMain.action">Admin Page</a></li>
                        	</c:if>
                        	<c:if test="${!(sessionScope.loginuser.userid eq 'admin')}">
                        		<li><a href="myPage.action">My Page</a></li>
                        	</c:if>
                        	<li><a href="AuctionUpload.action">경매 등록</a></li>
                        	<li>
                        		<a href="logout.action">Log Out</a>
                        	</li>
                        </c:if>
                    </ul>
                </div>
                <!-- END TOP BAR MENU -->
            </div>
        </div>        
    </div>
    <!-- END TOP BAR -->

    <!-- BEGIN HEADER -->
    <div class="header">
      <div class="container">
        <a class="site-logo" href="index.action"><img src="<%=request.getContextPath() %>/resources/assets/corporate/img/logos/superauction.png" alt="Metronic Shop UI"></a>

        <a href="javascript:void(0);" class="mobi-toggler"><i class="fa fa-bars"></i></a>

        <!-- BEGIN CART -->
        <div class="top-cart-block">
          <div class="top-cart-info">
          	<c:if test="${empty sessionScope.actViewList}">
          		<a href="javascript:void(0);" class="top-cart-info-count">0 items</a>
          	</c:if>
          	<c:if test="${!empty sessionScope.actViewList}">
            	<a href="javascript:void(0);" class="top-cart-info-count">${sessionScope.actViewList.size()} items</a>
            </c:if>
          </div>
          <i class="fa fa-shopping-cart"></i>
          <div class="top-cart-content-wrapper">
            <div class="top-cart-content">
              <ul class="scroller" style="height: 250px;">
                  <c:if test="${empty sessionScope.actViewList}">
                  	<li>
                  	<a>조회하신 경매 상품이 없습니다.</a>
                  	</li>
                  </c:if>
                  <c:if test="${!empty sessionScope.actViewList}">
                  <c:forEach var="ActViewVO" items="${sessionScope.actViewList}">
                  	  <li>
	                  <a href="viewAuction.action?actdnum=${ActViewVO.actdnum}"><img src="<%=request.getContextPath() %>/resources/actimages/${ActViewVO.actimage}" alt="Rolex Classic Watch" width="37" height="34"></a>
	                  <strong><a href="viewAuction.action?actdnum=${ActViewVO.actdnum}">${ActViewVO.actname}</a></strong>
	                  <em>${ActViewVO.actd_price}원</em>
                  	  <a href="javascript:void(0);" class="del-goods">&nbsp;</a>
                  	  </li>
                  </c:forEach>
                  </c:if>
              </ul>
            </div>
          </div>            
        </div>
        <!--END CART -->
		
        <!-- BEGIN NAVIGATION -->
        
        <div class="header-navigation">
          <ul>
            <c:forEach var="categoryvo" items="${categoryList}">
	        	<li class="dropdown">
	              <a class="dropdown-toggle" data-toggle="dropdown" data-target="#" href="javascript:;">
	                ${categoryvo.cname}
	              </a>
	              <!-- BEGIN DROPDOWN MENU -->
	              <ul class="dropdown-menu">
	              	<c:forEach var="categoryDetailvo" items="${categoryDetailList}">
	              		<c:if test="${categoryvo.cnum eq categoryDetailvo.fk_cnum}">
	              			<li><a href="/auction/AuctionShow.action?fk_cdnum=${categoryDetailvo.cdnum}">${categoryDetailvo.cdname}</a></li>
	              		</c:if>
	                </c:forEach>
	              </ul>
	              <!-- END DROPDOWN MENU -->
	            </li>
        	</c:forEach>
            <!-- BEGIN TOP SEARCH -->
            <li class="menu-search">
              <span class="sep"></span>
              <i class="fa fa-search search-btn"></i>
              <div class="search-box">
                <form action="#">
                  <div class="input-group">
                    <input type="text" placeholder="Search" class="form-control">
                    <span class="input-group-btn">
                      <button class="btn btn-primary" type="submit">Search</button>
                    </span>
                  </div>
                </form>
              </div> 
            </li>
            <!-- END TOP SEARCH -->
          </ul>
        </div>
        <!-- END NAVIGATION -->
      </div>
    </div>
    <!-- Header END -->