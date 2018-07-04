<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<script type="text/javascript">

</script>

</head>
<body>
	<div>
		
		<c:if test="${n != 1}">
			<span style="font-weight: bold; margin-left: 10%;">사용가능한 아이디 입니다.</span>
		</c:if>
		
		<c:if test="${n == 1}">
			<span style="font-weight: bold; margin-left: 10%;">이미 사용중인 아이디 입니다.</span>
		</c:if>
	</div>
	
</body>
</html>