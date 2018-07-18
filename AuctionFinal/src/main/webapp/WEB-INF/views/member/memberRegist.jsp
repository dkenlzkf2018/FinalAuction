<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
 
   jQuery(document).ready(function(){
      
      $("#error_passwd").hide();
      $("#error").hide();
      
      $("#password").blur(function(event){
         var pwd1 = $("#password").val().trim();
         var pwd2 = $("#passwd2").val().trim();
         
         var regexp_passwd = new RegExp(/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g);
         
         var bool = regexp_passwd.test(pwd1);
         
         if(pwd1 == ""){
            alert("비밀번호를 입력하세요");
         }
         
         if(!bool){
            $("#error_passwd").show();
            $(":input").attr("disabled",true).addClass("bgcol");
            $("#btnRegister").attr("disabled",true); 
            $(this).attr("disabled",false).removeClass("bgcol");         
         }
         else{
            $("#error_passwd").hide();
            $(":input").attr("disabled",false).removeClass("bgcol");
            $("#btnRegister").attr("disabled",false); 
            $("#passwd2").focus();
         }
      
      });// end of $("#loginPwd").keydown()----------
      
      $("#passwd2").blur(function(event){
         var pwd1 = $("#password").val().trim();
         var pwd2 = $("#passwd2").val().trim();
         
         
         if(pwd1 != pwd2){
            $("#error").show();
            $(":input").attr("disabled",true).addClass("bgcol");
            $("#btnRegister").attr("disabled",true);
            $(this).attr("disabled",false).removeClass("bgcol");
         }
         else if(pwd1 == pwd2){
            $("#error").hide();
            $(":input").attr("disabled",false).removeClass("bgcol");
            $("#btnRegister").attr("disabled",false);
            $("#name").focus();
         }
      });// end of $("#loginPwd").keydown()----------
      
      
      
   }); // end of $(document).ready()---------------------------    
    
    function idCheck(){
       
       var userid = $("#userid").val();
       
       var url = "idCheck.action?userid="+userid;
       window.open("", "idCheck",
                "left=500px, top=100px, width=300px, height=100px");
       
       var frm = document.RegistFrm;
       
       frm.target = "idCheck";
       
       frm.action="idCheck.action";
       frm.method="get";
       frm.submit();
       
    }
    /* <span id="error_passwd">암호는 영문자,숫자,특수기호가 혼합된 8~15 글자로만 입력가능합니다.</span> 
        <span class="error">암호가 일치하지 않습니다.</span>
    */
    function goRegist() {
       
      var flagBool = false;
      
      $(".requiredInfo").each(function(){
         var data = $(this).val().trim();
         if(data == "") {
            flagBool = true;
            return false;
            /*
               for문에서의 continue; 와 동일한 기능을 하는것이 
               each(); 내에서는 return true; 이고,
               for문에서의 break; 와 동일한 기능을 하는것이 
               each(); 내에서는 return false; 이다.
            */
         }
      });
      
      if(flagBool) {
         alert("필수입력란은 모두 입력하셔야 합니다.");
         event.preventDefault(); // click event 를 작동치 못하도록 한다.
         return;
      }      
      else {
         var frm = document.RegistFrm;
          
          frm.action="memberRegistEnd.action";
          frm.method="post";
          frm.submit();
      }
    }
    
    function goZipcodeSerch() {
    	
    	var url = "ZipcodeSerch.action";
    	
        window.open("", "ZipcodeSerch",
                 "left=600px, top=300px, width=1100px, height=600px");
               
        var frm = document.RegistFrm;
        
        frm.target = "ZipcodeSerch";
        
        frm.action="ZipcodeSerch.action";
        frm.method="post";
        frm.submit();
    	
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
            <li><a href="index.action">Home</a></li>
            <li><a href="login.action">Log in</a></li>
            <li class="active">회원가입</li>
        </ul>
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">          
          <!-- BEGIN CONTENT -->
          <div class="col-md-9 col-sm-7">
            <h1>회원 가입</h1>
            <div class="content-form-page">
              <form name="RegistFrm" role="form" class="form-horizontal form-without-legend">
                <div class="form-group">
                  <label class="col-lg-2 control-label" for="userid">아이디 <span class="require">*</span></label>
                  <div class="col-lg-6">
                    <input type="text" id="userid" name="userid" class="form-control requiredInfo" value="${userid}" required/>
                  </div>
                  <button class="col-lg-2 btn btn-default" type="button" onClick="idCheck();">중복 확인</button>
                </div>
                <div class="form-group">
                  <label class="col-lg-2 control-label" for="password">비밀번호 <span class="require">*</span></label>
                  <div class="col-lg-8">
                    <input type="password" id="password" name="password" class="form-control requiredInfo" required/>
                    <span id="error_passwd" style="color: red;">암호는 영문자,숫자,특수기호가 혼합된 8~15 글자로만 입력가능합니다.</span>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-lg-2 control-label" for="passwd2">비밀번호 확인 <span class="require">*</span></label>
                  <div class="col-lg-8">
                    <input type="password" name="passwd2" id="passwd2" class="form-control requiredInfo" required/>
                    <span id="error" name="error" style="color: red;">암호가 일치하지 않습니다.</span>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-lg-2 control-label" for="name">성명 <span class="require">*</span></label>
                  <div class="col-lg-5">
                    <input type="text" id="name" name="name" class="form-control requiredInfo" required/>
                  </div>
                  <div class="col-lg-3">
                    <select class="form-control" name="gender" id="gender">
                  <option value="-1">성별 선택</option>
                  <option value="남자">남자</option>
                  <option value="여자">여자</option>                  
               </select>
              </div>
                </div>
                <div class="form-group">
                  <label class="col-lg-2 control-label" for="birth">생년월일 <span class="require">*</span></label>
                  <div class="col-lg-8">
                    <input type="date" id="birth" name="birth" class="form-control requiredInfo"/>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-lg-2 control-label" for="email">E-Mail <span class="require">*</span></label>
                  <div class="col-lg-3">
                    <input type="text" name="email1" id="email1" class="form-control requiredInfo"/>
                  </div>
                  <div class="col-lg-5">
                    <select class="form-control" name="email2" id="email2">
                  <option value="naver.com">naver.com</option>
                  <option value="hanmail.net">hanmail.net</option>
                  <option value="gmail.com">gmail.com</option>
                  <option value="nate.com">nate.com</option>                  
               </select>
              </div>
                </div>
                <div class="form-group">
                  <label class="col-lg-2 control-label" for="telephone">전화번호<span class="require">*</span></label>
                  <div class="col-lg-2">
                     <select class="form-control requiredInfo" name="hp1" id="hp1">
                  <option value="010">010</option>
                  <option value="011">011</option>
                  <option value="016">016</option>
                  <option value="017">017</option>
                  <option value="018">018</option>
                  <option value="019">019</option>
               </select>
                  </div>
                  <div class="col-lg-3">
                    <input type="text" name="hp2" id="hp2" class="form-control" size="4" maxlength="4"/>
                  </div>
                  <div class="col-lg-3">
                    <input type="text" name="hp3" id="hp3" class="form-control" size="4" maxlength="4"/>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-lg-2 control-label" for="zipcode">우편번호</label>
                  <div class="col-lg-5">
                    <input type="text" name="zipcode" id="zipcode" class="form-control" value="${zipcode}"/>
                  </div>
                  <button class="col-lg-2 btn btn-default" type="button" onClick="goZipcodeSerch();">우편 번호 찾기</button>
                </div>
                <div class="form-group">
                  <label class="col-lg-2 control-label" for="address">주소</label>
                  <div class="col-lg-8">
                      <input type="text" name="addr1" id="addr1" class="form-control" value="${addr1}"/><br/>
                      <input type="text" name="addr2" id="addr2" class="form-control"/>
                  </div>
                </div>
              </form>
              <div class="row">
                <div class="col-lg-8 col-md-offset-2 padding-left-0 padding-top-20">
                  <button class="btn btn-primary" type="button" id="btnRegister" onClick="goRegist();">가입하기</button>
                  <button class="btn btn-default" type="button" onClick="location.href='<%=request.getContextPath()%>/index.action';">메인으로</button>
                </div>
              </div>
            </div>
          </div>
          <!-- END CONTENT -->
        </div>
        <!-- END SIDEBAR & CONTENT -->
      </div>
    </div>