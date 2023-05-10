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
	        <input type="hidden" name="hiddencheckid" value="0">
	        <input type="password" name="pw" placeholder="비밀번호 입력">
	        <input type="password" name="pw2" placeholder="비밀번호 확인">
	        <input type="text" name="name" placeholder="이름">
	        <input type="text" name="jumin" placeholder="주민번호">
	        <input type="text" name="address" placeholder="주소">
	        <input type="email" name="email" placeholder="이메일">
	        <span id="idResult"></span>
	    	<input type="submit" value="가입">
	    	</Fieldset>
		</form>

		<script type="text/javascript">
	
		
		function checkDuplicateId() {
		    var id = document.getElementById("id").value;
		    location.href = "./signup_idCheck.jsp?id=" + id;
		}


		/*document.getElementById('insertBtn').addEventListener('click', ()=>{
			
			let form = document.signupForm;
			if(confirm('가입하시겠습니까?')){
				form.submit();
			}
		})			
			/* let inputName = document.getElementById('inputName');
			if(inputName.value == ""){
				alert('이름은 필수입니다');
				inputName.focus();
			} else {
				if(confirm('추가하시겠습니까?')){
					form.submit();
				}				
			} 
		})*/
		
	</script>


</body>
</html>