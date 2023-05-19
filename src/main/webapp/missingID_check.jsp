<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dto.PersonDto"%>
<%@page import="dao.PersonDao"%>
<%@ include file = "common.jsp" %>
<%

	String name = request.getParameter("name");
	String email = request.getParameter("email");

	PersonDao personDao = new PersonDao();
	
	PersonDto personDto = personDao.missingPersonInfoById(name,email);
	
	id = personDto.getId();
	%>	<br><br><br>
		<p>당신의 아이디는 "<%=id%>" 입니다.</p>
		<p>비밀번호를 잊으셧다면 "<%= email%>"으로 메일 보내드리겠습니다.</p>
		<br><br>
		<input type="button" onclick="sendMail()" value="비밀번호 메일받기">
		<br><br><br><br><br>
	<script type="text/javascript">

	function sendMail() {
		location.href = "missingPW_mail.jsp?id=<%=id%>&email=<%=email%>";
	}

	</script>
	
<%@ include file="footer.jsp"%>