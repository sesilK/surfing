<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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
	request.setCharacterEncoding("UTF-8"); //�ѱ� ���� �ν��� ����

	int no = Integer.parseInt(request.getParameter("no"));
	ReserveDao reserveDao = new ReserveDao();
	reserveDao.reserveCancel(no);
	%>
	<script>
		location.href = "./reserve_check.jsp";
	</script>


</body>
</html>