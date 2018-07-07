<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- ======= #19. tiles 를 사용하는 레이아웃 페이지 만들기  ======= --%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Sufee Admin - HTML5 Admin Template</title>
    <meta name="description" content="Sufee Admin - HTML5 Admin Template">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="apple-icon.png">
    <link rel="shortcut icon" href="favicon.ico">

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
	<script src="<%=request.getContextPath()%>/resources/assets-admin/js/vendor/jquery-2.1.4.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/assets-admin/js/plugins.js"></script>
    <script src="<%=request.getContextPath()%>/resources/assets-admin/js/main.js"></script>


    <script src="<%=request.getContextPath()%>/resources/assets-admin/js/lib/chart-js/Chart.bundle.js"></script>
    <script src="<%=request.getContextPath()%>/resources/assets-admin/js/dashboard.js"></script>
    <script src="<%=request.getContextPath()%>/resources/assets-admin/js/widgets.js"></script>
    <script src="<%=request.getContextPath()%>/resources/assets-admin/js/lib/vector-map/jquery.vmap.js"></script>
    <script src="<%=request.getContextPath()%>/resources/assets-admin/js/lib/vector-map/jquery.vmap.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/assets-admin/js/lib/vector-map/jquery.vmap.sampledata.js"></script>
    <script src="<%=request.getContextPath()%>/resources/assets-admin/js/lib/vector-map/country/jquery.vmap.world.js"></script>
    <script>
        ( function ( $ ) {
            "use strict";

            jQuery( '#vmap' ).vectorMap( {
                map: 'world_en',
                backgroundColor: null,
                color: '#ffffff',
                hoverOpacity: 0.7,
                selectedColor: '#1de9b6',
                enableZoom: true,
                showTooltip: true,
                values: sample_data,
                scaleColors: [ '#1de9b6', '#03a9f5' ],
                normalizeFunction: 'polynomial'
            } );
        } )( jQuery );
    </script>
</body>
</html>