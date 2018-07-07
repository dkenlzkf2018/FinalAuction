<?xml version="1.0" encoding="UTF-8" ?>
<%@page import="java.util.List"%>
<%@page import="com.finalc.auction.model.CategoryVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="UTF-8" />
<title>상품 등록 페이지</title>

<STYLE type="text/css">
	#addauction {
		width:800px;
	}
	.names {
		text-align:right;
		font-weight:bold;
		font-size: 14pt;
	}
</STYLE>

<SCRIPT type="text/javascript">
	
	var weatheRound = 0;

	jQuery(document).ready(function() {

		loopshowNowTime();
		
		$("#category").bind("change", function(){
			var categoryIndex = "";
			categoryIndex += "<select name='cdnum' class='infoData'><option value=''>:::선택하세요:::</option>";
			<%
			List<CategoryVO> cList = (List<CategoryVO>)request.getAttribute("categoryDetailList");
			
			for(CategoryVO cvo : cList){
				%>
				if($(this).val() == <%=cvo.getCnum()%>)
				{
					categoryIndex += "<option value='<%= cvo.getCdnum() %>'><%= cvo.getCdname()%></option>";
				}
				<%
			}
			%>
			
			categoryIndex += "</select>";
			
			$("#categoryDetail").empty();
			$("#categoryDetail").append(categoryIndex);
		}); // $("#category").bind("change", function()
		
	}); // end of jQuery(document).ready(); ---------------------------------
	
	function showNowTime() {
		
		var now = new Date();
	
		var strNow = now.getFullYear() + "-" + (now.getMonth() + 1) + "-" + now.getDate();
		
		var hour = "";
		hour = "&nbsp;"+now.getHours()
		
		var minute = "";
		if(now.getMinutes() < 10) {
			minute = "0"+now.getMinutes();
		} else {
			minute = ""+now.getMinutes();
		}
		
		var second = "";
		if(now.getSeconds() < 10) {
			second = "0"+now.getSeconds();
		} else {
			second = ""+now.getSeconds();
		}
		
		strNow += hour + ":" + minute + ":" + second;
		
		$("#clock").html("<span style='color:#008899; font-weight:bold;'>"+strNow+"</span>");
	
	}// end of function showNowTime() -----------------------------
	
	function loopshowNowTime() {
		showNowTime();
		
		var timejugi = 1000;   // 시간을 1초 마다 자동 갱신하려고.
		
		setTimeout(function() {
			loopshowNowTime();	
		}, timejugi);
	
	}// end of loopshowNowTime() --------------------------
	
	function categoryClick() {
		
		alert("${map.cnum}");
		
	} // function categoryClick()
	
	function submit() {
		
		// 글제목 유효성 검사
		var subjectval = document.getElementById("subject").value.trim();
		
		if(subjectval == "") {
			alert("제목을 입력하세요.");
			return;
		}
		
		//스마트에디터 사용시 무의미하게 생기는 p태그 제거
        var content = document.getElementById("content");
		
        if(content.value == "" || content.value == "<p>&nbsp;</p>") {
        	alert("내용을 입력하세요");
        	return;
        }
        	        
		content.value = content.value.replace(/<p><br><\/p>/gi, "<br>"); //<p><br></p> -> <br>로 변환
		content.value = content.value.replace(/<\/p><p>/gi, "<br>"); //</p><p> -> <br>로 변환
		content.value = content.value.replace(/(<\/p><br>|<p><br>)/gi, "<br><br>"); //</p><br>, <p><br> -> <br><br>로 변환
		content.value = content.value.replace(/(<p>|<\/p>)/gi, ""); //<p> 또는 </p> 모두 제거시
		
		// 글암호 유효성 검사
		
		// form 전송하기
		var frm = document.writeFrm;
		frm.action = "<%=request.getContextPath()%>/writeEnd.action";
		frm.method = "post";
		frm.submit();
		
	}
	
</SCRIPT>
</head>
<body>
	<form name="addaboutauction">
	<div class="row">
	<div align="center">
	<table class="table" id="addauction">
		<tr>
			<th class="names">아이디</th>
			<td><input type="text" value="${sessionScope.loginuser.userid}" readonly/></td>
		</tr>
		<TR>
			<th class="names">대분류</th>
			<td>
				<div class="col-lg-5 col-sm-5">
				<select class="form-control" id="category" name="category">
					<c:forEach var="map" items="${categoryList}">
						<option value="${map.cnum}" data-filter=".${map.cname}">${map.cname}</option>
					</c:forEach>
				</select>
				</div>
			</td>
		</TR>
		<TR>
			<th class="names">상세분류</th>
			<td>
				<div class="col-lg-5 col-sm-5">
					<select class="form-control" id="categoryDetail" name="categoryDetail">
						<option value="">:::선택하세요:::</option>
		            </select>
					<%-- <c:forEach var="map" items="${categoryList}">
						<c:forEach var="categoryvo" items="${categoryDetailList}">
							<c:if test="${map.cnum == categoryvo.cnum}">
								<select class="form-control" id="categoryDetail" name="categoryDetail">
									<option class="${map.cname}" value="${categoryvo.cdnum}" >
										${categoryvo.cdname}
									</option>
								</select>
							</c:if>
						</c:forEach>
					</c:forEach> --%>
				</div>
			</td>
		</TR>
		<TR>
			<th class="names">경매시작가격</th>
			<td><input type="text" /></td>
		</TR>
		<TR>
			<th class="names">즉시구매가격</th>
			<td><input type="text" /></td>
		</TR>
		<TR>
			<th class="names">최저입찰가</th>
			<td><input type="text" /></td>
		</TR>
		<TR>
			<th class="names">경매시작일</th>
			<td><div class="col-lg-5 col-sm-5"><div id="clock" style="display:inline;"></div></div></td>
		</TR>
		<TR>
			<th class="names">경매종료일</th>
			<td><div class="col-lg-5 col-sm-5">
					<input type="date" id="enddate" name="enddate" class="form-control" />
					<input type="time" id="endtime" name="endtime" class="form-control" />
				</div></td>
		</TR>
		<TR>
			<th class="names">판매수량</th>
			<td>  <input type="number" name="quantity" min="1" max="100" step="1" value="1"></td>
		</TR>
		<TR>
       		<th class="names">이미지</th>
       		<td><input type="file" name="attach"/></td>
		</TR>
		<TR>
			<th class="names" colspan="2" style="text-align:center;">내용</th>
		</TR>
		<TR>
			<td colspan="2"><div align="center"><TEXTAREA id="content" rows="6" cols="90%"></TEXTAREA></div></td>
		</TR>
		<tr>
			<td colspan="2">
				<div align="center">
					<button type="button" class="btn" onClick="submit()">상품등록</button>
					<button type="button" class="btn" onClick="javascript:history.back()">취소</button>
				</div>
			</td>
		</tr>
	</table>
	<br/>
	</div>
	</div>
	</form>
</body>
</html>