<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">
	table, th, td {border: solid gray 1px;}
	
	#table {width: 300px; border-collapse: collapse;}
	
	#table th, #table td {padding: 5px;}
	#table th {width: 80px; background-color: #DDDDDD;}
	#table td {width: 200px;}
</style>

<script type="text/javascript">
	function goDelete() {
		var frm = document.delFrm;
		
		
		
		frm.action = "writedelEnd.action";
		frm.method = "post";
		frm.submit();
	}
</script>

<div style="padding-left: 10%;">
	<h3 style="margin-bottom: 50px;">게시글을 삭제하시겠습니까?</h3>
	
	<form name="delFrm">
		<table id="table">
			<tr>
				
				<td>
					<input type="hidden" name="boardno" value="${boardno}" />
					
				</td>
			</tr>
		</table>
		<br/>
		<button type="button" onClick="goDelete();">삭제</button>
		<button type="button" onClick="history.back();">취소</button>
	</form>
	
</div>
    