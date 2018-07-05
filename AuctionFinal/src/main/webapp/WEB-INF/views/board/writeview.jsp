<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">

	#table, #table2 {width: 1000px; border-collapse: collapse;}
	
	.board-box-line-dashed { width: 820px;
							 border-bottom-style: dashed;
    						 border-bottom-width: 1px;}
  
	
	#table th, #table td {padding: 5px;}
	#table th {width: 120px;}
	#table td {width: 400px;}

	a{text-decoration: none;}

</style>

<script type="text/javascript">
	
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
		
		var contentval = frm.content.value.trim();
		
		if(contentval == "") {
			alert("댓글 내용을 입력하세요.");
			return;
		}
		
		var data_form = {fk_userid : frm.fk_userid.value,
				         content: contentval,
				         fk_boardno: frm.fk_boardno.value};
		
		$.ajax({
			url:"<%= request.getContextPath() %>/writeComment.action",
			data: data_form,
			type: "POST",
			dataType: "JSON",
			success: function(json) {
				$.each(json, function(entryIndex, entry){
					var html = "<tr>";
					html += "<td style='text-align: center;'>"+entry.fk_userid+"</td>";
					html += "<td>"+entry.content+"</td>";
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

<div style="padding-left: 10%;">
	<h3 style="margin-bottom: 30px;">내용보기</h3>
	<div>
		<table id="table">
			<tr>
				<th style="font-size: 8pt;">번호: ${boardvo.boardno}</th>
	
				<th>제목: ${boardvo.subject}</th>
				
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
	<button type="button" onClick="javascript:location.href='<%= request.getContextPath() %>/${goBackURL}'">목록보기</button> 
	<button type="button" onClick="javascript:location.href='<%= request.getContextPath() %>/writeedit.action?boardno=${boardvo.boardno}'">수정</button>
	<button type="button" onClick="javascript:location.href='<%= request.getContextPath() %>/writedel.action?boardno=${boardvo.boardno}'">삭제</button>
	
	<br/>
	<br/>
	
	<!-- ==== #120. 답변글쓰기 버튼 추가하기(현재 보고 있는 글이 작성하려는 답변글의 원글(부모글)이 된다.) ====  -->
	<button type="button" onClick="javascript:location.href='<%= request.getContextPath() %>/write.action?fk_boardno=${boardvo.boardno}&groupno=${boardvo.groupno}&depthno=${boardvo.deptthno}'">답변쓰기</button> 
	<br/>
	
	<p style="margin-top: 3%; font-size: 16pt;">댓글쓰기</p>
	<!-- ==== #84. 댓글쓰기 form 추가 ==== -->
	<form name="addWriteFrm">
		아이디 : <input type="text"  name="name" value="${sessionScope.loginuser.userid}" readonly /> 
		내용 : <input type="text" name="content" size="90" />
	    
	    <!-- 댓글에 달리는 원게시물 글번호(즉, 댓글의 부모글 글번호) -->	
		<input type="hidden" name="fk_boardno" value="${boardvo.boardno}" />
		
		<button type="button" onClick="goWrite();">쓰기</button>
		
	</form> 
	
	<!-- ==== #95. 댓글 내용 보여주기 ==== -->
		<table id="table2" style="margin-top: 2%;">
			<tr>
				<th style="width: 15%; text-align: center;">댓글작성자</th>
				<th style="width: 67%; text-align: center;">내용</th>
				<th style="text-align: center;">작성일자</th>
			</tr>
			<tbody id="commentDisplay"></tbody>
			<c:if test="${not empty commentList}">
				<c:forEach var="commentvo" items="${commentList}">
					<tr>
						<td style="text-align: center;">${commentvo.fk_userid}</td>
						<td>${commentvo.cm_content}</td>
						<td style="text-align: center;">${commentvo.cm_writeday}</td>
					</tr>
				</c:forEach>
			</c:if> 
		</table>
	
</div>
