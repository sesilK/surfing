<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.PersonDao"%>
<%@ page import="dto.PersonDto"%>
<%@ page import="java.util.*"%>

<style>
#loginBox {
	width: 450px;
	margin-top: 60px;
	margin-bottom: 104px;
	padding: 50px;
	border: 1px solid rgb(240, 240, 240);
	position: relative;
}

.loginInput input {
	width: 250px;
	height: 40px;
	margin-bottom: 10px;
}

.Loginbutton {
	width: 350px;
}

.Loginbutton button {
	border: 1px solid rgb(240, 240, 240);
	color: white;
	background-color : rgba(0,0,0,0);
	width: 250px;
	height: 40px;
	cursor:pointer;
}

</style>

<%@ include file="common.jsp"%>

<%
//쿠키세션으로 로그인성공시 아이디 저장되는
String checked = "";
String inputid = "";
Cookie[] cookies = request.getCookies();
if (cookies != null && cookies.length > 0) {
	for (int i = 0; i < cookies.length; i++) {
		if (cookies[i].getName().equals("idsave")) {
	checked = "checked";
	inputid = cookies[i].getValue();
		}
	}
}
%>

<video muted autoplay loop style="position: absolute; top:480px; width: 900px;
	height: auto; opacity: 0.7;">
	<source src="./images/wavemov.mp4" type="video/mp4">
</video>
	
<form name="loginForm" action="member_proc.jsp" method="post">

	<div id="loginBox">	

		<div class="loginInput">
			<input type="text" id="inputID" name="id" placeholder="아이디"
				value="<%=inputid%>"><br> <input type="password"
				id="inputPW" name="pw" placeholder="비밀번호"><br>
		</div>
		
			<div class="Loginbutton">
				<button type="button" id="loginBtn">로그인</button><br>
				<span> 아이디 저장<input type="checkbox" name="idsave"
					value="saving" <%=checked%>><br><br><br>
				</span> 
					<a href="./signup.jsp"><p>회원가입</p></a>
					<a href="./missingID.jsp"><span>아이디 찾기 |</span></a>
					<a href="./missingPW.jsp"><span>비밀번호 찾기</span></a>
			</div>
		</div>

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

<%@ include file="footer.jsp"%>