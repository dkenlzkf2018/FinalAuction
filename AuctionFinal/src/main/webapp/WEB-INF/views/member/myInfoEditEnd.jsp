<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
	if(${RegMember1 == 0}){
		alert("변경에 실패하였습니다. 다시 시도해 주세요");
		location.href="<%= request.getContextPath() %>/myInfoEdit.action";
	}
	else if(${RegMember1 == 1}){
		alert("변경에 성공하셨습니다.");
		location.href="<%= request.getContextPath() %>/myPage.action";
	}
</script>
