<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
 
	jQuery(document).ready(function(){
    	
    }); // end of $(document).ready()---------------------------	 
    
    function goPwdCheck(){
    	
		var frm = document.RegistFrm;
    	
    	var pwd1val = $("#passwd").val();
    	var pwd2val = $("#passwd2").val();
   	
       	if(pwd1val != pwd2val){
       		alert("비밀번호가 일지하지 않습니다.");
       		$("#passwd2").val("");
       		$("#passwd2").focus();
       		return;
       	}
       	else if(pwd1val == pwd2val){
       		$("#name").focus();
       		return;
       	}
    	
    	
    }
    
    function idCheck(){
    	
    	var url = "idCheck.action?userid=${userid}";
    	window.open(url, "아이디 중복확인",
    			   "left=500px, top=100px, width=300px, height=100px");
    	
    }
    
</script>

<div style="width:auto; margin: auto; border: solid 0px red;">

	<div style="width:80%; margin-top:2%; margin-left:10%; height:200px; border: solid 0px blue;">
		<h2 class="text-primary">회원가입</h2>
		<p class="bg-primary">&nbsp;</p>
		
		<form name="RegistFrm">
			<div class="mydiv" style="margin-left: 15%;">
				<span style="font-size: 15pt;">아이디 : </span><button style="font-size: 11pt;" type="button" onClick="idCheck();">중복 확인</button><br/><input style="font-size: 15pt;" class="mydisplay form-control" type="text" name="userid" id="userid" size="20"/><br/>
				<span style="font-size: 15pt;" style="margin-top: 30px;">암&nbsp;&nbsp;&nbsp;호 : </span> <input class="mydisplay form-control" style="font-size: 15pt; margin-top: 15px;" type="password" name="passwd" id="passwd" size="20" /> 
				<span style="font-size: 15pt;" style="margin-top: 30px;">암호 확인 : </span><input class="mydisplay form-control" style="font-size: 15pt; margin-top: 15px;" type="password" name="passwd2" id="passwd2" size="20" /> <button style="font-size: 15pt;" type="button" onClick="goPwdCheck();">암호 확인</button><br/>
				<span style="font-size: 15pt;" style="margin-top: 30px;">이&nbsp;&nbsp;&nbsp;름 : </span><input class="mydisplay form-control" style="font-size: 15pt; margin-top: 15px;" type="text" name="name" id="name" size="20" /> 
				<span style="font-size: 15pt;" style="margin-top: 30px;">이메일 : </span><input class="mydisplay form-control" style="font-size: 15pt; margin-top: 15px;" type="text" name="name" id="name" size="20" /> 
				<span style="font-size: 15pt;" style="margin-top: 30px;">주&nbsp;&nbsp;&nbsp;소 : </span><input class="mydisplay form-control" style="margin-top: 15px;" type="text" name="addr1" id="addr1"/><input class="mydisplay form-control" style="margin-top: 15px;" type="text" name="addr2" id="addr2"/>
				<button class="btn btn-success" style="width: 100px; font-size: 14pt;" type="button" id="btnRegist" >회원가입</button> 
			</div>
				 
		</form>
	</div>
	
</div>
