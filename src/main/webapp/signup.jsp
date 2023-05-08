<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }
    fieldset {
        width: 300px;
        border: 0;
    }
    input {
        display: inline-block;
    }
</style>
</head>	
<body>
    <%@ include file = "common.jsp" %>
	<form name="signupForm" action="signup_proc.jsp" method="post">
	    <h1>회원가입</h1>
	    <fieldset>
	        <input type="text" id="inputID" name="id" placeholder="아이디 입력">
	        <input type="password" id="inputPW" name="pw" placeholder="비밀번호 입력">
	        <input type="password" id="inputPW2" name="pw2" placeholder="비밀번호 확인">
	        <input type="text" id="inputName" name="name" placeholder="이름">
	        <input type="text" id="inputJumin" name="jumin" placeholder="주민번호">
	        <input type="text" id="inputAddress" name="address" placeholder="주소">
	        <input type="email" id="inputEmail" name="email" placeholder="이메일">
	    </fieldset>
	    <button id="insertBtn" type="button" class="btn btn-primary">가입</button>
	</form>

		<script>

		document.getElementById('insertBtn').addEventListener('click', ()=>{
			
			let form = document.signupForm;
			if(confirm('가입하시겠습니까?')){
				form.submit();
			}	
			
			/* let inputName = document.getElementById('inputName');
			if(inputName.value == ""){
				alert('이름은 필수입니다');
				inputName.focus();
			} else {
				if(confirm('추가하시겠습니까?')){
					form.submit();
				}				
			} */
		});
	</script>


</body>
</html>