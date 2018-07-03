<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
1. 구매리스트는 회원만 조회할 수 있다.
2. 페이징 처리
3.  
 --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매리스트</title>
</head>
<script type="text/javascript">
	$(document).ready(function () {
		
	});
</script>
<body>
<form name="buyListFrm">
	<h2 align="center">구매리스트</h2>
	<table class="table table-hover">
  <thead>
    <tr class="table-success">
      <th scope="col">주문일</th>
      <th scope="col">상품명</th>
      <th scope="col">주문번호</th>
      <th scope="col">판매자</th>
    </tr>
  </thead>
  <tbody>
    <tr class="table-active">
    <c:if test="${sessionScope.loginuser != null && sessionScope.loginuser.userid}">
    	<c:forEach var="map" items="${buyListMap}">
	    
	      <th scope="row">0</th>
	      <td>1</td>
	      <td>2</td>
	      <td>3</td>
	    
    	</c:forEach>
    </c:if>
    <c:if test="${sessionScope.loginuser == null}">
    	<td colspan="4" align="center">구매내역이 없습니다.</td>
    </c:if>
    </tr>
  </tbody>
  </table>
  
  <div align="center">
  <ul class="pagination">
    <li class="page-item disabled">
      <a class="page-link" href="#">&laquo;</a>
    </li>
    <li class="page-item active">
      <a class="page-link" href="#">1</a>
    </li>
    <li class="page-item">
      <a class="page-link" href="#">2</a>
    </li>
    <li class="page-item">
      <a class="page-link" href="#">3</a>
    </li>
    <li class="page-item">
      <a class="page-link" href="#">&raquo;</a>
    </li>
  </ul>
</div>
 
</form>
</body>
</html>