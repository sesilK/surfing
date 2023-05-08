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
	<%
		request.setCharacterEncoding("UTF-8"); //한글 정상 인식을 위해
		
		String date = request.getParameter("date");
		int persons = Integer.parseInt(request.getParameter("persons"));
		int stage = Integer.parseInt(request.getParameter("stage"));
		
		ReserveDao reserveDao = new ReserveDao();
		int result = reserveDao.insertReserve(date, persons, stage);
		
		if(result == 1){
	%>
	<script>
			alert('예약 완료');
			location.href = './reserve_check.jsp';
	</script>
	<%
		} else {
	%>
	<script>
			alert('예약 실패');
	</script>
	<%
		}
	%>
</body>
</html>