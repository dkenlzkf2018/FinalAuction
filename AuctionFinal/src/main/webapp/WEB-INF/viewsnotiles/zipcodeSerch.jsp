<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우편번호 찾기</title>
</head>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/style.css">
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.3.1.min.js"></script>

<script type="text/javascript">

	$(document).ready(function(){
		
		$("#error").hide();
		
		$("#dong").keydown(function(event){
			
			if(event.keyCode == 13) {
				// 엔터를 했을 경우
				goSearch();
			}
		}); 
			
	}); // end of $(document).ready()------------------------

	
	function goSearch() {
        
		var dong = $("#dong").val().trim();
		
		if(dong == "") {
			$("#error").show();
			$("#dong").val("");
			$("#dong").focus();
			return;
		}
		else {
			$("#error").hide();
			
			var frm = document.frmZipcode;
			frm.method = "post";
			frm.action = "zipcodeInfo.action";
			frm.submit();
		}
		
	}// end of goSearch()--------------

</script>


</head>
<body style="background-color: #fff0f5;">
	<form name="frmZipcode" action="zipcodeInfo.action" method="post">
	<table style="width: 95%; height: 90%;">
		<tr align="center">
			<td>
			  동이름 :&nbsp;<input type="text" name="dong" id="dong" size="20" class="box" />
			 <button type="button" class="box" onClick="goSearch();" id="goSearch">검색</button>      
			</td>
		</tr>
		<tr align="center">
			<td>
				(검색예: 오금, 다산아파트)
			</td>
		</tr>
		<tr align="center">
			<td>
				<span style="color: red; font-size: 16pt; font-weight: bold;" id="error">동이름을 입력하세요</span>
			</td>
		</tr>
	</table>
	</form>
</body>
</html>