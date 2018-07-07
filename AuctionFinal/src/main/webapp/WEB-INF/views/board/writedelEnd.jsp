<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">

	if(${requestScope.n == 1}) {
		alert("삭제되었습니다.");
		location.href="<%= request.getContextPath() %>/boardlist.action";
	}
	else {
		alert("글삭제가 실패하였습니다.");
		javascript:history.back(); // 이전 페이지로 이동
	}

</script>
    