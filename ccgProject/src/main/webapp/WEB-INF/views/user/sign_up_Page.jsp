<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>회원가입</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/css/signup.css"/>
</head>
<body class="bg-light">
    
<div class="container">
  <main>
    <div class="py-5 text-center">
      <a href="/"><img class="mb-4" src="/img/icon/icons-wolf.png" alt=""></a>
      <h2>회원가입</h2>
    </div>
      <div>
        <form class="needs-validation" id="inputfrm" action="${paht }/user/insertUser.do" method="post" novalidate>
		  <hr class="my-4">
          <div class="row g-3">
            <div class="col-sm-7">
	            <label for="username" class="form-label">이름</label>
	            <input type="text" class="form-control" id="username" name="username" placeholder="Username" value="" required>
	            <div class="invalid-feedback">
	              이름을 입력해 주시기 바랍니다.
	            </div>
            </div>
            
            <div class="col-sm-7">
	            <label for="nickname" class="form-label">닉네임</label>
	            <input type="text" class="form-control" id="nickname" name="nickname" placeholder="Username" value="" required>
	            <div class="invalid-feedback">
	              닉네임을 입력해 주시기 바랍니다.
	            </div>
            </div>

            <div class="col-sm-7">
	            <label for="userId" class="form-label">아이디</label>
            	<input type="text" class="form-control" id="userId" name="userid" placeholder="UserId" required>
	            <font id="checkId" size="2"></font>
	            <div class="invalid-feedback">
	                아이디를 입력해 주시기 바랍니다.
             	</div>
            </div>
            
            <div class="col-sm-7">
	            <label for="userPW" class="form-label">비밀번호</label>
            	<input type="password" class="form-control" id="userPW" name="password" placeholder="대소문자,숫자,특수문자 포함 8자 이상" required>
	            <div class="invalid-feedback">
	                비밀번호를 입력해 주시기 바랍니다.
             	</div>
            </div>
            
            <div class="col-sm-7">
	            <label for="userPWC" class="form-label">비밀번호 확인</label>
            	<input type="password" class="form-control" id="userPWC" name="passwordc" placeholder="대소문자,숫자,특수문자 포함 8자 이상" required>
            	<font id="checkPWC" size="2"></font>
	            <div class="invalid-feedback">
	                비밀번호를 입력해 주시기 바랍니다.
             	</div>
            </div>

            <div class="col-sm-7">
	            <label for="email" class="form-label">이메일</label>
	            <input type="email" class="form-control" id="email" name="email" placeholder="you@example.com">
	            <div class="invalid-feedback">
	              주소를 입력해 주시기 바랍니다.
	            </div>
            </div>

            <div class="col-sm-7">
	            <label for="address" class="form-label">주소</label>
	            <input type="text" class="form-control" id="address" name="address" placeholder="" required>
	            <div class="invalid-feedback">
	              상세 주소를 입력해 주시기 바랍니다.
	            </div>
            </div>

            <div class="col-sm-7">
	            <label for="address2" class="form-label">상세 주소<span class="text-muted">(Optional)</span></label>
	            <input type="text" class="form-control" id="address2" name="address2" placeholder="">
            </div>

            <div class="col-sm-7">
	            <label for="phone" class="form-label">전화번호</label>
	            <input type="text" class="form-control" id="phone" name="phone" placeholder="-를 제외한 숫자" required>
	            <div class="invalid-feedback">
	              전화번호를 입력해 주시기 바랍니다.
	            </div>
            </div>
          </div>
          <hr class="my-4">
          <button class="w-100 btn btn-primary btn-lg" type="button" onClick="pwCheck()">Continue to checkout</button>
        </form>
      </div>
  </main>

  <footer class="my-5 pt-5 text-muted text-center text-small">
    <p class="mb-1">&copy; 2022 CCG 기술블로그</p>
    <ul class="list-inline">
      <li class="list-inline-item"><a href="${path }/user/msg.do">Privacy</a></li>
      <li class="list-inline-item"><a href="#">Terms</a></li>
      <li class="list-inline-item"><a href="#">Support</a></li>
    </ul>
  </footer>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>

	//Example starter JavaScript for disabling form submissions if there are invalid fields
	(function () {
	  'use strict'
	
	  // Fetch all the forms we want to apply custom Bootstrap validation styles to
	  var forms = document.querySelectorAll('.needs-validation')
	
	  // Loop over them and prevent submission
	  Array.prototype.slice.call(forms)
	    .forEach(function (form) {
	      form.addEventListener('submit', function (event) {
	        if (!form.checkValidity()) {
	          event.preventDefault()
	          event.stopPropagation()
	        }
	
	        form.classList.add('was-validated')
	      }, false)
	    })
	})()
	
	//아이디 중복 체크
	$('#userId').focusout(function(){
		let userid = $('#userId').val();
		
		$.ajax({
			url : "${path}/user/IdCheckService.do",
			type : "post",
			data : {userid: userid},
			dataType : 'json',
			success : function(result){
				if(result==0){
					$('#checkId').html('사용할 수 없는 아이디입니다.');
					$('#checkId').attr('color','red');
				}else{
					$('#checkId').html('사용할 수 있는 아이디입니다.');
					$('#checkId').attr('color','green');
				}
			},
			error : function(){
				alert("서버요청실패");
			}
		})
	})
	
	//비밀번호 체크 확인
	$('#userPWC').focusout(function(){
		let userPW = $('#userPW').val();
		let userPWC = $('#userPWC').val();
		
		if(userPW==userPWC){
			$('#checkPWC').html('비밀번호가 일치합니다.');
			$('#checkPWC').attr('color','green');
		}else{
			$('#checkPWC').html('비밀번호가 일치하지 않습니다.');
			$('#checkPWC').attr('color','red');
		}
	})
	
 	//비밀번호 정규식
	function pwCheck(){
		let reg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
		let userPW = $('#userPW').val();
		if(!reg.test(userPW)){
			alert("최소 8자, 하나 이상의 대문자,소문자,숫자,특수 문자 필요");
			return false;
		}else{
			$('#inputfrm').submit();
		}
	}
	
	
</script>
</html>