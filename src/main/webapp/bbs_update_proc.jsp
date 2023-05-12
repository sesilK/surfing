<%@page import="dao.BbsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
request.setCharacterEncoding("UTF-8"); //한글 정상 인식을 위해

String writer_id = request.getParameter("id");
int content_no = Integer.parseInt(request.getParameter("no"));
String update_title = request.getParameter("title");
String update_content = request.getParameter("content");

BbsDao dao = new BbsDao();

//메소드매개변수 순서 맞춰야함.
int result = dao.updateBbs_con(update_title, update_content, content_no, writer_id);
%>
<body>
	<script>
	location.href = './bbs_con_view.jsp?id=<%=writer_id%>&no=<%=content_no%>
		';
	</script>
</body>
</html>