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
		
		var yn = confirm("삭제하시겠습니까? 삭제한 게시물은 복구 되지 않습니다.");
		
	   if(yn==false) { // 취소를 선택한 경우
		   	 return;
		   	alert("취소되었습니다.");
	      }
	  		 
	   else { // 확인을 선택

	   var frm = document.delFrm;

		frm.action = "writedelEnd.action";
		frm.method = "post";
		frm.submit();
	    }
	   		
	}
</script>

<div style="padding-left: 10%;">
	<h3 style="margin-bottom: 50px;">게시물 삭제</h3>
	
	<form name="delFrm">
		<table id="table">
			<tr>
				<td>
					<input type="text" name="boardno" value="${boardno}"/>
				</td>
			</tr>
			
		</table>
		<br/>
		<button type="button" onClick="goDelete();">삭제</button>
		<button type="button" onClick="history.back();">취소</button>
	</form>
	
</div>
    