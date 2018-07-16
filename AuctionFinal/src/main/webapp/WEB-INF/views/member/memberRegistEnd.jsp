<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
	if(${RegMember1 == 0}){
		alert("정보 수정에 실패하였습니다.");
		location.href="<%= request.getContextPath() %>/myInfoEdit.action";
	}
	else if(${RegMember1 == 1}){
		alert("정보 수정이 완료되었습니다.");
		location.href="<%= request.getContextPath() %>/myPage.action";
	}
</script>
