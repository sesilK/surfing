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
	<%
	PersonDao personDao = new PersonDao();
	PersonDto personDto = personDao.selectLogin(id);
	%>
	<script>
		location.href = './home.jsp?id=<%personDto.getId()%>'; 
	</script>
	
</body>
</html>