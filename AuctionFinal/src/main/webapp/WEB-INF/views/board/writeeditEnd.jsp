<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">

	if(${requestScope.n == 1}) {
		alert("수정되었습니다.");
		location.href="<%= request.getContextPath() %>/writeview.action?boardno=${boardno}";
		// 수정된 자신의 글을 보여주는 페이지로 이동
	}
	else {
		alert("글수정이 실패하였습니다.");
		location.href="<%= request.getContextPath() %>/boardlist.action";
	}

</script>
    