<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="dao.BbsDao"%>
<%@ page import="dto.BbsDto"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓴거 넣눈거.</title>
</head>

<body>
	<%
		request.setCharacterEncoding("UTF-8"); //한글 정상 인식을 위해
		
		String id = (String)session.getAttribute("id");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		BbsDao dao = new BbsDao();
		int result = dao.insertBbsInfo(id, title, content);
		
		
		if(result ==1){
			//삭제성공
	%>
	<script>
			alert('게시물 작성 완료');
			location.href = './bbs.jsp';
		</script>
	<%
		} else {
	%>
	<script>
				alert('게시물 작성 실패');
				location.href = './home.jsp';
			</script>
	<%
		}
	%>

</body>
</html>
</body>
</html>