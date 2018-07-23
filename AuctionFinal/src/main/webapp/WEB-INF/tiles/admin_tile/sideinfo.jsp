<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- Left Panel -->

<aside id="left-panel" class="left-panel">
    <nav class="navbar navbar-expand-sm navbar-default">

        <div class="navbar-header">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#main-menu" aria-controls="main-menu" aria-expanded="false" aria-label="Toggle navigation">
                <i class="fa fa-bars"></i>
            </button>
            <a class="navbar-brand" href="<%=request.getContextPath() %>/adminMain.action"><img src="<%=request.getContextPath() %>/resources/images/logo-admin.png" alt="Logo"></a>
            <a class="navbar-brand hidden" href="<%=request.getContextPath() %>/adminMain.action"><img src="<%=request.getContextPath() %>/resources/images/logo2-admin.png" alt="Logo"></a>
        </div>

        <div id="main-menu" class="main-menu collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="active">
                    <a href="/auction/adminMain.action"> <i class="menu-icon fa fa-dashboard"></i>관리자 메인</a>
                </li>
                <h3 class="menu-title">Admin Menus</h3><!-- /.menu-title -->
			<!-- 관리 sideinfo 미완  -->
                <li class="menu-item-has-children dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-table"></i>게시판 관리</a>
                    <ul class="sub-menu children dropdown-menu">
                        <li><i class="fa fa-table"></i><a href="*.action">질문 게시판</a></li>
                        <li><i class="fa fa-table"></i><a href="<%=request.getContextPath()%>/admin/hugiList.action">후기 게시판</a></li>
                    </ul>
                </li>
                <li class="menu-item-has-children dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-list"></i>카테고리 관리</a>
                    <ul class="sub-menu children dropdown-menu">
                        <li><i class="fa fa-list"></i><a href="<%=request.getContextPath()%>/adminCategory.action">카테고리 등록&삭제</a></li>
                    </ul>
                </li>
                <li class="menu-item-has-children dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-users"></i>회원 관리</a>
                    <ul class="sub-menu children dropdown-menu">
                        <li><i class="fa fa-user"></i><a href="<%=request.getContextPath()%>/admin/memberList.action">회원 리스트</a></li>
                        <li><i class="fa fa-table"></i><a href="*.action">Data Table</a></li>
                    </ul>
                </li>
                <li class="menu-item-has-children dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa ti-credit-card"></i>주문/배송 관리</a>
                    <ul class="sub-menu children dropdown-menu">
                        <li><i class="fa fa-shopping-cart"></i><a href="<%=request.getContextPath()%>/admin/awardList.action">주문/배송 관리</a></li>
                    </ul>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </nav>
</aside><!-- /#left-panel -->

<!-- Left Panel -->