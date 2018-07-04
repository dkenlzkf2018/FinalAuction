<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
 
	jQuery(document).ready(function(){
    		
	}); // end of $(document).ready()---------------------------	 
    
    function goPwdCheck(){
    	
		var frm = document.RegistFrm;
    	
    	var pwd1val = $("#password").val();
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

<!-- <div style="width:auto; margin: auto; border: solid 0px red;">

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
	
</div> -->
<div class="main">
      <div class="container">
        <ul class="breadcrumb">
            <li><a href="index.html">Home</a></li>
            <li><a href="">Store</a></li>
            <li class="active">Standart forms</li>
        </ul>
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
          <!-- BEGIN SIDEBAR -->
          <div class="sidebar col-md-3 col-sm-5">
            <ul class="list-group margin-bottom-25 sidebar-menu">
              <li class="list-group-item clearfix"><a href="shop-product-list.html"><i class="fa fa-angle-right"></i> Ladies</a></li>
              <li class="list-group-item clearfix"><a href="shop-product-list.html"><i class="fa fa-angle-right"></i> Kids</a></li>
              <li class="list-group-item clearfix"><a href="shop-product-list.html"><i class="fa fa-angle-right"></i> Accessories</a></li>
              <li class="list-group-item clearfix"><a href="shop-product-list.html"><i class="fa fa-angle-right"></i> Sports</a></li>
              <li class="list-group-item clearfix"><a href="shop-product-list.html"><i class="fa fa-angle-right"></i> Brands</a></li>
              <li class="list-group-item clearfix"><a href="shop-product-list.html"><i class="fa fa-angle-right"></i> Electronics</a></li>
              <li class="list-group-item clearfix"><a href="shop-product-list.html"><i class="fa fa-angle-right"></i> Home &amp; Garden</a></li>
              <li class="list-group-item clearfix"><a href="shop-product-list.html"><i class="fa fa-angle-right"></i> Custom Link</a></li>
            </ul>
          </div>
          <!-- END SIDEBAR -->

          <!-- BEGIN CONTENT -->
          <div class="col-md-9 col-sm-7">
            <h1>회원 가입</h1>
            <div class="content-form-page">
              <form role="form" class="form-horizontal form-without-legend">
                <div class="form-group">
                  <label class="col-lg-2 control-label" for="userid">아이디 <span class="require">*</span></label>
                  <div class="col-lg-6">
                    <input type="text" id="userid" name="userid" class="form-control">
                  </div>
                  <a class="col-lg-2 btn btn-default" onClick="idCheck();">중복 확인</a>
                </div>
                <div class="form-group">
                  <label class="col-lg-2 control-label" for="password">비밀번호 <span class="require">*</span></label>
                  <div class="col-lg-8">
                    <input type="text" id="password" name="password" class="form-control">
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-lg-2 control-label" for="passwd2">비밀번호 확인 <span class="require">*</span></label>
                  <div class="col-lg-8">
                    <input type="text" id="passwd2" class="form-control">
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-lg-2 control-label" for="name">성명 <span class="require">*</span></label>
                  <div class="col-lg-8">
                    <input type="text" id="name" name="name" class="form-control">
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-lg-2 control-label" for="email">E-Mail <span class="require">*</span></label>
                  <div class="col-lg-8">
                    <input type="text" id="email" class="form-control">
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-lg-2 control-label" for="telephone">Telephone <span class="require">*</span></label>
                  <div class="col-lg-8">
                    <input type="text" id="telephone" class="form-control">
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-lg-2 control-label" for="fax">Fax</label>
                  <div class="col-lg-8">
                    <input type="text" id="fax" class="form-control">
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-lg-2 control-label">File input</label>
                  <div class="col-lg-8">
                    <input type="file">
                    <p class="help-block">some help text here.</p>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-lg-2 control-label" for="message">Message</label>
                  <div class="col-lg-8">
                    <textarea class="form-control" rows="6"></textarea>
                  </div>
                </div>
                <div class="row">
                  <div class="col-lg-8 col-md-offset-2 padding-left-0 padding-top-20">
                    <button class="btn btn-primary" type="submit">Continue</button>
                  </div>
                </div>
              </form>
            </div>
          </div>
          <!-- END CONTENT -->
        </div>
        <!-- END SIDEBAR & CONTENT -->
      </div>
    </div>
