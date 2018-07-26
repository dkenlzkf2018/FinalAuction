<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- ======= #19. tiles 를 사용하는 레이아웃 페이지 만들기  ======= --%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Super Auction Admin</title>
    <meta name="description" content="Super Auction Admin">
    <meta name="viewport" content="width=device-width, initial-scale=1">

  	<link rel="icon" href="<%=request.getContextPath()%>/resources/images/favicon.ico">

    <!-- <link rel="apple-touch-icon" href="apple-icon.png"> --> 
    <!-- <link rel="shortcut icon" href="favicon.ico"> -->

    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets-admin/css/normalize.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets-admin/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets-admin/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets-admin/css/themify-icons.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets-admin/css/flag-icon.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets-admin/css/cs-skin-elastic.css">
    <!-- <link rel="stylesheet" href="assets/css/bootstrap-select.less"> -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets-admin/scss/style.css">
    <link href="<%=request.getContextPath()%>/resources/assets-admin/css/lib/vector-map/jqvmap.min.css" rel="stylesheet">

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>

    <!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->

</head>

<body>
		<tiles:insertAttribute name="sideinfo" />
	<div id="right-panel" class="right-panel">
			<tiles:insertAttribute name="header" />
			<tiles:insertAttribute name="content" />
	</div>

</body>
</html>