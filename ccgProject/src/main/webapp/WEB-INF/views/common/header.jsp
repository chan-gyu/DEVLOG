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
</head>
<body>
<div id="header">
	<div id="header-wrap">
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark" aria-label="Eighth navbar example">
			<div class="container" id="header_container">
				<a class="navbar-brand" href="/" >CCG's Devlog</a>
				<button class="navbar-toggler" type="button" id="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarsExample07" aria-controls="navbarsExample07" aria-expanded="false" aria-label="Toggle navigation">
				  <span class="navbar-toggler-icon"></span>
				</button>
				<!-- 
				<div>
					<a href="#"><img class="mb-4" src="/img/icon/icons-wolf.png" alt=""></a>
				</div>
				-->
				<div class="collapse navbar-collapse" id="navbarsExample07">
					<div id="MainIcon">
						<a href="/"><img src="/img/icon/icons-wolf.png" alt="" style="background-color:#212529;"></a>
					</div>
					<div class="text-end">
						<c:if test='${loginUser == null}'>
							<button type="button" class="btn btn-outline-light me-2" onClick="location.href='${path}/user/login_Page.do'">로그인</button>
			        		<button type="button" class="btn btn-outline-light me-2" onClick="location.href='${path}/user/sign_up_Page.do'">회원가입</button>
						</c:if>
						<c:if test='${loginUser !=null && (loginUser.userid).equals("admin") }'> <!-- 관리자 -->
				        	<button type="button" class="btn btn-warning" onClick="location.href='${path}/admin/Admin_Page.do'">관리자</button>
				        	<button type="button" class="btn btn-warning" onClick="location.href='${path}/user/logout.do'">로그아웃</button>
						</c:if>
						<c:if test='${loginUser !=null && !(loginUser.userid).equals("admin") }'> <!-- 유저 -->
				        	<button type="button" class="btn btn-outline-light me-2" onClick="location.href='${path}/user/MyPage.do'">마이페이지</button>
				        	<button type="button" class="btn btn-warning" onClick="location.href='${path}/user/logout.do'">로그아웃</button>
						</c:if>
			        </div>
					<!-- <form>
						<input class="form-control" type="text" placeholder="Search" aria-label="Search">
					</form> -->
				</div>
			</div>
		</nav>
	</div>
</div>
