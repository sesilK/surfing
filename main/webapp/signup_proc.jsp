<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.PersonDao"%>
<%@ page import="dto.PersonDto"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");	//한글 정상 인식을 위해
		
		String id = request.getParameter("id");	
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		int jumin = Integer.parseInt(request.getParameter("jumin"));
		String address = request.getParameter("address");
		String email = request.getParameter("email");
		
		PersonDao personDao = new PersonDao();
		int result = personDao.insertPerson(id,pw,1,name,jumin,address,email);

		if(result == 1){
	%>
		<script>
			alert('가입되었습니다');
			location.href = './member.jsp';
		</script>
	<%
		} else {
	%>
			<script>
				alert('가입 실패...');
				//location.href = '.';
			</script>
	<%
		}
	%>
	<script>
		//location.href = './index.jsp'; 
	</script>
</body>
</html>