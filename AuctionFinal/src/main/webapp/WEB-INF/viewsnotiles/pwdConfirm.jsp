<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%
	String ctxname = request.getContextPath();
%>

<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery-2.0.0.js"></script>
<script type="text/javascript">
	
	$(document).ready(function(){
		
		$("#btnUpdate").click(function(event){
			
			var pwd = $("#pwd").val();
			var pwd2 = $("#pwd2").val();
			
			var regexp_passwd = new RegExp(/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g); 
			/* 암호는 숫자,영문자,특수문자가 포함된 형태의 8~15글자 이하만 허락해주는 정규표현식 객체 생성 */
			
			var bool = regexp_passwd.test(pwd);
			/* 암호 정규표현식 검사를 하는 것 
			      정규표현식에 만족하면 리턴값은 true,
			      정규표현식에 틀리면 리턴값은 false */
			      
			if(!bool) {
				alert("암호는 8글자 이상 15글자 이하에 영문자, 숫자, 특수기호가 혼합되어야 합니다."); 
				$("#pwd").val("");
				$("#pwd2").val("");
				event.preventDefault();
				return;
			}   
			else if(pwd != pwd2) {
				alert("암호가 일치하지 않습니다.");
				$("#pwd").val("");
				$("#pwd2").val("");
				event.preventDefault();
				return;
			}
			else {
				var frm = document.pwdConfirmFrm;
				frm.method = "get";
				frm.action = "pwdConfirm.action";
				frm.submit();
			}
		});
				
	});
	
</script>


<form name="pwdConfirmFrm">
   <div id="div_pwd" align="center">
      <span style="color: blue; font-size: 12pt;">새암호</span><br/> 
      <input type="password" name="pwd" id="pwd" size="15" placeholder="PASSWORD" required />
   </div>
   
   <div id="div_pwd2" align="center">
   	  <span style="color: blue; font-size: 12pt;">새암호확인</span><br/>
      <input type="password" name="pwd2" id="pwd2" size="15" placeholder="PASSWORD" required />
   </div>
   
   <div id="div_btnUpdate" align="center">
	   	<button type="button" id="btnUpdate">암호변경하기</button>
	</div>
   
   <input type="hidden" name="userid" id="userid" value="${userid}" />
   
   <c:if test="${method.equals('GET') && n==1 }">
   		<div id="div_confirmResult" align="center">
   			ID : ${userid}님의 암호가 새로이 변경되었습니다.<br/>
   		</div>
   </c:if>
   
</form>

    