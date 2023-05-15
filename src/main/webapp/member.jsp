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
	
	<% //쿠키세션으로 로그인성공시 아이디 저장되는
	String checked = "";
	String inputid = "";
	Cookie[] cookies = request.getCookies();
	if(cookies != null && cookies.length > 0){
		for(int i = 0; i<cookies.length; i++){
			if(cookies[i].getName().equals("idsave")){
				checked = "checked";
				inputid = cookies[i].getValue();
			}
		}
	}
%>
	
	
	<form name="loginForm" action="member_proc.jsp" method="post">
	    <input type="text" id="inputID" name="id" placeholder="아이디" value="<%= inputid %>"><br>
        <input type="password" id="inputPW" name="pw" placeholder="비밀번호"><br>
        아이디 저장<input type="checkbox" name="idsave" value="saving" <%= checked %>><br>
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
					form.submit();
				}
			}			
		});
		
		//엔터키 입력시 로그인 버튼 누른 효과
		function loginBtnPress(event) {
			  if (event.key === "Enter") {
			    document.getElementById("loginBtn").click();
			  }
			}
		document.addEventListener("keydown", loginBtnPress);
		
	</script>
	
</body>
</html>