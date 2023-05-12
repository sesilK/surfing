<%@page import="dto.PersonDto"%>
<%@page import="dao.PersonDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
		request.setCharacterEncoding("UTF-8");	//한글 정상 인식을 위해
		String id = request.getParameter("id");	
		
		PersonDao personDao = new PersonDao();
		PersonDto personDto = personDao.selectPersonInfoById(id);
		boolean useAble = personDto == null;
		
		if(useAble) {
			out.println("<script>alert('사용 가능한 아이디');</script>");
			out.println("<script>history.back();</script>");
		} else {
			out.println("<script>alert('중복된 아이디');</script>");
			out.println("<script>history.back();</script>");
		}
%>
</body>
</html>