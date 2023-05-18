<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dto.PersonDto"%>
<%@page import="dao.PersonDao"%>
<%@ include file = "common.jsp" %>
<%

	String name = request.getParameter("name");
	String idd = request.getParameter("id");
	String email = request.getParameter("email");

	PersonDao personDao = new PersonDao();
	
	PersonDto personDto = personDao.missingPersoninfoPW(name,id,email);
	
	%>	
		<script type="text/javascript">
	 		location.href = "missingPW_mail.jsp?id=<%=idd%>&email=<%=email%>";
		</script> 	
	<% %>

	

	
	
<%@ include file="footer.jsp"%>