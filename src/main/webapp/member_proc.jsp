<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.PersonDao"%>
<%@ page import="dto.PersonDto"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.PrintWriter"%>

<jsp:useBean id="personDto" class="dto.PersonDto" scope="page" />
<jsp:setProperty name="personDto" property="id" />
<jsp:setProperty name="personDto" property="pw" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
    PersonDao personDao = new PersonDao();
    int result = personDao.login(personDto.getId(), personDto.getPw());
    if (result == 1){
    	session.setAttribute("id", personDto.getId());	//세션
		response.sendRedirect("./home.jsp");
    } else if (result == 0){
        PrintWriter script = response.getWriter();
        out.println("<script>");
        out.println("alert('비밀번호가 틀립니다.')");
        out.println("history.back()");
        out.println("</script>");
    } else if (result == -1){
        PrintWriter script = response.getWriter();
        out.println("<script>");
        out.println("alert('존재하지 않는 아이디입니다.')");
        out.println("history.back()");
        out.println("</script>");
    } else if (result == -2){
        PrintWriter script = response.getWriter();
        out.println("<script>");
        out.println("alert('데이터베이스 오류')");
        out.println("history.back()");
        out.println("</script>");
    }
%>
	
</body>
</html>