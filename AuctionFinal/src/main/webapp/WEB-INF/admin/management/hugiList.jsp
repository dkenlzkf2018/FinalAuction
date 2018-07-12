<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
	.hidden {display: none;}
</style>
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
	                    <strong class="card-title">후기 리스트</strong>
	                </div>
	                <div class="card-body">
	          <table id="bootstrap-data-table" class="table table-striped table-bordered">
	            <thead>
	              <tr>
	                <th>번호</th>
	                <th>작성자</th>
	                <th>상품명</th>
	                <th>내용</th>
	                <th>작성일</th>
	                <th>만족도</th>
	                <th>비고</th>
	              </tr>
	            </thead>
	            <tbody>
	              <c:forEach var="hugivo" items="${hugiList}" varStatus="status">
		              <tr data-toggle="collapse">
		                <td>${hugivo.ep_boardno}</td>
		                <td>${hugivo.fk_userid}</td>
		                <td>${hugivo.fk_actdnum}</td>
		                <td>${hugivo.ep_content}</td>
		                <td>${hugivo.ep_writeday}</td>
		                <td>${hugivo.ep_satisfaction}</td>
		                <c:if test="${hugivo.ep_boardstatus == 1}">
		                	<td><button onClick="location.href='<%=request.getContextPath()%>/admin/hugiDel.action?ep_boardno=${hugivo.ep_boardno}'">삭제</button></td>
		                </c:if>
		                <c:if test="${hugivo.ep_boardstatus == 0}">
		                	<td><button onClick="location.href='<%=request.getContextPath()%>/admin/hugiRecover.action?ep_boardno=${hugivo.ep_boardno}'">복구</button></td>
		                </c:if>
		              </tr>
	              </c:forEach>
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