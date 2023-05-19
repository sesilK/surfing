<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<style>
	#submitbt{
	cursor: pointer;
	width: 100px;
	height: 50px;
	background-color: rgb(168, 176, 192);
	border: none;
	color: white;
	border-radius: 15px;
	}
</style>

<%@ include file = "common.jsp" %>
<form action="missingPW_check.jsp">
	<div style="margin-top:80px; margin-bottom: 200px;">
	<h1>비밀번호 찾기🔍</h1>
		<div style="margin-top:80px; border:1px solid rgb(219, 219, 219); padding:50px;">
			당신의 <input type="text" name="name" placeholder="이름">을 적어주세요 <br><br>
			당신의 <input type="text" name="id" placeholder="아이디">을 적어주세요 <br><br>
			당신의 <input type="text" name="email" placeholder="이메일">을 적어주세요 <br>
			<br><br><br>
			<input type="submit" value="비밀번호 초기화" id="submitbt">
		</div>
	</div>
</form>

<%@ include file="footer.jsp"%>