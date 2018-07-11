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
<script type="text/javascript">

	$(document).ready(function(){
		$("#btnConfirmCode").click(function(){
			goConfirm();
		});
	});
	
	function goSerch(){
		
		var frm = document.pwdFindFrm;
		frm.method = "post";
		frm.action = "pwdFind.action";
		frm.submit();
		
		
		var method = "${method}";
		var userid = "${userid}";
		var email = "${email}";
		var n = "${n}";
		
		if(method=="POST" && userid != "" && email != "") {
			$("#userid").val(userid);
			$("#email").val(email);
		}
		
		if(method=="POST" && n==1) {
			$("#div_btnFind").hide();
			$("#div_userid").hide();
			$("#div_email").hide();
		}
		else if(method=="POST" && (n == -1 || n == 0)) {
			$("#div_btnFind").show();
			$("#div_userid").show();
			$("#div_email").show();
		}		
				
	}
	
	function goConfirm(){
		
		if( $("#input_confirmCode").val() == "${certificationCode}") {
			alert("인증성공 되었습니다.");
			
			var frm = document.pwdFindFrm;
			frm.method = "post"; // 새암호와 새암호확인을 입력받기 위한 폼만을 띄워주기 때문에 get 방식으로 한다.
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


<form name="pwdFindFrm">
   <div id="div_userid" align="center">
      <span style="color: blue; font-size: 12pt;">아이디</span><br/> 
      <input type="text" name="userid" id="userid" size="15" placeholder="ID" required />
   </div>
   
   <div id="div_email" align="center">
   	  <span style="color: blue; font-size: 12pt;">이메일</span><br/>
      <input type="text" name="email" id="email" size="15" placeholder="abd@def.com" required />
   </div>
   
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
   	   
   	   <c:if test="${n == 0}">
   	   	  <span style="color: red;">사용자 정보가 없습니다.</span>
   	   </c:if>
   	   
   	   <c:if test="${n == -1}">
   	   	  <span style="color: red;">${sendFailmsg}</span>
   	   </c:if>
   	   
   </div>
   
   <div id="div_btnFind" align="center">
   		<br/><button type="button" id="btnFind" onClick="goSerch();">찾기</button>
   </div>
   
</form>