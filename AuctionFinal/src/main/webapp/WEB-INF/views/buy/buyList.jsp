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
	th, tr, td {
		text-align: center;
	}
</style>

<script type="text/javascript">
	jQuery(document).ready(function () {
		
	});
</script>
<h3 align="left" style="margin-left: 2%;">낙찰 목록</h3>
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
</div>
 <div align="center">
  <ul class="pagination">
    <li class="page-item disabled">
      <a class="page-link" href="#">&laquo;</a>
    </li>
    <li class="page-item active">
      <a class="page-link" href="#">1</a>
    </li>
    <li class="page-item">
      <a class="page-link" href="#">&raquo;</a>
    </li>
  </ul>
 </div>
  