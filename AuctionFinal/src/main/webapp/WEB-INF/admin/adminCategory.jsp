<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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


<div class="col-xs-6 col-sm-6">
   <div class="card">
       <div class="card-header">
           <strong class="card-title">카테고리 등록</strong>
       </div>
       <div class="card-body">

       		<select data-placeholder="대분류" class="standardSelect" tabindex="1">
               <option value="">대분류</option>
               <option value="United States">의류</option>
               <option value="United Kingdom">생활용품</option>
               <option value="Afghanistan">디지털</option>
               <option value="Aland Islands">스포츠</option>
               <option value="Albania">기타</option>
       		</select>
       		
       		<select data-placeholder="소분류" class="standardSelect" tabindex="1">
               <option value="">소분류</option>
               <option value="United States">United States</option>
               <option value="United Kingdom">United Kingdom</option>
               <option value="Afghanistan">Afghanistan</option>
               <option value="Aland Islands">Aland Islands</option>
               <option value="Albania">Albania</option>
               <option value="Algeria">Algeria</option>
               <option value="American Samoa">American Samoa</option>
               <option value="Andorra">Andorra</option>
               <option value="Angola">Angola</option>
               <option value="Anguilla">Anguilla</option>
               <option value="Antarctica">Antarctica</option>
       		</select>       		
       </div>
   </div>
</div>

<script src="assets/js/vendor/jquery-2.1.4.min.js"></script>
<script src="assets/js/popper.min.js"></script>
<script src="assets/js/plugins.js"></script>
<script src="assets/js/main.js"></script>
<script src="assets/js/lib/chosen/chosen.jquery.min.js"></script>

<script>
    jQuery(document).ready(function() {
        jQuery(".standardSelect").chosen({
            disable_search_threshold: 10,
            no_results_text: "Oops, nothing found!",
            width: "100%"
        });
    });
</script>
                        