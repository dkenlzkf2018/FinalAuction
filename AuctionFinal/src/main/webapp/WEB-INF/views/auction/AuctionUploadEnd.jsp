<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">

	<c:if test="${n == 1}">
		alert("등록 되었습니다.");
	</c:if>
	
	<c:if test="n != 1">
		alert("등록에 실패하였습니다.");
	</c:if>
	
	location.href="<%= request.getContextPath() %>/index.action";
	// 글목록을 보여주는 페이지로 이동

</script>
    