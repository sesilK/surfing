<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.PersonDao"%>
<%@ page import="dto.PersonDto"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file = "common.jsp" %>
<%-- 	<%
		String id = request.getParameter("id");
		PersonDao personDao = new PersonDao();
		PersonDto personDto = personDao.selectLogin(id);
	%> --%>
	
	<form name="loginForm" action="member_proc.jsp" method="post">
	    <input type="text" id="inputID" name="id" placeholder="아이디"><br>
        <input type="password" id="inputPW" name="pw" placeholder="비밀번호"><br>
      	<button type="button" id="loginBtn">로그인</button>
    	<a href="./signup.jsp"><button type="button">회원가입</button></a>
    </form>
   
	<script>

		document.getElementById('loginBtn').addEventListener('click', ()=>{
			
			let form = document.loginForm;
			
			let inputID = document.getElementById('inputID');
			let inputPW = document.getElementById('inputPW');
			
			if(inputID.value == ""){
				alert('아이디를 입력해주세요');
				inputID.focus();
			} else {
				if(inputPW.value == ""){
					alert('비밀번호를 입력해주세요');
					inputPW.focus();
				} else {
					<% 
	 				PersonDao personDao = new PersonDao();
					PersonDto personDto = personDao.selectLogin(inputID);
				%>
					
					
					form.submit();
				}
			}			
		});
	</script>
	
</body>
</html>