<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="breadcrumbs">
    <div class="col-sm-4">
        <div class="page-header float-left">
            <div class="page-title">
                <h1>Admin Main</h1>
            </div>
        </div>
    </div>
    <div class="col-sm-8">
        <div class="page-header float-right">
            <div class="page-title">
                <ol class="breadcrumb text-right">
                    <li><a href="<%=request.getContextPath()%>/adminMain.action">Admin Main</a></li>
                    <li class="active">회원 관리</li>
                    <li><a href="<%=request.getContextPath()%>/admin/memberList.action">회원 리스트</a></li>
                </ol>
            </div>
        </div>
    </div>
</div>

<div class="content mt-3">
    <div class="animated fadeIn">
        <div class="row">

        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <strong class="card-title">회원 리스트</strong>
                </div>
                <div class="card-body">
          <table id="bootstrap-data-table" class="table table-striped table-bordered">
            <thead>
              <tr>
                <th>번호</th>
                <th>아이디</th>
                <th>이름</th>
                <th>전화번호</th>
                <th>생년월일</th>
                <th>성별</th>
                <th>이메일</th>
                <th>주소</th>
                <th>등급</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="membervo" items="${memberList}">
	              <tr>
	                <td>${membervo.usernum}</td>
	                <td>${membervo.userid}</td>
	                <td>${membervo.username}</td>
	                <td>${membervo.hp1}-${membervo.hp2}-${membervo.hp3}</td>
	                <td>${membervo.birth}</td>
	                <td>${membervo.gender}</td>
	                <td>${membervo.email}</td>
	                <td>${membervo.addr1} ${membervo.addr2}</td>
	                <td>${membervo.grade}</td>
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