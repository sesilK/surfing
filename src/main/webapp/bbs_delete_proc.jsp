<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.BbsDao"%>
<%@ page import="dto.BbsDto"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<%
	int no = Integer.parseInt(request.getParameter("form_no"));

	BbsDao bbsDao = new BbsDao();
	int result = bbsDao.deleteBbs_con(no);
	// 		int result = 0;

	if (result == 1) {
		//삭제성공
	%>
	<script>
			alert('삭제 성공');
			location.href = './bbs.jsp'; 
		</script>
	<%
	} else {
	%>
	<!--삭제실패-->
	<script>
				alert('삭제실패');
				location.href = './bbs_con_view.jsp?no=<%=no%>
		';
	</script>
	<%
	}
	%>

</body>
</html>
