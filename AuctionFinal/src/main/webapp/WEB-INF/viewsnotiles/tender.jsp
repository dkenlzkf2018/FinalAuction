<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<html class="no-js" lang=""> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Sufee Admin - HTML5 Admin Template</title>
    <meta name="description" content="Sufee Admin - HTML5 Admin Template">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <link rel="apple-touch-icon" href="apple-icon.png">
    <link rel="shortcut icon" href="favicon.ico">

    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/assets-admin/css/normalize.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/assets-admin/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/assets-admin/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/assets-admin/css/themify-icons.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/assets-admin/css/flag-icon.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/assets-admin/css/cs-skin-elastic.css">
    <!-- <link rel="stylesheet" href="assets/css/bootstrap-select.less"> -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/assets-admin/scss/style.css">

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>

    <!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->
    

   
    

    

</head>

<body>
	
	
    <div id="right-panel" class="right-panel">
	
        <div class="content mt-3">
            <div class="animated fadeIn">

				
                <div class="row">
                  <div class="col-lg-6">
                    <div class="card">
                        <div class="card-header">
                            <strong class="card-title">경매 입찰</strong>
                        </div>
                        <div class="card-body">
                          <!-- Credit Card -->
                          <div id="pay-invoice">
                              <div class="card-body">
                                  <div class="card-title">
                                      <h3 class="text-left">입찰 상품</h3>
                                  </div>
                                  <hr>                               
                                      <div class="form-group text-center">
                                          <ul class="list-inline">
                                              <%-- 이곳에 입찰되는 상품이미지를 넣는다. --%>
                                          </ul>
                                      </div>
                                      <div class="form-group">
                                          <label for="cc-payment" class="control-label mb-1">상품명</label>
                                          <input id="actname" name="actname" type="text" class="form-control" aria-required="true" aria-invalid="false" value="${map.actname}" readonly />
                                      </div>
                                      <div class="form-group has-success">
                                          <label for="cc-name" class="control-label mb-1">경매마감일자</label>
                                          <input id="endday" name="endday" type="text" class="form-control cc-name valid" value="${map.actd_endday}" data-val="true" data-val-required="Please enter the name on card" autocomplete="cc-name" aria-required="true" aria-invalid="false" aria-describedby="cc-name-error" readonly />
                                          <span class="help-block field-validation-valid" data-valmsg-for="cc-name" data-valmsg-replace="true"></span>
                                      </div>
                                      <div class="form-group">
                                          <label for="cc-number" class="control-label mb-1">최대구매가능 수량</label>
                                          <input id="qty" name="qty" type="tel" class="form-control cc-number identified visa" value="${map.actd_qty}" data-val="true" data-val-required="Please enter the card number" data-val-cc-number="Please enter a valid card number" autocomplete="cc-number" readonly />
                                          <span class="help-block" data-valmsg-for="cc-number" data-valmsg-replace="true"></span>
                                      </div>

	                              </div>
	                          </div>

                        </div>
                        <form name="inputTenderFrm">
                        <div class="card-body">
                          <!-- Credit Card -->
                          <div id="pay-invoice">
                              <div class="card-body">
                                  <div class="card-title">
                                      <h3 class="text-left">입찰 하기</h3>
                                  </div>
                                  <hr>
                                  
                                      <div class="form-group">
                                          <label for="cc-payment" class="control-label mb-1">현재가</label>
                                          <input style="color:red;" id="nowprice" name="nowprice" type="text" class="form-control" aria-required="true" aria-invalid="false" value="${nowprice}" readonly />
                                      </div>
                                      <div class="form-group has-success">
                                          <label for="cc-name" class="control-label mb-1">입찰 수량</label>
                                          <input id="inputqty" name="inputqty" type="text" class="form-control cc-name valid" value="${map.actd_qty}" data-val="true" data-val-required="Please enter the name on card" autocomplete="cc-name" aria-required="true" aria-invalid="false" aria-describedby="cc-name-error" />
                                          <span class="help-block field-validation-valid" data-valmsg-for="cc-name" data-valmsg-replace="true"></span>
                                      </div>
                                      <div class="form-group">
                                          <label for="cc-number" class="control-label mb-1">입찰 금액(<span style="color:red;">현재 <fmt:formatNumber value="${nowprice + 1000}" type="number"/>원</span> 부터 입찰하실 수 있습니다.)</label>
                                          <input id="tenderprice" name="tenderprice" type="text" />
                                                                                    원 (콤마','없이 100원 단위로 입력하세요.)
                                          <span class="help-block" data-valmsg-for="cc-number" data-valmsg-replace="true"></span>
                                      </div>
                                      <button id="payment-button" type="button" class="btn btn-lg btn-info btn-block" >
                                              <i class="fa fa-lock fa-lg"></i>&nbsp;
                                              <span id="payment-button-amount">입찰하기</span>
                                              <span id="payment-button-sending" style="display:none;">Sending…</span>
                                      </button>
                                      <input type="hidden" name="actnum" value="${map.actnum}">
                                          <%-- <button type="button" onclick="goInput('#tenderprice')">입찰하기</button> --%>
                                      
                                  
                              </div>
                          </div>

                        </div>
                        </form>
                        
                    </div> <!-- .card -->

                  </div><!--/.col-->

                  </div>
                  
                  </div>
                  
                  </div>
                  </div>

 


    
	
	<script src="<%=request.getContextPath() %>/resources/assets-admin/js/vendor/jquery-2.1.4.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/assets-admin/js/popper.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/assets-admin/js/plugins.js"></script>
    <script src="<%=request.getContextPath() %>/resources/assets-admin/js/main.js"></script>

    <script type="text/javascript">

	jQuery(document).ready(function () {
		jQuery("#payment-button").click(function(){
			var startprice = Number("${map.startprice}");	// 시작가격
			var priceCtrl = jQuery("#tenderprice").val();	// 입찰가격 (입력값)
			var endprice = Number("${map.actd_price}");		// 구매가격
			var qtyCtrl = jQuery("#qty").val();				// 수량 입력값
			var startQty = Number("${map.actd_qty}");		// 초기 수량 입력값
			var nowprice = Number("${nowprice}");			// 현재가
			var raw = 1000;
			
			
			// 숫자외에 다른 문자를 입력하였을 경우
			var regExp = /^[0-9]+$/;
			for (var i=0; i<priceCtrl.length; i++) {
				if (priceCtrl.charAt(i) != " " && regExp.test(priceCtrl.charAt(i)) == false) {
					alert("숫자만 입력하세요");
					document.inputTenderFrm.tenderprice.focus();
					return false;
				}
			}
			
			// 입찰 값이 비었을 경우
			if (priceCtrl.trim() == "") {
				alert("입찰금액을 입력해주십시오");
				return false;
			}
			
			
			var price = 0;
			// 입찰값이 있다면 price에 집어넣고
			// 아니면 시작가격을 올린다.
			if (priceCtrl) {
				price = priceCtrl;
			}
			else {
				price = nowprice;
			}
			price = Number(price);
			
			
			/* // 수량
			var qty = 0;
			if (priceCtrl) {
				qty = priceCtrl.value;
			}
			else {
				qty = startQty;
			}
			qty = Covert.stringToNumber(qty); */
			
			
			
			// 시작가격보다 입찰가격이 낮은 경우
			if (price < startprice) {
				alert("입찰 금액은 시작가격(1000원) 이상이어야 합니다. 다시 입력하여 주십시오.");
				return false;
			}
			if (price < nowprice) {
				alert("입찰 금액은 현재가 + 1000원 이상이어야 합니다. 다시 입력하여 주십시오.");
				return false;
			}
			
			// 1원단위로는 입력할 수 없음
			if (price > 10 * parseInt(price / 10)){
				alert("1원단위로 입찰하실 수 없습니다.");
				return false;
			}
			
			// 10원단위로는 입력할 수 없음
			if (price > 100 * parseInt(price / 100)){
				alert("10원단위로 입찰하실 수 없습니다.");
				return false;
			}
			
			// 100원 단위로는 입력할 수 없음
			if (price > 1000 * parseInt(price / 1000)){
				alert("100원단위로 입찰하실 수 없습니다.");
				return false;
			}
			
			if (price > endprice) {
				alert("즉시구매가보다 높게 입찰하실 수 없습니다.");
				return false;
			}
			
			else {
				var frm = document.inputTenderFrm;
				var url = "<%=request.getContextPath()%>/inputTender.action";
				frm.method = "POST";
				frm.action = url;
				frm.submit();
			}
			
			
		});
		
	});

</script>
    
    

</body>
</html>
