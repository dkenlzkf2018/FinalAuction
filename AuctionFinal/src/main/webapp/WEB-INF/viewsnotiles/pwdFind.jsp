<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
</head>
<script type="text/javascript">
	JQuery(document).ready(function(){
			
		$("#btnFind").click(function(){
			var frm = document.pwdFindFrm;
			frm.method = "post";
			frm.action = "<%= request.getContextPath() %>/pwdFind.action";
			frm.submit();
		});
		
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
		}
		else if(method=="POST" && (n == -1 || n == 0)) {
			$("#div_btnFind").show();
		}		
		
		$("#btnConfirmCode").click(function(){
			if( $("#input_confirmCode").val() == "${certificationCode}" ) {
				alert("인증성공 되었습니다.");
				
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
			
		});
		
		
	});
	
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
   	      	 <button type="button" class="btn btn-info" id="btnConfirmCode">인증하기</button>    
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
   		<button type="button" class="btn btn-success" id="btnFind">찾기</button>
   </div>
   
</form>