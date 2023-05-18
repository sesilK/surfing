<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ include file = "common.jsp" %>
<form action="missingID_check.jsp">
	<div>
		당신의 <input type="text" name="name" placeholder="이름">을 적어주세요 <br>
		당신의 <input type="text" name="email" placeholder="이메일">을 적어주세요 <br>
		<input type="submit" value="찾기">
	</div>
</form>

<%@ include file="footer.jsp"%>