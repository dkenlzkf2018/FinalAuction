<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">

	jQuery(document).ready(function(){
		
		$("#myPageFrm").hide();
		$("#MyJoinListFrm").hide();
	});
	
	function goMyInfo() {
		
		$("#myInfo").hide();
		$("#MyJoinListFrm").hide();
		$("#myPageFrm").show();
		
	}
	
	
	function goEdit(){
		
		var frm = document.myPageFrm;
		
		frm.action="myInfoEdit.action";
		frm.method="post";
		frm.submit();
		
	}
	
	function goMyJoinList() {
		
		var frm = document.MyJoinListFrm;
				
		$("#myInfo").hide();
		$("#myPageFrm").hide();
		$("#MyJoinListFrm").show();
		
		frm.action="myJoinList.action"
		frm.method="get";
		frm.submit();
		
	}

</script>

<h1 align="center"><span style="color: blue; font-weight: bold;">${sessionScope.loginuser.username}</span>님의 페이지</h1>
<form name="myPageFrm" id="myPageFrm" method="post">
	
	<div class="main" align="center" style="margin-top: 50px;">
      <div class="container">
          <div>
            <h3><span style="color: blue; font-weight: bold;">${sessionScope.loginuser.username}</span>님의 정보</h3>
            <div class="content-form-page">
                <div class="form-group">
                  <label class="control-label" for="userid">아이디 : ${sessionScope.loginuser.userid}</label><br/>
                
                  <label class="control-label" for="name">성명 : ${sessionScope.loginuser.username}</label><br/>
                
                  <label class="control-label" for="birth">생년월일 : ${sessionScope.loginuser.birth}</label><br/>
                
                  <label class="control-label" for="email">E-Mail : ${sessionScope.loginuser.email}</label><br/>
               
                  <label class="control-label" for="telephone">전화번호 : ${sessionScope.loginuser.hp1} - ${sessionScope.loginuser.hp2} - ${sessionScope.loginuser.hp3}</label><br/>
                
                  <label class="control-label" for="address">주소 : ${sessionScope.loginuser.addr1} ${sessionScope.loginuser.addr2}</label><br/>
                </div>
            </div>
          </div>
          
          <div class="row" align="center">
                <div class="col-lg-8 col-md-offset-2 padding-left-0 padding-top-20">
                  <button class="btn btn-primary" type="button" id="btnRegister" onClick="goEdit();">정보수정</button>
                  <button class="btn btn-default" type="button" onClick="location.href='<%=request.getContextPath()%>/myPage.action';">돌아가기</button>
                </div>
          </div>
      </div>
    </div>
 
</form>

<form name="MyJoinListFrm" id="MyJoinListFrm">
		<div class="main" align="center" style="margin-top: 50px;">
      <div class="container">
          <div>
            <h3><span style="color: blue; font-weight: bold;">${sessionScope.loginuser.username}</span>님의 입찰정보</h3>
            <table id="JoinList" name="JoinList">
            	<thead>
					<tr align="center">
						<th style="width: 90px; text-align: center;">입찰물품 번호</th>
						<th style="width: 90px; text-align: center;">경매번호</th>
						<th style="width: 210px; text-align: center;">입찰금액</th>
						<th style="width: 270px; text-align: center;">입찰 날짜</th>
						<th style="width: 270px; text-align: center;">경매 마감 날짜</th>						
					</tr>
				</thead>
				<tbody>
					<c:if test="${JoinList == null}">					
						<tr>
							<th colspan="5"><div align="center"><span style="color: red; text-align: center;">목록이 없습니다.</span></div></th>
						</tr>
					</c:if>
					<c:if test="${JoinList != null}">
						<c:forEach var="list" items="${JoinList}">
							<tr>
								<td align="center">
									${JoinList.joinactnum}
								</td>
								
								<td align="center">		
									${JoinList.fk_actnum}						
								</td>
								
								<td align="center">
									${JoinList.tenderprice}
								</td>
								
								<td align="center">
									${JoinList.tenderday}
								</td>
								
								<td align="center">
									${JoinList.actd_endday}
								</td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
            </table>
          </div>
          <input type="hidden" id="usernum" name="usernum" value="${sessionScope.loginuser.usernum}" />
          <div class="row" align="center">
                <div class="col-lg-8 col-md-offset-2 padding-left-0 padding-top-20">
                  <button class="btn btn-default" type="button" onClick="location.href='<%=request.getContextPath()%>/myPage.action';">돌아가기</button>
                </div>
          </div>
      </div>
    </div>
</form>

<form name="InfoFrm" method="post">
	<div align="center" style="margin-bottom: 20px;">
		<button type="button" class="btn btn-default" id="myInfo" onClick="goMyInfo();">내 정보 보기</button>
		<button type="button" class="btn btn-default" id="myjoinList" onClick="goMyJoinList();">내 입찰목록</button>
	</div>
</form>



	

