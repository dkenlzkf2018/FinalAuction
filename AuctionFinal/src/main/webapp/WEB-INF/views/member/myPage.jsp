<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">

	jQuery(document).ready(function(){
		
		$("#myPageFrm").hide();
		$("#MyJoinListFrm").hide();
		$("#plusCoinFrm").hide();
		$("#MyAuctionListFrm").hide();
	});
	
	function goMyInfo() {
		
		$("#myInfo").hide();
		$("#myjoinList").hide();
		$("#plusCoinFrm").hide();
		$("#plusCoin").hide();
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
		$("#plusCoinFrm").hide();
		$("#plusCoin").hide();
		$("#MyJoinListFrm").show();
		
		
		frm.action="myJoinList.action"
		frm.method="get";
		frm.submit();
		
	}
	
	function goPlusCoin(usernum) {
		// 팝업창 띄우기
		var url="coinPurchaseTypeChoice.action?usernum="+usernum;
		
		window.open(url, "coinPurchaseTypeChoice",
				    "left=350px, top=100px, width=650px, height=570px");
	}
	
	function goCoinPurchaseEnd(usernum, coinmoney) {	
		// 팝업창 띄우기
		var url="coinPurchase.action?usernum="+usernum+"&coinmoney="+coinmoney;
		
		window.open(url, "coinPurchase",
				    "left=350px, top=100px, width=820px, height=600px");
	}// end of goCoinPurchase()---------------------

	function goCoinUpdate(usernum, coinmoney) {
		var frm = document.coinUpdateForm;
		frm.usernum.value = usernum;
	//	frm.coinmoney.value = coinmoney;
		
		frm.method = "POST";
		frm.action = "auctionPay.action";
		frm.submit();
	}
	// === Payment Gateway(결제) 관련 끝 === //
	
	function goMyauctionList(){
		
		$("#myInfo").hide();
		$("#myPageFrm").hide();
		$("#plusCoinFrm").hide();
		$("#plusCoin").hide();
		$("#MyJoinListFrm").hide();
		
		var frm = document.MyAuctionListFrm;
		
		frm.method = "get";
		frm.action = "auctionList.action";
		frm.submit();
		
	}
	
</script>

<h1 align="center"><span style="color: blue; font-weight: bold;">${sessionScope.loginuser.username}</span>님의 페이지</h1>
<h4 align="center">판매등급 : ${sessionScope.loginuser.grade}</h4>
<h4 align="center">보유코인 : <span style="color: pink; font-weight: bold;"><strong><fmt:formatNumber value="${sessionScope.loginuser.coin}" type="number"/></strong></span>&nbsp;POINT</h4>

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
</form>

<form name="MyAuctionListFrm" id="MyAuctionListFrm">
</form>

<form name="plusCoinFrm" id="plusCoinFrm">
</form>

<form name="InfoFrm" method="post">
	<div align="center" style="margin-bottom: 20px;">
		<button type="button" class="btn btn-default" id="myInfo" onClick="goMyInfo();">내 정보 보기</button>
		<button type="button" class="btn btn-default" id="myjoinList" onClick="goMyJoinList();">내 입찰목록</button>
		<button type="button" class="btn btn-default" id="myauctionList" onClick="goMyauctionList();">내 경매 등록 목록</button>
		<button type="button" class="btn btn-default" id="plusCoin" onClick="goPlusCoin(${sessionScope.loginuser.usernum});">코인 충전하기</button>
	</div>
</form>

<form name="coinUpdateForm">
   <input type="hidden" name="usernum" >
   <!-- <input type="hidden" name="coinmoney" > -->
</form>


	

