<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">

	#table, #table2{width: 1000px; border-collapse: collapse;}
	
	
	
	.board-box-line-dashed { width: 820px;
							 border-bottom-style: dashed;
    						 border-bottom-width: 1px;
    						 opacity: 0.3;}
    						 
   .comment-box-line-dashed { width: 880px;
							  border-bottom-style: dashed;
    						  border-bottom-width: 1px;
    						  margin-bottom: 25px;
    						  opacity: 0.3;}
    						  
					  
    						  



	#table th, #table td {padding: 5px;}
	#table th {width: 120px;}
	#table td {width: 860px;}

	a{text-decoration: none;}

</style>

<script type="text/javascript">

var yn = confirm("댓글을 삭제 하시겠습니까?");

if(yn==false) { // 취소를 선택한 경우
	  return;
}
else { // 확인을 선택한 경우

 var frm = document.orderFrm;


     frm.method = "post";
     frm.action = "commentdeleteEnd.action";
     frm.submit();
}
<%-- 
	function goWrite() {
		var frm = document.addWriteFrm;
		
		var contentval = frm.content.value.trim();
		
		if(contentval == "") {
			alert("댓글 내용을 입력하세요!!");
			return;
		}
		
		frm.action = "<%= request.getContextPath() %>/addComment.action"; 
		frm.method = "post";
		frm.submit();
	} 
--%>
	
	function goWrite() {
		
		var frm = document.addWriteFrm;
		
		var fk_useridval = frm.fk_userid.value.trim();
		
		if(fk_useridval == "") {
			alert("먼저 로그인 하세요.");
			return;
		}
		
		var cm_contentval = frm.cm_content.value.trim();
		
		if(cm_contentval == "") {
			alert("댓글 내용을 입력하세요.");
			return;
		}
		
		var data_form = {fk_userid : frm.fk_userid.value,
				         cm_content: cm_contentval,
				         fk_boardno: frm.fk_boardno.value};
		
		$.ajax({
			url:"<%= request.getContextPath() %>/writeComment.action",
			data: data_form,
			type: "POST",
			dataType: "JSON",
			success: function(json) {
				$.each(json, function(entryIndex, entry){
					var html = "<tr>";
					html += "<td style='font-weight: bold;' >"+entry.fk_userid+" : </td>";
					html += "<td>"+entry.cm_content+"</td>";
					html += "<td style='text-align: center;'>"+entry.cm_writeday+"</td>";
					html += "</tr>"
					
					$("#commentDisplay").prepend(html);
				});
			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		});
	}
	
</script>

<div style="padding-left: 25%;">
	<h3 style="margin-bottom: 30px;">게시판</h3>
	<div >
		<table id="table">
			<tr>
				<th style="font-size: 8pt;">번호: ${boardvo.boardno}</th>
	
				<th style="font-size: 12pt;">${boardvo.subject}</th>
				
				<th style="font-size: 8pt;">작성일: ${boardvo.writeday}</th>
			</tr>
		</table>
	</div>
	
	<div class="board-box-line-dashed"></div>
	
	<div>
		<table id="table">
			<tr>
				<th>아이디: ${boardvo.fk_userid}</th>
			</tr>
		</table>
	</div>
	
	<div>
		<table>
			<tr>
				<th>${boardvo.content}</th> 
			</tr>
		</table>
	</div>
	
	<br/><br/><br/>


		<table id="table">
				<tr>
					<th>첨부파일</th>
					<td>
					<c:if test="${sessionScope.loginuser != null}">
						<a href="<%= request.getContextPath() %>/download.action?boardno=${boardvo.boardno}">${boardvo.orgFilename}</a>
					</c:if>
					
					<c:if test="${sessionScope.loginuser == null}">
						${boardvo.orgFilename}
					</c:if>
						
					</td>
				</tr>
				<tr>
					<th>파일크기(bytes)</th>
					<td>${boardvo.fileSize}</td>
				</tr>
		</table>
	
	
		
	<br/>

	<button type="button" onClick="javascript:location.href='<%= request.getContextPath() %>/boardlist.action'">목록보기</button> 
	<button type="button" onClick="javascript:location.href='<%= request.getContextPath() %>/writeedit.action?boardno=${boardvo.boardno}'">수정</button>
	<button type="button" onClick="javascript:location.href='<%= request.getContextPath() %>/writedel.action?boardno=${boardvo.boardno}'">삭제</button>
	
	<br/>
	<br/>
	
		
		<a href="<%=request.getContextPath()%>/write.action" style="font-weight: bold; font-size: 10pt; color: black; ">
		<button type="button" style="margin-right: 30px;">
		<img src="resources/img/ico-btn-write.gif" style="margin-right:5px;">글쓰기</button>
		</a>
	
	
	
	<span style="margin-top: 3%; font-size: 16pt;"></span>
	
	<div class="table2" style="display: block;">

		<table id="table2" style="margin-top: 2%;">
			<tr>
				<th style="width: 8%; text-align: center;"></th>
				<th style="width: 67%; text-align: center;"></th>
				<th style="text-align: center;"></th>
			</tr>
			<tbody id="commentDisplay"></tbody>
			<c:if test="${not empty commentList}">
				<c:forEach var="commentvo" items="${commentList}">
					<tr>
						<td style="text-align: left; font-weight: bold;">${commentvo.fk_userid} : </td>
						<td>${commentvo.cm_content}</td>
						<td style="text-align: center;">${commentvo.cm_writeday}</td>
						<td><a href="#">수정</a></td>
						<td><a href="<%= request.getContextPath() %>/commentdeleteEnd.action">삭제</a></td>
					</tr>
					
				</c:forEach>
			</c:if> 
		</table>
		
		<div class="comment-box-line-dashed"></div>

	<form name="addWriteFrm" style="margin-bottom: 2%;">

	    <!-- 댓글에 달리는 원게시물 글번호(즉, 댓글의 부모글 글번호) -->	
		<input type="hidden" name="fk_boardno" value="${boardvo.boardno}" />
		<input type="hidden" name="fk_userid" value="${sessionScope.loginuser.userid}"/>
		
		<input type="text" name="cm_content" id="cm_content" size="80" style="line-height: 40px;"/>
		
		<button type="button" onClick="goWrite();">쓰기</button>
	<br/> 
		
	</form> 
	
</div>
	
		
	
</div>

