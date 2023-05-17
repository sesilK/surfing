<%@page import="dto.PersonDto"%>
<%@page import="dao.PersonDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "common.jsp" %>
<%

	String name = request.getParameter("name");
	String email = request.getParameter("email");

	PersonDao personDao = new PersonDao();
	
	PersonDto personDto = personDao.missingPersonInfoById(name,email);
	
	id = personDto.getId();
	%>
		당신의 아이디는 <%=id%> 입니다.<br>
		비밀번호를 잊으셧다면 <input type="button" value="눌러주세요">
	<%
	
	
	
%>
<%@ include file="footer.jsp"%>