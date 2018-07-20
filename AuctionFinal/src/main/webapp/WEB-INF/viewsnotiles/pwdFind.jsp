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
		$("#btnFind").click(function(){
			$("#pwdFindFrm").hide();
		});
	});
	
	function goSerch(){
		
		
		var frm = document.pwdFindFrm;
		frm.method = "post";
		frm.action = "pwdFind.action";
		frm.submit();
		
		var method = requestScope.method;
		var userid = requestScope.userid;
		var email = requestScope.email;
		var n = requestScope.n;
		
		if(method=="POST" && n==1) {
			$("#pwdFindFrm").hide();
		}
		else if(method=="POST" && (n == -1 || n == 0)) {
			$("#pwdFindFrm").hide();
		}		
				
	}
	
	function goConfirm(){
		
		$("#pwdFindFrm").hide();
		$("#div_userid").hide();
		$("#div_email").hide();
		$("#div_btnFind").hide();
		
		if( $("#input_confirmCode").val() == "${certificationCode}") {
			alert("인증성공 되었습니다.");
			alert($("#userid").val());
			var frm = document.pwdFindFrm;
			frm.method = "get"; // 새암호와 새암호확인을 입력받기 위한 폼만을 띄워주기 때문에 get 방식으로 한다.
			frm.action = "pwdConfirm.action";
			frm.submit();
		}
		else {
			alert("인증코드를 다시 입력하세요!!");
			$("#input_confirmCode").val("");
			$("#input_confirmCode").focus();
		}
	}
	
</script>


<form name="pwdFindFrm" id="pwdFindFrm">
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


<form name="findResultFrm" id="findResultFrm">
<div id="div_findResult" align="center">
   <c:if test="${n == 1}">
      <div id="pwdConfirmCodeDiv">
      	  인증코드가 ${email}로 발송되었습니다.<br/>
      	  인증코드를 입력해주세요<br/>
      	 <input type="text" name="input_confirmCode" id="input_confirmCode" required />
      	 <br/><br/>
      	 <button type="button" id="btnConfirmCode" onClick="goConfirm();">인증하기</button>    
      </div>
   </c:if>   
</div>
</form>