<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
 
   jQuery(document).ready(function(){
      
   }); // end of $(document).ready()---------------------------    
    
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
          
          frm.action="myInfoEditEnd.action";
          frm.method="post";
          frm.submit();
          
          self.window.close();
          
          javascript:history.back();
      }
      
      window.location.reload();
      
    }
    
    function goZipcodeSerch() {
   
        window.open("", "ZipcodeSerch",
                 "left=600px, top=300px, width=1100px, height=600px");
               
        var frm = document.RegistFrm;
        
        frm.target = "ZipcodeSerch";
        
        frm.action="ZipcodeSerchEdit.action";
        frm.method="post";
        frm.submit();
    	
    }
    
</script>

<div class="main">
      <div class="container">
        <ul class="breadcrumb">
            <li><a href="index.action">Home</a></li>
            <li><a href="myPage.action">myPage</a></li>
            <li class="active">정보수정</li>
        </ul>
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">          
          <!-- BEGIN CONTENT -->
          <div class="col-md-9 col-sm-7">
            <h1><span style="color: blue; font-weight: bold;">${sessionScope.loginuser.username}</span>님의 정보 수정</h1>
            <div class="content-form-page">
              <form name="RegistFrm" role="form" class="form-horizontal form-without-legend" method="post">
                <div class="form-group">
                  <label class="col-lg-2 control-label" for="userid">아이디 <span class="require">*</span></label>
                  <div class="col-lg-6">
                    <input type="text" id="userid" name="userid" class="form-control requiredInfo" value="${sessionScope.loginuser.userid}" required/>
                  </div>
                </div> 
                <div class="form-group">
                  <label class="col-lg-2 control-label" for="name">성명 <span class="require">*</span></label>
                  <div class="col-lg-5">
                    <input type="text" id="name" name="name" class="form-control requiredInfo" value="${sessionScope.loginuser.username}" required/>
                  </div>
                </div>   
                <div class="form-group">
                  <label class="col-lg-2 control-label" for="birth">생년월일 <span class="require">*</span></label>
                  <div class="col-lg-8">
                    <input type="text" id="birth" name="birth" class="form-control requiredInfo" value="${sessionScope.loginuser.birth}"/>
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
                </div>
              </form>
              <div class="row">
                <div class="col-lg-8 col-md-offset-2 padding-left-0 padding-top-20">
                  <button class="btn btn-default" type="button" id="btnRegister" onClick="goRegist();">수정하기</button>
                  <button class="btn btn-primary" type="button" onClick="location.href='<%=request.getContextPath()%>/myPage.action';">돌아가기</button>
                </div>
              </div>
            </div>
          </div>
          <!-- END CONTENT -->
        </div>
        <!-- END SIDEBAR & CONTENT -->
      </div>
    </div>