<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
	if(${RegMember1 == 0}){
		alert("가입에 실패하였습니다. 다시 시도해 주세야");
		location.href="<%= request.getContextPath() %>/memberRegist.action";
	}
	else if(${RegMember1 == 1}){
		alert("환영합니다.");
		location.href="<%= request.getContextPath() %>/login.action";
	}
</script>
