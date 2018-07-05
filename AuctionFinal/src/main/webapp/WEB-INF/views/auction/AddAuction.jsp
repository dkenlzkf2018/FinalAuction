<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="UTF-8" />
<title>상품 등록 페이지</title>
</head>
<body>
	
	<form name="addaboutauction">
	<table class="auction" id="addauction">
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
			<td><input type="text" id="startdate" /></td>
		</TR>
		<TR>
			<td class="names">경매종료일</td>
			<td><input type="text" id="startdate" /></td>
		</TR>
		<TR>
			<td><button>이미지추가</button></td>
			<td id="images"></td>
		</TR>
		<TR>
			<td class="names" colspan="2">내용</td>
		</TR>
		<TR>
			<td colspan="2"><TEXTAREA id="content" rows="6" cols="1"></TEXTAREA></td>
		</TR>
	</table>
	</form>
</body>
</html>