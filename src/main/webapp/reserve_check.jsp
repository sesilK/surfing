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
</head>
<body>
	<%@ include file="common.jsp"%>	
	<h1>예약확인창</h1>
	
		<table class="table">
		<thead>
			<tr>
				<th>예약번호</th>
				<th>예약일자</th>
				<th>인원</th>
				<th>수업</th>
				<th>예약상태</th>
			</tr>
		</thead>
		<tbody>
	<%
		ReserveDao reserveDao = new ReserveDao();
	  	List<ReserveDto> reserveList = null;
	      try {
	        reserveList = reserveDao.selectReserveList("admin");
	      } catch (Exception e) {
	        %> <p>예외처리</p> <%
	      }
	      
/* 		List<ReserveDto> reserveList = reserveDao.selectReserveList("admin"); */

		if (reserveList != null) {
		for(ReserveDto item : reserveList){
	%>
 			<tr>
				<td><%=item.getNo()%></td>
				<td><%=item.getDate()%></td>
				<td><%=item.getPersons()%></td>
				<td><%=item.getStage()%></td>
				<td><%=item.getState()%></td>
			</tr>
	<%
		}} else {
			%> reserveList = null <%
		}
	%>
		</tbody>	
	</table>
	

</body>
</html>