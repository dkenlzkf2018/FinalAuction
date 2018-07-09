<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>SUPER AUCTION 경매 입찰</title>
    

    <link rel="apple-touch-icon" href="apple-icon.png">
    <link rel="shortcut icon" href="favicon.ico">

    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/assets-admin/css/normalize.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/assets-admin/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/assets-admin/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/assets-admin/css/themify-icons.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/assets-admin/css/flag-icon.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/assets-admin/css/cs-skin-elastic.css">
    <!-- <link rel="stylesheet" href="assets/css/bootstrap-select.less"> -->
    

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>

    <!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->

</head>
<script type="text/javascript">
	
	function goInput() {
		
		var qty = $("#qty").val();
		var nowprice = $("#nowprice").trim().val();
		var endprice = Number("${map.actd_price}");
		if (nowprice == null) {
			alert("입찰금액을 입력해주십시오");
			return false;
		}
		if (nowprice >= tenderprice) {
			alert("입찰 금액은 현재가 + 1000원 이상이어야 합니다. 다시 입력하여 주십시오.");
			nowprice.val("");
			nowprice.focus();
			return false;
		}
		if (tenderprice > 100 * parseInt(tenderprice / 100)){
			alert("10원단위로 입찰하실 수 없습니다.");
			nowprice.val("");
			nowprice.focus();
			return false;
		}
		if (tenderprice > endprice) {
			alert("즉시구매가보다 높게 입찰하실 수 없습니다.");
			nowprice.val("");
			nowprice.focus();
			return false;
		}
		if (tenderprice < nowprice) {
			alert("현재가보다 높게 입찰하실 수 없습니다.");
			nowprice.val("");
			nowprice.focus();
			return false;
		}
		else {
			var frm = document.inputTenderFrm;
			var url = "<%=request.getContextPath()%>/inputTender.action";
			frm.method = "POST";
			frm.action = url;
			frm.submit();
			
			window.opener.location.reload();    //부모창 reload
			window.close();    //현재 팝업창 Close
		}
		
		

		
	}
</script>
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
                                          <input style="color:red;" id="nowprice" name="nowprice" type="text" class="form-control" aria-required="true" aria-invalid="false" value="${map.startprice}원" readonly />
                                      </div>
                                      <div class="form-group has-success">
                                          <label for="cc-name" class="control-label mb-1">입찰 수량</label>
                                          <input id="inputqty" name="inputqty" type="text" class="form-control cc-name valid" value="${map.actd_qty}" data-val="true" data-val-required="Please enter the name on card" autocomplete="cc-name" aria-required="true" aria-invalid="false" aria-describedby="cc-name-error" />
                                          <span class="help-block field-validation-valid" data-valmsg-for="cc-name" data-valmsg-replace="true"></span>
                                      </div>
                                      <div class="form-group">
                                          <label for="cc-number" class="control-label mb-1">입찰 금액(<span style="color:red;">현재 <fmt:formatNumber value="${map.startprice + 1000}" type="number"/>원</span> 부터 입찰하실 수 있습니다.)</label>
                                          <input id="tenderprice" name="tenderprice" type="tel" class="form-control cc-number identified visa" value="" data-val="true" data-val-required="Please enter the card number" data-val-cc-number="Please enter a valid card number" autocomplete="cc-number" />
                                                                                    원 (콤마','없이 100원 단위로 입력하세요.)
                                          <span class="help-block" data-valmsg-for="cc-number" data-valmsg-replace="true"></span>
                                      </div>
                                      
                                      <div>
                                          <button type="button" onclick="goInput()">
                                              <span id="payment-button-amount">입찰하기</span>                                              
                                          </button>
                                      </div>
                                  
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

    <!-- Right Panel -->


    

	


    
    
    
<script src="<%=request.getContextPath()%>/resources/assets-admin/js/lib/vector-map/jquery.vmap.js"></script>
<script src="<%=request.getContextPath()%>/resources/assets-admin/js/lib/vector-map/jquery.vmap.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/assets-admin/js/lib/vector-map/jquery.vmap.sampledata.js"></script>
<script src="<%=request.getContextPath()%>/resources/assets-admin/js/lib/vector-map/country/jquery.vmap.world.js"></script>
    
<script src="<%=request.getContextPath()%>/resources/assets-admin/js/vendor/jquery-2.1.4.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/assets-admin/js/popper.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/assets-admin/js/plugins.js"></script>
<script src="<%=request.getContextPath()%>/resources/assets-admin/js/main.js"></script>

<script src="<%=request.getContextPath()%>/resources/assets-admin/js/lib/data-table/datatables.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/assets-admin/js/lib/data-table/dataTables.bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/assets-admin/js/lib/data-table/dataTables.buttons.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/assets-admin/js/lib/data-table/buttons.bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/assets-admin/js/lib/data-table/jszip.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/assets-admin/js/lib/data-table/pdfmake.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/assets-admin/js/lib/data-table/vfs_fonts.js"></script>
<script src="<%=request.getContextPath()%>/resources/assets-admin/js/lib/data-table/buttons.html5.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/assets-admin/js/lib/data-table/buttons.print.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/assets-admin/js/lib/data-table/buttons.colVis.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/assets-admin/js/lib/data-table/datatables-init.js"></script>
</body>
</html>
