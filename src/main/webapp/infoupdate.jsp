<%@page import="dto.PersonDto"%>
<%@page import="dao.PersonDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp"%>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

fieldset {
	width: 300px;
	border: 0;
}

input {
	display: inline-block;
}

/* 회원 정보 박스 */
.MemberInfo_box {
	display: flex;
	flex-direction: column;
	width: 500px;
}

/* 입력창 */
.MemberInfo_box input {
	width: 100%;
	height: 50px;
	font-size: large;
	padding: 8px;
	box-sizing: border-box;
	margin: 5px;
}

.MemberInfo_box input {
	width: 100%;
	height: 50px;
	font-size: large;
	padding: 8px;
	box-sizing: border-box;
	margin: 5px;
}

.MemberInfo_box table {
	margin-left: auto;
	margin-right: auto;
}

.MemberInfo_box h1 {
	text-align: center;
	margin: 10px
}
.MemberInfo_box h5 {
	text-align: center;
}
</style>
<%
	if(session.getAttribute("id") == null) {
		out.println("<script>location.href = 'member.jsp';</script>");
	} else {
	id = (String)session.getAttribute("id");

	PersonDao persondao = new PersonDao();
	PersonDto persondto = persondao.selectPersonInfoById(id);	
%>



<div style="margin-top: 80px; margin-bottom: 300px;">
	<div class="MemberInfo_box">
		<form action="infoUpDate_Check.jsp" method="post">
			<table>
				<thead>
					<h1>회원정보 수정</h1>
				</thead>
				<tbody>
					<tr>
						<td><h5>아이디</h5></td>
						<td><input id="id" type="text" name="id"
							value="<%= persondto.getId()%>" readonly></td>
					</tr>
					<tr>
						<td><h5>현재 비밀번호</h5></td>
						<td><input type="password" id="before" name="beforePw"></td>
					</tr>
					<tr>
						<td><h5>변경할 비밀번호</h5></td>
						<td><input type="password" id="after" name="afterPw"></td>
					</tr>
					<tr>
						<td><h5>이름</h5></td>
						<td><input type="text" name="name"
							value="<%= persondto.getName()%>" readonly></td>
					</tr>
					<tr>
						<td><h5>주소</h5></td>
						<td><input type="text" name="address"
							value="<%=persondto.getAddress()%>"></td>
					</tr>
					<tr>
						<td><h5>이메일</h5></td>
						<td><input type="text" name="email"
							value="<%= persondto.getEmail()%>" readonly></td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" value="수정"
							class="submit"></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</div>

<%}%>
<%@ include file="footer.jsp"%>

