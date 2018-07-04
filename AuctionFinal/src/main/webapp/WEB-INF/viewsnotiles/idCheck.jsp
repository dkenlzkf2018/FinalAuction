<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${n == 0}">
	${msg}
</c:if>
<c:if test="${n == 1}">
	${msg}
</c:if>
