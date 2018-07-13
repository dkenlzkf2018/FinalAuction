<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우편번호 검색 결과</title>
<script type="text/javascript">
	
	function goMove(zipcode, address){
		
		var frm = document.registerFrm;
		window.opener.document.getElementById("zipcode").value = zipcode;
		window.opener.document.getElementById("addr1").value = address;	
		window.opener.document.getElementById("addr1").focus();
		self.window.close();
	}
	
	
</script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets-admin/css/normalize.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets-admin/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets-admin/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets-admin/css/themify-icons.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets-admin/css/flag-icon.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets-admin/css/cs-skin-elastic.css">
<!-- <link rel="stylesheet" href="assets/css/bootstrap-select.less"> -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets-admin/scss/style.css">
<link href="<%=request.getContextPath()%>/resources/assets-admin/css/lib/vector-map/jqvmap.min.css" rel="stylesheet">
</head>
<body style="background-color: #fff0f5;">
<div class="content mt-4">
    <div class="animated fadeIn">
        <div class="row">
	        <div class="col-md-12">
	            <div class="card">
	                <div class="card-header">
	                	<div class="col-md-6">
	                    	<strong class="card-title">주소 검색 결과</strong>
	                    </div>
	                </div>
	                <div class="card-body">
			          <table id="bootstrap-data-table" class="table table-striped table-bordered">
			            <thead>
			              <tr>
			                <th>우편번호</th>
			                <th>주소</th>
			              </tr>
			            </thead>
			            <tbody>
			            <c:if test="${result == '0'}">
						  <tr>
					    	<td colspan="2" align="center">
					    		<span style="color: red; font-weight: bold;">${zipcodeNotExist}</span>
					    	</td>  	
					      </tr>	
						</c:if>
						
						<c:if test="${result == '1'}">
						  <c:forEach var="map" items="${zipcodeList}">
						    <tr>
					      	   <td>
					      	      ${map.zipcode}
					      	   </td>
					      	   <td>
					      	       <span style="cursor:pointer;" onClick="goMove('${map.zipcode}','${map.address}');">${map.address}</span>
					      	   </td>
					        </tr>
						  </c:forEach>
						</c:if>
			            </tbody>
			          </table>
	                </div>
	            </div>
	        </div>
        </div>
    </div><!-- .animated -->
</div><!-- .content -->
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
<script type="text/javascript">
    $(document).ready(function() {
      $('#bootstrap-data-table-export').DataTable();
    } );
</script>

<form name="registerFrm" id="registerFrm">
	<input type="hidden" name="zipcode" id="zipcode"/>
	<input type="hidden" name="addr1" id="addr1"/>
</form>

</body>
</html>
