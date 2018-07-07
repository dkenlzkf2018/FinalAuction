<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- Page level plugin styles START -->
<link href="<%=request.getContextPath() %>/resources/assets/plugins/owl.carousel/assets/owl.carousel.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/resources/assets/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css">
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
    	frm.action = "loginEnd.action";
    	frm.method = "post";
    	frm.submit();
    	
    }

	function func_Regist(event){
    	/* var frm = document.RegistFrm;
    	frm.action = "/auction/memberRegist.action";
    	frm.method = "GET";
    	frm.submit(); */
    	location.href = "<%=request.getContextPath()%>/memberRegist.action";
    }
	
	function gofindPwd(){
		
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
	</div>
	
</div> -->

<!-- BEGIN CHECKOUT -->
<div class="container">
	<div id="checkout-content" class="panel-collapse collapse in">
	  <div class="panel-body row">
	    <div class="col-md-6 col-sm-6 offset-md-3 offset-sm-3">
	      <h3>로그인</h3>
	      <p>Super Auction을 이용해주셔서 감사합니다.</p>
	      <form role="form" name="loginFrm">
	        <div class="form-group">
	          <label for="email-login">아이디</label>
	          <input type="text" name="userid" id="userid" class="form-control"/>
	        </div>
	        <div class="form-group">
	          <label for="password-login">비밀번호</label>
	          <input type="password" name="passwd" id="passwd" class="form-control"/>
	        </div>
	        <a href="javascript:javascript:gofindPwd();">Forgotten Password?</a>
	        <div class="padding-top-20">                  
	          <button class="btn btn-default" type="button" id="btnLOGIN">로그인</button>
	          <button class="btn btn-primary" type="button" id="btnRegist">회원가입</button>
	        </div>
	        <hr>
	      </form>
	    </div>
	  </div>
	</div>
</div>
<!-- END CHECKOUT -->
<!-- BEGIN PAGE LEVEL JAVASCRIPTS (REQUIRED ONLY FOR CURRENT PAGE) -->
<script src="<%=request.getContextPath() %>/resources/assets/plugins/owl.carousel/owl.carousel.min.js" type="text/javascript"></script><!-- slider for products -->
<script src='<%=request.getContextPath() %>/resources/assets/plugins/zoom/jquery.zoom.min.js' type="text/javascript"></script><!-- product zoom -->
<script src="<%=request.getContextPath() %>/resources/assets/plugins/bootstrap-touchspin/bootstrap.touchspin.js" type="text/javascript"></script><!-- Quantity -->
<script src="<%=request.getContextPath() %>/resources/assets/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>

<script src="<%=request.getContextPath() %>/resources/assets/corporate/scripts/layout.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/resources/assets/pages/scripts/checkout.js" type="text/javascript"></script>
<script type="text/javascript">
    jQuery(document).ready(function() {
        Layout.init();    
        Layout.initOWL();
        Layout.initTwitter();
        Layout.initImageZoom();
        Layout.initTouchspin();
        Layout.initUniform();
        Checkout.init();
    });
</script>
<!-- END PAGE LEVEL JAVASCRIPTS -->