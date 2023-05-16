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
    	<h1>회원가입</h1>
		<form name="signupForm" action="signup_proc.jsp" method="post">
			<Fieldset>
	        <input type="text" id="id" name="id" placeholder="아이디 입력">
	        <input type="button" name="checkid" value="중복확인" onclick="checkDuplicateId()">
	        <input type="password" name="pw" placeholder="비밀번호 입력">
	        <input type="password" name="pw2" placeholder="비밀번호 확인">
	        <div id="pw2-error" style="color: red"></div>
	        <input type="text" name="name" placeholder="이름">
	        <input type="text" name="address" placeholder="주소">
	        <input type="email" name="email" placeholder="이메일">
	    	<input type="button" id="result" value="가입">
	    	</Fieldset>
		</form>

		<script type="text/javascript">
	
		
		function checkDuplicateId() {
		    var id = document.getElementById("id").value;
		    location.href = "./signup_idCheck.jsp?id=" + id;
		}
		function isValidEmail(email) {
	        // 이메일 형식 검사
	        const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
	        return emailRegex.test(email);
	    }

		document.getElementById('result').addEventListener('click', ()=>{
		    let form = document.signupForm;
		    let requiredFields = ['id', 'pw', 'pw2', 'name', 'address', 'email'];
		    let isComplete = true;
		    for (let field of requiredFields) {
		        let value = form[field].value.trim();
		        if (value === '') { // 필드값이 빈 문자열인지 확인
		            alert('빈칸이 있습니다.');
		            form[field].focus();
		            isComplete = false;
		            break;
		        }else if (field === 'email' && !isValidEmail(value)) { // 이메일 필드이며, 입력값이 이메일 형식이 아닐 경우
	                alert('이메일 형식이 올바르지 않습니다.');
	                form[field].focus();
	                isComplete = false;
	                break;
	            }
		    }
		    if (isComplete) {
		        if (form.pw.value !== form.pw2.value) {
		            document.getElementById('pw2-error').textContent = "비밀번호가 일치하지 않습니다.";
		            form.pw2.focus();
		            isComplete = false;
		        } else {
		            document.getElementById('pw2-error').textContent = "";
		        }
		        if (isComplete && confirm('가입하시겠습니까?')) {
		            form.submit();
		        }
		    }
		});
	</script>


</body>
</html>