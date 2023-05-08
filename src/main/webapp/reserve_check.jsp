<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="dao.ReserveDao"%>
<%@ page import="dto.ReserveDto"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.js"
	integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
	crossorigin="anonymous"></script>
<style>
.cancel-ok {
	background-color: red;
}
</style>
</head>
<body>
	<%@ include file="common.jsp"%>
	<h1>예약확인창</h1>

	<table class="table">
		<thead>
			<tr>
				<th>예약일자</th>
				<th>인원</th>
				<th>레벨</th>
				<th>예약상태</th>
				<th>teacher 이름 넣고싶다</th>
				<th>
				<th>
			</tr>
		</thead>
		<tbody>
			<%
			ReserveDao reserveDao = new ReserveDao();
			List<ReserveDto> reserveList = null;
			try {
				reserveList = reserveDao.selectReserveList("admin");
			} catch (Exception e) {
			%>
			<p>예외처리</p>
			<%
			}

			/* 		List<ReserveDto> reserveList = reserveDao.selectReserveList("admin"); */

			for (ReserveDto item : reserveList) {
			%>
			<tr class="" id="<%=item.getNo()%>">
				<td><%=item.getDate()%></td>
				<td><%=item.getPersons()%></td>
				<td><%=item.getStage()%></td>
				<td><%=item.getState()%></td>
				<td></td>
				<td><button class="cancel-btn" id='cancel_<%=item.getNo()%>'>예약취소</button></td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>





</body>
<script>
	window.onload = function () {
		let btnArr = document.querySelectorAll(".cancel-btn");
		for(let btn of btnArr) {
			btn.addEventListener("click", function() {
				const no = $(this).parent().parent().attr('id'); // 버튼의 부모의 부모를 찾아서 id값이 뭐냐
				location.href = "reserve_update.jsp?no=" + no;
			});
		}
	}
</script>
</html>