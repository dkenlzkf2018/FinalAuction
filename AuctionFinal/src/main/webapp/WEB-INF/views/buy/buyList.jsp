<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
	#Buy 1. 구매 리스트 view 단

1. 구매리스트는 회원만 조회할 수 있다.
2. 페이징 처리
3.  
 --%>
<style type="text/css">
	th, tr {
		text-align: center;
	}
	td {
		text-align: right;
	}
</style>

<script type="text/javascript">
	jQuery(document).ready(function () {
		
	});
</script>
<%-- <h3 align="left" style="margin-left: 2%;">낙찰 목록</h3>
<div>
<form name="buyListFrm">
	<table class="table table-hover">
  		<thead>
		    <tr class="table-success">
		      <th scope="col">구매번호</th>
		      <th scope="col">상품명</th>
		      <th scope="col">구매일자</th>
		      <th scope="col">판매자</th>
		      <th scope="col">낙찰가</th>
		      <th scope="col">배송상태</th>
		    </tr>
	  	</thead>

		<tbody>
			  
		  <c:if test="${sessionScope.loginuser.userid != null && buyMapList != null}">
		  	<c:forEach var="map" items="${buyMapList}">
			   <tr class="table-active">
			     <th scope="row">${map.AWARDNUM}</th>
			     <td>${map.CNAME} > ${map.CDNAME} > <a style="cursor: pointer;">${map.ACTNAME}</a></td>
			     <td>${map.AWARDDAY}</td>
			     <td>${map.PANMAEJA}</td>
			     <td><fmt:formatNumber value="${map.AWARDPRICE}" type="number"/>원</td>
			     <c:if test="${map.DELIVERSTATUS == '0'}">
			     	<td>주문완료</td>
			     </c:if>
			     <c:if test="${map.DELIVERSTATUS == '1'}">
			     	<td>배송중</td>
			     </c:if>
			     <c:if test="${map.DELIVERSTATUS == '2'}">
			     	<td>배송완료</td>
			     </c:if>
			   </tr>
		  	</c:forEach>
		  </c:if>
		  <c:if test="${sessionScope.loginuser.userid == null || buyMapList == null}">
		  	<tr>
		  	<td colspan="6">최근 낙찰받은 상품이 존재하지 않습니다.</td>
		  	</tr>
		  </c:if>
			  
		</tbody>
		
  </table>
</form>  
</div> --%>



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
      <div class="select-option" align="right" style="margin-right: 5%; margin-bottom: 10px;">
      <select>
      	<option>1</option>
      </select>
      </div>
      <table summary="Shopping cart">
        <tr>
          <th class="goods-page-awardnum">구매번호</th>
          <th class="goods-page-actname">상품명</th>
          <th class="goods-page-awardday">구매일자</th>
          <th class="goods-page-panmaeja">판매자</th>
          <th class="goods-page-awardprice">낙찰가</th>
          <th class="goods-page-deliverstatus">배송상태</th>
        </tr>
        
        <c:if test="${sessionScope.loginuser.userid != null && buyMapList != null}">
        <c:forEach var="map" items="${buyMapList}">
         <tr class="ssi">                  
           <td class="goods-page-awardnum">
             ${map.AWARDNUM}
           </td>
           <td class="goods-page-actname">
             <h3>${map.CNAME} > ${map.CDNAME} > <a style="cursor: pointer;">${map.ACTNAME}</a></h3>
             <p><strong>Item 1</strong> - Color: Green; Size: S</p>
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
           <c:if test="${map.DELIVERSTATUS == '0'}">
           <td class="goods-page-deliverstatus">
             <strong>주문완료</strong>
           </td>
           </c:if>
		   <c:if test="${map.DELIVERSTATUS == '1'}">
           <td class="goods-page-deliverstatus">
             <strong>배송중</strong>
           </td>
           </c:if>
           <c:if test="${map.DELIVERSTATUS == '2'}">
           <td class="goods-page-deliverstatus">
             <strong>배송완료</strong>
           </td>
           </c:if>                
         </tr>
         <c:if test="${sessionScope.loginuser.userid == null || buyMapList == null}">
		 <tr>
		  	<td colspan="6">최근 낙찰받은 상품이 존재하지 않습니다.</td>
		 </tr>
		 </c:if> 
        </c:forEach>
        </c:if>   
      </table>
      </div>

    </div>
  </div>
</div>

</div>
<!-- BEGIN PAGINATOR -->
    <div class="row">
      <div class="col-md-10 col-sm-10">
        <ul class="pagination pull-right">
          ${pagebar}
        </ul>
      </div>
    </div>
<!-- END PAGINATOR -->
</div>
<!-- END CONTENT -->
</div>
<!-- END SIDEBAR & CONTENT -->



 
  