<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${n == 0}">
	<h3>${msg}</h3>
</c:if>
<c:if test="${n == 1}">
	<h3>${msg}</h3>
</c:if>
