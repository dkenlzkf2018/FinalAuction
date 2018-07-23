<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<script type="text/javascript">

	$(document).ready(function(){
		
	});
	

	function goConfirm(){
		
		if( $("#input_confirmCode").val() == "${certificationCode}") {
			alert("인증성공 되었습니다.");
			alert($("#userid").val());
			var frm = document.findResultFrm;
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
    
<form name="findResultFrm" id="findResultFrm" method="post">
<div id="div_findResult" align="center">
   <c:if test="${n == 1}">
      <div id="pwdConfirmCodeDiv">
      	  인증코드가 ${email}로 발송되었습니다.<br/> 
      	  인증코드를 입력해주세요<br/> 
      	 <input type="text" name="input_confirmCode" id="input_confirmCode" required />
      	 <br/><br/>
      	 <button type="button" id="btnConfirmCode" onClick="goConfirm();">인증하기</button>    
      </div>
      <input type="hidden" id="userid" name="userid" value="${userid}" />
      <input type="hidden" id="email" name="email" value="${email}" />
   </c:if>   
</div>
</form>