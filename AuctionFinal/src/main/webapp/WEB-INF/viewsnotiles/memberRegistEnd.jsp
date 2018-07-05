<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
	if(${map == null}){
		alert("가입실패");
		location.href="<%= request.getContextPath() %>/memberRegist.action";
	}
	else if(${map != null}){
		alert("가입성공");
		location.href="<%= request.getContextPath() %>/login.action";
	}
</script>
