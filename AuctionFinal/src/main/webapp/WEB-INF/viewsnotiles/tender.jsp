<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SUPER AUCTION 경매 입찰</title>
</head>
<script type="text/javascript">
	function goInput() {
		var frm = inputTenderFrm;
		frm.method = "POST";
		frm.action = "inputTender.action";
		frm.submit();
	}
</script>
<body>
	<form name="inputTenderFrm">
	<table>
		<tr>
			<th>상품명</th>
			<td><input type="text" name="tenderprice" readonly/></td>
			<th>수량</th>
			<td><input type="text" name="tenderprice" readonly/></td>
			<th>입찰금</th>
			<td><input type="text" name="tenderprice" /></td>
		</tr>
	</table>
	<input type="hidden" name="actnum" value="${actnum}" />
	<button type="button" onclick="goInput()">입찰하기</button>
	</form>
</body>
</html>