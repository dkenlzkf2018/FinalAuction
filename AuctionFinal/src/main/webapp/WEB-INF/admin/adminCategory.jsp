<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets-admin/css/lib/chosen/chosen.min.css">

<div class="breadcrumbs">
    <div class="col-sm-4">
        <div class="page-header float-left">
            <div class="page-title">
                <h1>관리자</h1>
            </div>
        </div>
    </div>
    <div class="col-sm-8">
        <div class="page-header float-right">
            <div class="page-title">
                <ol class="breadcrumb text-right">
                    <li><a href="<%=request.getContextPath()%>/adminMain.action">관리자</a></li>
                    <li><a href="<%=request.getContextPath()%>/adminCategory.action">카테고리 관리</a></li>
                    <li class="active">카테고리 등록</li>
                </ol>
            </div>
        </div>
    </div>
</div>


<div class="col-md-12">    
	<div class="card">
    	<div class="card-header">
           <strong class="card-title">카테고리 등록</strong>
        </div>
        <div class="card-body col-md-12">
        	<div class="col-md-6">
	       		<select data-placeholder="대분류" class="standardSelect" tabindex="1" id="category" name="cnum">
	       			<option value="">:::선택하세요:::</option>
	       		<c:forEach var="map" items="${categoryList}">
	       		<%-- <c:forEach var="categoryvo" items="${adminCategory}"> --%> <!-- select문 안에 forEach문이 있어야한다. -->
	               <option value="${map.cnum}" data-filter=".${map.cname}">${map.cname}</option>
	       		   <%-- <option value="${categoryvo.cnum}">${categoryvo.cname}</option> --%>
	       		</c:forEach>
	       		</select>
       		</div>
       		<div class="col-md-6">
	       		<select data-placeholder="소분류" class="standardSelect" tabindex="1" id="categoryDetail" name="cdnum">
	       			<option value="">:::선택하세요:::</option>
	       			<c:forEach var="map" items="${categoryDetailList}">
		       		<%-- <c:forEach var="categoryDetailvo" items="${adminCategoryDetail}"> --%> <!-- select문 안에 forEach문이 있어야한다. -->
		               <option value="${categoryDetailvo.cdnum}" data-filter=".${categoryDetailvo.cdname}">${categoryDetailvo.cdname}</option>
		               <%-- <option value="${categoryDetailvo.cdnum}">${categoryDetailvo.cdname}</option> --%>
		       		</c:forEach>
	       		</select>
       		</div>
        </div>
    </div>
</div>    

<script src="<%=request.getContextPath()%>/resources/assets-admin/js/vendor/jquery-2.1.4.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/assets-admin/js/popper.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/assets-admin/js/plugins.js"></script>
<script src="<%=request.getContextPath()%>/resources/assets-admin/js/main.js"></script>
<script src="<%=request.getContextPath()%>/resources/assets-admin/js/lib/chosen/chosen.jquery.min.js"></script>

<script type="text/javascript">
    jQuery(document).ready(function() {
        jQuery(".standardSelect").chosen({
            disable_search_threshold: 1,
            no_results_text: "이런, 없는 내용입니다!", /* 여기에 글이 써지면 안되는데 */
            width: "100%"
        });
    });   
    
/* 	$('#add_category').submit(function(event) {
		var form = $(this);
		$.ajax({
			type : form.attr('method'),
			url : form.attr('action'),
			data : form.serialize()
		}).done(function(c) {				
			$("#category").append("<option value=" + c.cdnum + ">" + c.cdname + "</option>");
			$("#category").val(c.id);
			
			alert(c.name + " 카테고리가 추가되었습니다.");
		}).fail(function() {
			alert('error');
		});
		event.preventDefault();
	}); */    
</script>
                        