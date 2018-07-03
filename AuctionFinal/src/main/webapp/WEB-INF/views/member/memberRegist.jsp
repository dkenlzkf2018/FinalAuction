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
	       	
	.myfont {font-size: 14pt;}
	
</style>

<script type="text/javascript">
 
    $(document).ready(function(){
    	
    }); // end of $(document).ready()---------------------------	 
    
</script>

<div style="width:90%; margin: auto; border: solid 0px red;">

	<div style="width:80%; margin-top:10%; margin-left:10%; height:300px; border: solid 0px blue;">
		<h2 class="text-primary">회원가입</h2>
		<p class="bg-primary">&nbsp;</p>
		
		<form name="RegistFrm">
			<div class="mydiv" style="margin-left: 15%;">
				<span class="mydisplay myfont" >아이디 :</span>
				<span class="mydisplay myfont" style="margin-top: 30px;">암&nbsp;&nbsp;&nbsp;호 :</span> 
				<span class="mydisplay myfont" style="margin-top: 30px;">암호 확인 :</span>
				<span class="mydisplay myfont" style="margin-top: 30px;">이&nbsp;&nbsp;&nbsp;름 :</span> 
			</div>
			
			<div class="mydiv" style="margin-left: 5%;">
				<input class="mydisplay form-control" type="text" name="userid" id="userid" size="20" />
				<input class="mydisplay form-control" style="margin-top: 15px;" type="password" name="passwd" id="passwd" size="20" /> 
				<input class="mydisplay form-control" style="margin-top: 15px;" type="password" name="passwd2" id="passwd2" size="20" /> 
				<input class="mydisplay form-control" style="margin-top: 15px;" type="text" name="name" id="name" size="20" />
			</div>
			
			<div class="mydiv" style="margin-left: 10%;">
				<button class="btn btn-success" style="width: 100px; font-size: 14pt;" type="button" id="btnRegist" >회원가입</button> 
			</div>	 
		</form>
	</div>
	
</div>
