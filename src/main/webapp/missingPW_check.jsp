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
	if(personDto != null){
	%>	
		<script type="text/javascript">
	 		location.href = "missingPW_mail.jsp?id=<%=idd%>&email=<%=email%>";
		</script> 	
	<%}else{ %>
		<script>
			alert('옳바른 정보가 아닙니다. 다시 입력해주세요');
			history.back();	 
		</script>
	<%} %>

	
	
<%@ include file="footer.jsp"%>