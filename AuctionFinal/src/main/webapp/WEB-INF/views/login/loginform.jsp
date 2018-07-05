<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">

	.mydiv {display: inline-block; 
	        position: relative; 
	        top: 30px; 
	        line-height: 150%; 
	        border: solid 0px green;
	       }
	
	.mydisplay {display: block;}
	       	
	.myfont {font-size: 18pt;}
	
	.form-control{border: solid 1px gray;}
</style>

<script type="text/javascript">
 
	jQuery(document).ready(function(){
    	 $("#btnLOGIN").click(function() {
    		 func_Login(event);
    	 });
    	 
    	 $("#passwd").keydown(function(event){
    		 if(event.keyCode == 13){
    			 func_Login(event);
    		 }
    	 });
    	 
    	 $("#btnRegist").click(function(){
    		 func_Regist(event);
    	 });
    }); // end of $(document).ready()---------------------------	 

    function func_Regist(event){
    	var frm = document.RegistFrm;
    	frm.action = "/auction/memberRegist.action";
    	frm.method = "GET";
    	frm.submit();
    }
    
	function func_Login(event) {
    	if(${sessionScope.loginuser != null}) {
    		alert("이미 로그인 하신 상태입니다.");
    		$("#userid").val("");
    		$("#passwd").val("");
    		$("#userid").focus();
    		event.preventDefault();
    		return;
    	}
    	var userid = $("#userid").val();
    	var pwd = $("#passwd").val();
    	
    	if(userid.trim() == "") {
    		alert("아이디를 입력하세요");
    		$("#userid").val("");
    		$("#userid").focus();
    		event.preventDefault();
    		return;
    	}
    	if(pwd.trim() == "") {
    		alert("암호를 입력하세요");
    		$("#passwd").val("");
    		$("#passwd").focus();
    		event.preventDefault();
    		return;
    	}
    	var frm = document.loginFrm;
    	frm.action = "/auction/loginEnd.action";
    	frm.method = "post";
    	frm.submit();
    	
    }
</script>

<div style="width:90%; margin: auto; border: solid 0px red;">

	<div style="width:80%; margin-top:10%; margin-left:10%; height:300px; border: solid 0px blue;">
		<h2 class="text-primary">로그인</h2>
		<p class="bg-primary">&nbsp;</p>
		
		<form name="loginFrm">
			<div class="mydiv" style="margin-left: 15%;">
				<span class="mydisplay myfont" >아이디 :</span>
				<span class="mydisplay myfont" style="margin-top: 30px;">암&nbsp;&nbsp;&nbsp;호 :</span> 
			</div>
			
			<div class="mydiv" style="margin-left: 5%;">
				<input class="mydisplay form-control" type="text" name="userid" id="userid" size="20" style="font-size: 15px;" />
				<input class="mydisplay form-control" style="margin-top: 15px; font-size: 15px;" type="password" name="passwd" id="passwd" size="20" />
			</div>
			<div style="margin-top: 5%; margin-left: 30%;">
				<button class="btn btn-success" style="width: 100px; font-size: 14pt;" type="button" id="btnLOGIN" >확인</button> 
				<button class="btn btn-success" style="width: 100px; font-size: 14pt;" type="button" id="btnRegist" >회원가입</button> 
			</div>
			
		</form>
		
		<form name="RegistFrm">
		</form>
		
	</div>
	
</div>