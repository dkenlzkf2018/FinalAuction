<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">
	table, th, td {border: solid gray 0px;}
	

	#table {border-collapse: collapse; width: 920px;}
		
	#table th, #table td {padding: 5px;}
	#table th {background-color: white;}
	
	a{text-decoration: none;}
	
	.subjectstyle {font-weight: bold;
	               color: navy;
	               cursor: pointer;}
</style>

<script type="text/javascript">
	jQuery(document).ready(function(){
		
		$(".subject").hover(function(event){
							 var $target = $(event.target);
							 $target.addClass("subjectstyle");
		                    }, function(event){
		                     var $target = $(event.target);
							 $target.removeClass("subjectstyle");
		                    }
		);
		
		searchKeep();
		
	}); // end of $(document).ready()-------------------------
	
	
	function goView(boardno) {
		
		var frm = document.goViewFrm;
		frm.boardno.value = boardno;
		
		frm.action = "writeview.action";
		frm.method = "get";
		frm.submit();
	}// end of function goView()---------------------
	
	
	function goSearch() {
		
		var frm = document.searchFrm;
	<%--	
		var searchval = $("#search").val().trim();
		
		if(searchval == "") {
			alert("검색어를 입력하세요!!");
			return;
		}
		else {
			frm.action = "<%= request.getContextPath() %>/list.action"; 
			frm.method = "GET";
			frm.submit();
		}
	--%>
	
		frm.action = "<%= request.getContextPath() %>/boardlist.action"; 
		frm.method = "GET";
		frm.submit();
	}
	
	
	function searchKeep() {
		<c:if test="${ (colname != 'null' && not empty colname) && (search != 'null' && not empty search) }">       
		   $("#colname").val("${colname}");
		   $("#search").val("${search}");
		</c:if>
	}
	
</script>

<div style="padding-left: 10%;">
	<h3 style="margin-bottom: 30px;">게시글 목록</h3>
	
	<table id="table">
		<thead>
			<tr>
				<th style="width: 70px;  text-align: center">번호</th>
				<th style="width: 360px; text-align: center">제목</th>
				<th style="width: 70px;  text-align: center">작성자</th>
				<th style="width: 180px; text-align: center">작성일</th>
				<th style="width: 70px;  text-align: center">조회수</th>
	
			</tr>
		</thead>
		<tbody>
			<c:forEach var="boardvo" items="${boardList}">
				<tr>
					<td align="center">${boardvo.boardno}</td>
					<td>
					    <%-- <span class="subject" onClick="goView('${boardvo.seq}');">${boardvo.subject}</span> --%>
					    <%-- ==== #104. 글제목에 댓글의 갯수를 붙이도록 한다. 
					    <c:if test="${boardvo.commentCount > 0}">
					        <span class="subject" onClick="goView('${boardvo.seq}');">${boardvo.subject}<span style="color: red; font-weight: bold; font-style: italic; font-size: smaller; vertical-align: super;">[${boardvo.commentCount}]</span></span> 
					    </c:if>
					    <c:if test="${boardvo.commentCount == 0}">
					        <span class="subject" onClick="goView('${boardvo.seq}');">${boardvo.subject}</span>
					    </c:if>
					    --%>
					    
					    <%-- ==== #128. 글제목에 댓글의 갯수를 붙이도록 한다.
					                                     답변글인 경우 제목앞에 공백(여백)과 함께 Re 라는 글자를 붙이도록 한다.--%>
					    <!-- 답변글이 아닌 원글인 경우 -->
					    <c:if test="${boardvo.fk_boardno == 0}">
						    <c:if test="${boardvo.commentcount > 0}">
						        <span class="subject" onClick="goView('${boardvo.boardno}');">${boardvo.subject}<span style="color: red; font-weight: bold; font-style: italic; font-size: smaller; vertical-align: super;">[${boardvo.commentcount}]</span></span> 
						    </c:if>
						    <c:if test="${boardvo.commentcount == 0}">
						        <span class="subject" onClick="goView('${boardvo.boardno}');">${boardvo.subject}</span>
						    </c:if>
					    </c:if>
					    
					    <!-- 답변글인 경우 -->
					    <c:if test="${boardvo.fk_boardno > 0}">
						    <c:if test="${boardvo.commentcount > 0}">
						        <span class="subject" onClick="goView('${boardvo.boardno}');"><span style="color: red; font-style: italic; padding-left: ${boardvo.deptthno * 20}px;">└Re&nbsp;&nbsp;</span>${boardvo.subject}<span style="color: red; font-weight: bold; font-style: italic; font-size: smaller; vertical-align: super;">[${boardvo.commentcount}]</span></span> 
						    </c:if>
						    <c:if test="${boardvo.commentcount == 0}">
						        <span class="subject" onClick="goView('${boardvo.boardno}');"><span style="color: red; font-style: italic; padding-left: ${boardvo.deptthno * 20}px;">└Re&nbsp;&nbsp;</span>${boardvo.subject}</span>
						    </c:if>
					    </c:if>
					    
					</td>
					<td>${boardvo.fk_userid}</td>
					<td align="center">${boardvo.writeday}</td>
					<td align="center">${boardvo.viewcount}</td>
					
			  </tr>
			</c:forEach>			
		</tbody>
	</table>
	
	<form name="goViewFrm">
		<input type="hidden" name="boardno" />
	</form>
	
	<div style="margin-top: 10px; margin-left: 18px;">
		<a href="<%=request.getContextPath()%>/write.action" style="font-weight: bold; font-size: 10pt; color: black;">
		<button type="button" style="margin-right: 30px;">
		<img src="resources/img/ico-btn-write.gif" style="margin-right:5px;">글쓰기</button>
		</a>
	</div>
	
	
	<%-- ==== #117. 페이지바 보여주기 ==== --%>
	<div align="center" style="width: 70%; margin-left: -180px; margin-top: 30px;"> 
		${pagebar}
	</div>
	
	<%-- ==== #105. 글검색 폼 추가하기 : 글제목, 글내용, 글쓴이로 검색하도록 한다. ==== --%> 
	<div style="margin-top: 40px;">
	<form name="searchFrm">
		<select name="colname" id="colname" style="height: 26px;"> 
			<option value="subject">제목</option>
			<option value="content">내용</option>
			<option value="fk_userid">작성자</option>
		</select>
		<input type="text" name="search" id="search" size="40" />
		<button type="button" onClick="goSearch();">검색</button>
	</form>
	</div>
	
	
	
</div>







    