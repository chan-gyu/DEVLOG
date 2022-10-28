<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title><c:out value="${param.title }"/></title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/css/common.css"/>
<link rel="stylesheet" type="text/css" href="/css/sidebars.css"/>
<!-- 에디터  -->
<script src="/lib/ckeditor/ckeditor.js"></script>
<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<script>
	/* global bootstrap: false */
	(function () {
		'use strict'
		var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
		tooltipTriggerList.forEach(function (tooltipTriggerEl) {
		  new bootstrap.Tooltip(tooltipTriggerEl)
		})
	})()

</script>
<body>
<div id="header">
	<div id="header-wrap">
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark" aria-label="Eighth navbar example">
			<div class="container" id="header_container">
				<a class="navbar-brand" href="/" >CCG's Devlog</a>
				<button class="navbar-toggler" id="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample07" aria-controls="navbarsExample07" aria-expanded="false" aria-label="Toggle navigation">
				  <span class="navbar-toggler-icon"></span>
				</button>
				<!-- 
				<div>
					<a href="#"><img class="mb-4" src="/img/icon/icons-wolf.png" alt=""></a>
				</div>
				-->
				<div class="collapse navbar-collapse" id="navbarsExample07">
					<div id="MainIcon">
						<a href="/admin/Admin_Page.do"><img src="/img/icon/icons-admin-wolf.png" alt="" style="padding-right:80px;"></a>
					</div>
					<div class="text-end">
			        	<button type="button" class="btn btn-warning" onClick="location.href='${path}/user/logout.do'">로그아웃</button>
			        </div>
					<!-- <form>
						<input class="form-control" type="text" placeholder="Search" aria-label="Search">
					</form> -->
				</div>
			</div>
		</nav>
	</div>
</div>
<div id="Main-Wrapper">
	<div class="container-fluid">
		<div class="row flex-nowrap">
			<div id="admin_SideMenu" class="col-auto col-md-3 col-xl-2 px-sm-2 px-0 bg-dark">
				<div class="d-flex flex-column align-items-center align-items-sm-start px-3 text-white min-vh-100" style="height:100%; padding-top:15%">
				    <a href="/" class="d-flex align-items-center pb-3 mb-md-0 me-md-auto text-white text-decoration-none">
				        <span class="fs-5 d-none d-sm-inline">Menu</span>
				    </a>
				    <ul class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-center align-items-sm-start" id="menu">
				        <li class="nav-item">
				            <a href="/admin/Admin_Page.do" class="nav-link align-middle px-0">
				                <i class="fs-4 bi-house"></i><img src="/img/icon/icons8-home-16.png"><span class="ms-1 d-none d-sm-inline">Home</span>
				            </a>
				        </li>
				        <li>
				            <a href="#submenu1" data-bs-toggle="collapse" class="nav-link px-0 align-middle">
				                <i class="fs-4 bi-speedometer2"></i><img src="/img/icon/icons8-user-16.png"><span class="ms-1 d-none d-sm-inline">User</span></a>
				            <ul class="collapse nav flex-column ms-1" id="submenu1" data-bs-parent="#menu">
				                <li class="w-100">
				                    <a href="/admin/userList.do" class="nav-link px-0"> <span class="d-none d-sm-inline"> </span> UserList </a>
				                </li>
				                <li>
				                    <a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline"> </span> List </a>
				                </li>
				            </ul>
				        </li>
				        <li>
				            <a href="#submenu1" data-bs-toggle="collapse" class="nav-link px-0 align-middle">
				                <i class="fs-4 bi-table"></i> <img src="/img/icon/icons8-noticeboard-16.png"><span class="ms-1 d-none d-sm-inline">Board</span></a>
				            <ul class="collapse nav flex-column ms-1" id="submenu1" data-bs-parent="#menu">
				                <li class="w-100">
				                    <a href="/admin/category_page.do" class="nav-link px-0"> <span class="d-none d-sm-inline"> </span> Category </a>
				                </li>
				                <li>
				                    <a href="/admin/move_admin_board_List.do" class="nav-link px-0"> <span class="d-none d-sm-inline"> </span> BoardList </a>
				                </li>
				                <li>
				                    <a href="/admin/admin_board_write.do" class="nav-link px-0"> <span class="d-none d-sm-inline"> </span> Insert </a>
				                </li>
				            </ul>
				        </li>
				        <li>
				            <a href="#submenu2" data-bs-toggle="collapse" class="nav-link px-0 align-middle ">
				                <i class="fs-4 bi-bootstrap"></i> <span class="ms-1 d-none d-sm-inline">Bootstrap</span></a>
				            <ul class="collapse nav flex-column ms-1" id="submenu2" data-bs-parent="#menu">
				                <li class="w-100">
				                    <a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline">Item</span> 1</a>
				                </li>
				                <li>
				                    <a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline">Item</span> 2</a>
				                </li>
				            </ul>
				        </li>
				        <li>
				            <a href="#submenu3" data-bs-toggle="collapse" class="nav-link px-0 align-middle">
				                <i class="fs-4 bi-grid"></i> <span class="ms-1 d-none d-sm-inline">Products</span> </a>
				                <ul class="collapse nav flex-column ms-1" id="submenu3" data-bs-parent="#menu">
				                <li class="w-100">
				                    <a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline">Product</span> 1</a>
				                </li>
				                <li>
				                    <a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline">Product</span> 2</a>
				                </li>
				                <li>
				                    <a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline">Product</span> 3</a>
				                </li>
				                <li>
				                    <a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline">Product</span> 4</a>
				                </li>
				            </ul>
				        </li>
				        <li>
				            <a href="#" class="nav-link px-0 align-middle">
				                <i class="fs-4 bi-people"></i> <span class="ms-1 d-none d-sm-inline">Customers</span> </a>
				        </li>
				    </ul>
				    <hr>
				    <div class="dropdown pb-4">
				        <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
				            <img src="/img/icon/icons-admin-profile.png" alt="hugenerd" width="30" height="30" class="rounded-circle">
				            <span class="d-none d-sm-inline mx-1">Admin</span>
				        </a>
				        <ul class="dropdown-menu dropdown-menu-dark text-small shadow">
				            <li><a class="dropdown-item" href="#">New project...</a></li>
				            <li><a class="dropdown-item" href="#">Settings</a></li>
				            <li><a class="dropdown-item" href="#">Profile</a></li>
				            <li>
				                <hr class="dropdown-divider">
				            </li>
				            <li><a class="dropdown-item" href="#">Sign out</a></li>
				        </ul>
				    </div>
				</div>
			</div>
