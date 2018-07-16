<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- ===== #35. tiles 를 사용하는 레이아웃 페이지 만들기  ===== --%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <title>Super Auction</title>

  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

  <meta content="Metronic Shop UI description" name="description">
  <meta content="Metronic Shop UI keywords" name="keywords">
  <meta content="keenthemes" name="author">

  <meta property="og:site_name" content="-CUSTOMER VALUE-">
  <meta property="og:title" content="-CUSTOMER VALUE-">
  <meta property="og:description" content="-CUSTOMER VALUE-">
  <meta property="og:type" content="website">
  <meta property="og:image" content="-CUSTOMER VALUE-"><!-- link to image for socio -->
  <meta property="og:url" content="-CUSTOMER VALUE-">

  <link rel="shortcut icon" href="favicon.ico">

  <!-- Fonts START -->
  <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700|PT+Sans+Narrow|Source+Sans+Pro:200,300,400,600,700,900&amp;subset=all" rel="stylesheet" type="text/css">
  <link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900&amp;subset=all" rel="stylesheet" type="text/css"><!--- fonts for slider on the index page -->  
  <!-- Fonts END -->

  <!-- Global styles START -->          
  <link href="<%=request.getContextPath() %>/resources/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="<%=request.getContextPath() %>/resources/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Global styles END --> 
   
  <!-- Page level plugin styles START -->
  <link href="<%=request.getContextPath() %>/resources/assets/pages/css/animate.css" rel="stylesheet">
  <link href="<%=request.getContextPath() %>/resources/assets/plugins/fancybox/source/jquery.fancybox.css" rel="stylesheet">
  <link href="<%=request.getContextPath() %>/resources/assets/plugins/owl.carousel/assets/owl.carousel.css" rel="stylesheet">
  <!-- Page level plugin styles END -->

  <!-- Theme styles START -->
  <link href="<%=request.getContextPath() %>/resources/assets/pages/css/components.css" rel="stylesheet">
  <link href="<%=request.getContextPath() %>/resources/assets/pages/css/slider.css" rel="stylesheet">
  <link href="<%=request.getContextPath() %>/resources/assets/pages/css/style-shop.css" rel="stylesheet" type="text/css">
  <link href="<%=request.getContextPath() %>/resources/assets/corporate/css/style.css" rel="stylesheet">
  <link href="<%=request.getContextPath() %>/resources/assets/corporate/css/style-responsive.css" rel="stylesheet">
  <link href="<%=request.getContextPath() %>/resources/assets/corporate/css/themes/red.css" rel="stylesheet" id="style-color">
  <link href="<%=request.getContextPath() %>/resources/assets/corporate/css/custom.css" rel="stylesheet">
  
  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery-2.0.0.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
  <!-- Theme styles END -->
  
<link href="<%=request.getContextPath() %>/resources/smarteditor/css/smart_editor2.css" rel="stylesheet" type="text/css">

  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/smarteditor/js/lib/jindo2.all.js" charset="utf-8"></script>
  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/smarteditor/js/lib/jindo_component.js" charset="utf-8"></script>
  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/smarteditor/js/SE2M_Configuration.js" charset="utf-8"></script>	<!-- 설정 파일 -->
  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/smarteditor/js/SE2BasicCreator.js" charset="utf-8"></script>
  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/smarteditor/js/smarteditor2.min.js" charset="utf-8"></script> 


  <!-- 사진첨부샘플  --> 
  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/smarteditor/sample/js/plugin/hp_SE2M_AttachQuickPhoto.js" charset="utf-8"></script> 
  
  <%-- 스마트 에디터 구현 끝(no frame 사용시) --%>    
      
   
  <%-- 스마트 에디터 구현 시작(iframe 사용시) --%>  
  <%-- 
  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>  
  --%>
  <%-- 스마트 에디터 구현 끝(iframe 사용시) --%> 
  
<!-- ------------------------------------------------------------------------------------------------------- -->
</head>

<body>
	<div id="mycontainer">
		<div id="myheader">
			<tiles:insertAttribute name="header" />
		</div>
	
		<div id="mycontent">
			<tiles:insertAttribute name="content" />
		</div>
	
		<div id="myfooter">
			<tiles:insertAttribute name="footer" />
		</div>
	</div>
    <!-- Load javascripts at bottom, this will reduce page load time -->
    <!-- BEGIN CORE PLUGINS (REQUIRED FOR ALL PAGES) -->
    <!--[if lt IE 9]>
    <script src="assets/plugins/respond.min.js"></script>  
    <![endif]-->
    <script src="<%=request.getContextPath()%>/resources/assets/plugins/jquery.min.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/resources/assets/plugins/jquery-migrate.min.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/resources/assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>      
    <script src="<%=request.getContextPath()%>/resources/assets/corporate/scripts/back-to-top.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/resources/assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
    <!-- END CORE PLUGINS -->

    <!-- BEGIN PAGE LEVEL JAVASCRIPTS (REQUIRED ONLY FOR CURRENT PAGE) -->
    <script src="<%=request.getContextPath()%>/resources/assets/plugins/fancybox/source/jquery.fancybox.pack.js" type="text/javascript"></script><!-- pop up -->
    <script src="<%=request.getContextPath()%>/resources/assets/plugins/owl.carousel/owl.carousel.min.js" type="text/javascript"></script><!-- slider for products -->
    <script src='<%=request.getContextPath()%>/resources/assets/plugins/zoom/jquery.zoom.min.js' type="text/javascript"></script><!-- product zoom -->
    <script src="<%=request.getContextPath()%>/resources/assets/plugins/bootstrap-touchspin/bootstrap.touchspin.js" type="text/javascript"></script><!-- Quantity -->

    <script src="<%=request.getContextPath()%>/resources/assets/corporate/scripts/layout.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/resources/assets/pages/scripts/bs-carousel.js" type="text/javascript"></script>
    <script type="text/javascript">
        jQuery(document).ready(function() {
            Layout.init();    
            Layout.initOWL();
            Layout.initImageZoom();
            Layout.initTouchspin();
            Layout.initTwitter();
        });
    </script>
    <!-- END PAGE LEVEL JAVASCRIPTS -->
</body>
</html>