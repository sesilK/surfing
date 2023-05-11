<%@page import="dto.PersonDto"%>
<%@page import="dao.PersonDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("id") == null) {
		out.println("<script>location.href = 'member.jsp';</script>");
	} else {
	String id = (String)session.getAttribute("id");

	PersonDao persondao = new PersonDao();
	PersonDto persondto = persondao.selectPersonInfoById(id);	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<form action="infoUpDate_Check.jsp" method="post">
	<table>
		<thead>회원정보 수정</thead>
		<tbody>
			<tr>
				<td>아이디</td>
				<td><input id="id" type="text" name="id" value="<%= persondto.getId()%>" readonly></td>
			</tr>
			<tr>
				<td>비밀번호 변경전</td>
				<td><input type="password" id="before" name="beforePw"></td>
			</tr>
			<tr>
				<td>변경할 비밀번호</td>
				<td><input type="password" id="after" name="afterPw"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value="<%= persondto.getName()%>" readonly></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="address" value="<%= persondto.getAddress()%>"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="email"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="수정"></td>
			</tr>
		</tbody>
	</table>
	</form>
	
	
</body>
</html>
<%}%>