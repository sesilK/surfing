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
	request.setCharacterEncoding("UTF-8"); //한글 정상 인식을 위해
	
	String writer_id = request.getParameter("writer_id");
	String answer = request.getParameter("answer");
	int no = Integer.parseInt(request.getParameter("form_no"));
	
	BbsDao dao = new BbsDao();

	int result = dao.answerBbs_con(answer, no);
	
	%>
	
	<script>
	<%if(result==1){%>
	location.href = './bbs_con_view.jsp?id=<%=writer_id%>&no=<%=no%>';
	<%}%>
	</script>
	
<body>

</html>