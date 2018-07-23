<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery-2.0.0.js"></script>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
</head>
<style type="text/css">
	.hidden{
		display: none;
	}
</style>
<script type="text/javascript">

	$(document).ready(function(){
		
	});
	
	function goSerch(){
		
		var frm = document.pwdFindFrm;
		frm.method = "post";
		frm.action = "pwdFindEnd.action";
		frm.submit();
		
	}
	
	
</script>
<<<<<<< HEAD
<form name="pwdFindFrm">
=======


<form name="pwdFindFrm" id="pwdFindFrm">
>>>>>>> branch 'master' of https://github.com/dkenlzkf2018/FinalAuction.git
   <div id="div_userid" align="center">
      <span style="color: blue; font-size: 12pt;">아이디</span><br/> 
      <input type="text" name="userid" id="userid" size="15"placeholder="ID" required />
   </div>
   <div id="div_email" align="center">
   	  <span style="color: blue; font-size: 12pt;">이메일</span><br/>
      <input type="text" name="email" id="email" size="15" placeholder="abd@def.com" required />
   </div>
   <input type="hidden" name="n" id="n" value="${n}"/>
   
   <div id="div_btnFind" align="center">
		<br/><button type="button" id="btnFind" onClick="goSerch();">찾기</button>
	</div>
</form>
