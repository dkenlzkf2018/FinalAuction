<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="UTF-8" />
<title>상품 등록 페이지</title>

<STYLE type="text/css">
	#addauction {
		width:800px;
	}
	.names {
		text-align:right;
		font-weight:bold;
		font-size: 14pt;
	}
</STYLE>

<SCRIPT type="text/javascript">
	function submit() {
		
	}
</SCRIPT>
</head>
<body>
	
	<form name="addaboutauction">
	<div class="row">
	<div class="col-lg-1"></div>
	<div class="col-lg-10">
	<table class="table" id="addauction">
		<tr>
			<td class="names">아이디</td>
			<td><input type="text" value="${sessionScope.loginuser.userid}" readonly/></td>
		</tr>
		<TR>
			<td class="names">경매시작가격</td>
			<td><input type="text" /></td>
		</TR>
		<TR>
			<td class="names">즉시구매가격</td>
			<td><input type="text" /></td>
		</TR>
		<TR>
			<td class="names">최저입찰가</td>
			<td><input type="text" /></td>
		</TR>
		<TR>
			<td class="names">경매시작일</td>
			<td><div class="col-lg-5 col-sm-5"><input type="date" id="startdate" name="startdate" class="form-control" readonly/></div></td>
		</TR>
		<TR>
			<td class="names">경매종료일</td>
			<td><div class="col-lg-5 col-sm-5"><input type="date" id="enddate" name="enddate" class="form-control"></div></td>
		</TR>
		<TR>
			<td class="names">판매수량</td>
			<td>  <input type="number" name="quantity" min="1" max="100" step="10" value="1"></td>
		</TR>
		<TR>
       		<td class="names">이미지</td>
       		<td><input type="file" name="attach"/></td>
		</TR>
		<TR>
			<td class="names" colspan="2" style="text-align:center;">내용</td>
		</TR>
		<TR>
			<td colspan="2"><div align="center"><TEXTAREA id="content" rows="6" cols="90%"></TEXTAREA></div></td>
		</TR>
		<tr>
			<td colspan="2">
				<div align="center">	
				<button type="button" class="btn" onClick="submit()">상품등록</button>
				<button type="button" class="btn" onClick="javascript:goBack()">취소</button>
				</div>
			</td>
		</tr>
	</table>
	<br/>

	</div>
	</div>
	</form>
</body>
</html>