<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>회원 로그인</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/css/signin.css"/>
</head>
<body class="text-center">
	<main class="form-signin">
		<form action="${paht }/user/login.do" method="post">
			<a href="/"><img class="mb-4" src="/img/icon/icons-wolf.png" alt="" width="72" height="72"></a>
			<h1 class="h3 mb-3 fw-normal">Login</h1>
			
			<div class="form-floating">
				<input type="text" class="form-control" id="floatingInput" name="userid" placeholder="name@example.com">
				<label for="floatingInput">UserID</label>
			</div>
			<div class="form-floating">
				<input type="password" class="form-control" id="floatingPassword" name="password" placeholder="Password">
				<label for="floatingPassword">Password</label>
			</div>
			
			<div class="checkbox mb-3">
			</div>
			<button class="w-100 btn btn-lg btn-primary" type="submit">Sign in</button>
			<p class="mt-5 mb-3 text-muted">© 2022 CCG 기술블로그</p>
		</form>
	</main>
	
<script>

	if("${msg}" != null&&"${msg}" != ""){
		alert("${msg}");
	}
	
	//로그인후 뒤로가기 막기
	window.history.forward();
	function noBack(){
		window.history.forward();
	}
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>