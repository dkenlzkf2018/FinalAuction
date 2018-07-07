<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- Page level plugin styles START -->
<link href="assets/plugins/fancybox/source/jquery.fancybox.css" rel="stylesheet">
<link href="assets/plugins/owl.carousel/assets/owl.carousel.css" rel="stylesheet">
<link href="assets/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css">
<!-- Page level plugin styles END -->
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

<!-- <div style="width:90%; margin: auto; border: solid 0px red;">

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
	
</div> -->

<!-- BEGIN CHECKOUT -->
<div id="checkout" class="panel panel-default">
  <div class="panel-heading">
    <h2 class="panel-title">
      <a data-toggle="collapse" data-parent="#checkout-page" href="#checkout-content" class="accordion-toggle">
        Step 1: Checkout Options
      </a>
    </h2>
  </div>
  <div id="checkout-content" class="panel-collapse collapse in">
    <div class="panel-body row">
      <div class="col-md-6 col-sm-6">
        <h3>New Customer</h3>
        <p>Checkout Options:</p>
        <div class="radio-list">
          <label>
            <input type="radio" name="account"  value="register"> Register Account
          </label>
          <label>
            <input type="radio" name="account"  value="guest"> Guest Checkout
          </label> 
        </div>
        <p>By creating an account you will be able to shop faster, be up to date on an order's status, and keep track of the orders you have previously made.</p>
        <button class="btn btn-primary" type="submit" data-toggle="collapse" data-parent="#checkout-page" data-target="#payment-address-content">Continue</button>
      </div>
      <div class="col-md-6 col-sm-6">
        <h3>Returning Customer</h3>
        <p>I am a returning customer.</p>
        <form role="form" action="#">
          <div class="form-group">
            <label for="email-login">E-Mail</label>
            <input type="text" id="email-login" class="form-control">
          </div>
          <div class="form-group">
            <label for="password-login">Password</label>
            <input type="password" id="password-login" class="form-control">
          </div>
          <a href="javascript:;">Forgotten Password?</a>
          <div class="padding-top-20">                  
            <button class="btn btn-primary" type="submit">Login</button>
          </div>
          <hr>
          <div class="login-socio">
            <p class="text-muted">or login using:</p>
            <ul class="social-icons">
              <li><a href="javascript:;" data-original-title="facebook" class="facebook" title="facebook"></a></li>
              <li><a href="javascript:;" data-original-title="Twitter" class="twitter" title="Twitter"></a></li>
              <li><a href="javascript:;" data-original-title="Google Plus" class="googleplus" title="Google Plus"></a></li>
              <li><a href="javascript:;" data-original-title="Linkedin" class="linkedin" title="LinkedIn"></a></li>
            </ul>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<!-- END CHECKOUT -->