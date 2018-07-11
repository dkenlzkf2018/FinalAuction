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


<div class="col-xs-4 col-sm-2">    
	<div class="card">
    	<div class="card-header">
           <strong class="card-title">카테고리 등록</strong>
        </div>
        <div class="card-body">
        	<c:forEach var="categoryvo" items="$">
       		<select data-placeholder="소분류" class="standardSelect" tabindex="1">
               <option value=""></option>
               <option value="United States">${categoryvo.cdname}</option>
               <option value="United Kingdom">${categoryvo.cdname}</option>
               <option value="Afghanistan">${categoryvo.cdname}</option>
               <option value="Aland Islands">${categoryvo.cdname}</option>
               <option value="Albania">${categoryvo.cdname}</option>
       		</select>
       		</c:forEach>
       		<%-- <c:forEach var="membervo" items="${memberList}">
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
              </c:forEach> --%>       		
        </div>
    </div>
</div>    

<script src="<%=request.getContextPath()%>/resources/assets-admin/js/vendor/jquery-2.1.4.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/assets-admin/js/popper.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/assets-admin/js/plugins.js"></script>
<script src="<%=request.getContextPath()%>/resources/assets-admin/js/main.js"></script>
<script src="<%=request.getContextPath()%>/resources/assets-admin/js/lib/chosen/chosen.jquery.min.js"></script>

<script>
    jQuery(document).ready(function() {
        jQuery(".standardSelect").chosen({
            disable_search_threshold: 1,
            no_results_text: "이런, 없는 내용입니다!", /* 여기에 글이 써지면 안되는데 */
            width: "100%"
        });
    });
</script>
                        