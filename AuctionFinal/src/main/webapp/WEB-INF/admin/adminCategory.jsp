<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.finalc.auction.model.CategoryVO"%>
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
                    <li class="active">카테고리 등록&삭제</li>
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
        	<div class="col-md-5">
	       		<select data-placeholder="대분류" class="standardSelect" tabindex="1" id="category" name="category">
	       			<option value="">:::선택하세요:::</option>
	       		<c:forEach var="map" items="${categoryList}">
	       		<%-- <c:forEach var="categoryvo" items="${adminCategory}"> --%> <!-- select문 안에 forEach문이 있어야한다. -->
	               <option value="${map.cnum}" data-filter=".${map.cname}">${map.cname}</option>
	       		   <%-- <option value="${categoryvo.cnum}">${categoryvo.cname}</option> --%>
	       		</c:forEach>
	       		</select>
       		</div>
       		<div class="col-md-5">
       			<form name="addcd">
	       			<input type="text" class="form-control-success form-control" name="cdname"/>
	       			<input type="hidden" name="cnum" id="cnum"/>
	       		</form>
       		</div>
       		<div class="col-md-2"><button type="button" class="btn" onClick="addCategory();">저장</button></div>
        </div>
    </div>
</div>

<!-- 커밋하지 말것 아직 수정중 -->
<div class="col-md-12">    
	<div class="card">
    	<div class="card-header">
           <strong class="card-title">카테고리 삭제</strong>
        </div>
        <div class="card-body col-md-12">
        	<div class="col-md-5">
	       		<select data-placeholder="대분류" class="standardSelect" tabindex="1" id="category" name="category">
	       			<option value="">:::선택하세요:::</option>
	       		<c:forEach var="map" items="${categoryList}">
	       		<%-- <c:forEach var="categoryvo" items="${adminCategory}"> --%> <!-- select문 안에 forEach문이 있어야한다. -->
	               <option value="${map.cnum}" data-filter=".${map.cname}">${map.cname}</option>
	       		   <%-- <option value="${categoryvo.cnum}">${categoryvo.cname}</option> --%>
	       		</c:forEach>
	       		</select>
       		</div>
       		<div class="col-md-5">
       			<form name="delcd">
	       			<input type="text" class="form-control-success form-control" name="cdname"/>
	       			<input type="hidden" name="cnum" id="cnum"/>
	       		</form>
       		</div>
       		<div class="col-md-2"><button type="button" class="btn" onClick="delCategory();">삭제</button></div>
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
        
        // 카테고리 추가
        jQuery("#category").bind("change", function() {
        	jQuery("#cnum").val(jQuery(this).val());
        });
	
        // 카테고리 삭제
        /* jQuery("#cnum").bind("change", function() {
        	jQuery("#category").val(jQuery(this).val());
        }); */
    }); 
    
    // 카테고리 추가
    function addCategory() {
    	var frm = document.addcd;
    	
    	frm.method = "get";
    	frm.action = "<%=request.getContextPath()%>/admin/addCategory.action";
    	frm.submit();
    }
    
    // 카테고리 삭제
    function delCategory() {
    	var frm = document.delcd;
    	
    	frm.method = "get";
    	frm.action = "<%=request.getContextPath()%>/admin/delCategory.action";
    	frm.submit();
    }    
</script>
                        