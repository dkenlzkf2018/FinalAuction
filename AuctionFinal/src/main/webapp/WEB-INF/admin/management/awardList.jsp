<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	.hidden {
		display: none;
	}
</style>
<script type="text/javascript">
	function goDeliverstatus() {
		var frm = document.registFrm;
		
		frm.method = "get";
		frm.action = "deliverSet.action";
		frm.submit();
	}
</script>
<div class="breadcrumbs">
    <div class="col-sm-4">
        <div class="page-header float-left">
            <div class="page-title">
                <h1>Dashboard</h1>
            </div>
        </div>
    </div>
    <div class="col-sm-8">
        <div class="page-header float-right">
            <div class="page-title">
                <ol class="breadcrumb text-right">
                    <li><a href="#">Dashboard</a></li>
                    <li><a href="#">Table</a></li>
                    <li class="active">Data table</li>
                </ol>
            </div>
        </div>
    </div>
</div>

<div class="content mt-4">
    <div class="animated fadeIn">
        <div class="row">
	        <div class="col-md-12">
	            <div class="card">
	                <div class="card-header">
	                	<div class="col-md-6">
	                    	<strong class="card-title">낙찰 리스트</strong>
	                    </div>
	                    <div class="col-md-6" align="right">
		              		<button class="btn btn-secondary hidden" id="delButton" type="button" onClick="goDeliverstatus();">저장</button>
		              	</div>
	                </div>
	                <div class="card-body">
		                <form name="registFrm">
				          <table id="bootstrap-data-table" class="table table-striped table-bordered">
				            <thead>
				              <tr>
				                <th>번호</th>
				                <th>아이디</th>
				                <th>상품명</th>
				                <th>낙찰일</th>
				                <th>낙찰가</th>
				                <th>배송</th>
				              </tr>
				            </thead>
				            <tbody>
				              <c:forEach var="map" items="${awardList}" varStatus="status">
					              <tr data-toggle="collapse">
					                <td><input name="awardnum${status.count}" type="hidden" value="${map.AWARDNUM}" readonly="readonly"/>${map.AWARDNUM}</td>
					                <td>${map.USERID}</td>
					                <td>${map.ACTNAME}</td>
					                <td>${map.AWARDDAY}</td>
					                <td>${map.AWARDPRICE}</td>
					                <td>
					                	<select class="select" name="deliverstatus${status.count}">
					                		<c:if test="${map.DELIVERSTATUS == 0}">
						                		<option value="${map.DELIVERSTATUS}" selected>주문완료</option>
						                		<option value="1">배송중</option>
						                		<option value="2">배송완료</option>
					                		</c:if>
					                		<c:if test="${map.DELIVERSTATUS == 1}">
						                		<option value="${map.DELIVERSTATUS}" selected>배송중</option>
						                		<option value="2">배송완료</option>
					                		</c:if>
					                		<c:if test="${map.DELIVERSTATUS == 2}">
						                		<option value="${map.DELIVERSTATUS}" selected>배송완료</option>
					                		</c:if>
					                	</select>
					                </td>
					              </tr>
				              </c:forEach>
				            </tbody>
				          </table>
				          <input type="hidden" name="length" value="${awardList.size()}"/>
		              	</form>
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
      $(".select").bind("change", function(){
          $("#delButton").removeClass("hidden");
      });
    } );
</script>