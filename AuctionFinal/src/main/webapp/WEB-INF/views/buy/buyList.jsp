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
		var frm = document.buyListFrm;
		frm.action = "buyList.action";
		frm.method = "GET";
		frm.submit();
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
    <c:if test="${buyList != null}">
    
	    
	      <th scope="row">0</th>
	      <td>1</td>
	      <td>2</td>
	      <td>3</td>
	    
    
    </c:if>
    <c:if test="${buyList == null}">
    	<td colspan="4">구매내역이 없습니다.</td>
    </c:if>
    </tr>
  </tbody>
</table> 
</form>
</body>
</html>