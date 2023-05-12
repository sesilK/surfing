<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.PersonDao"%>
<%@ page import="dto.PersonDto"%>
<%@ page import="util.SHA256" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.*"%>
	<%
		request.setCharacterEncoding("UTF-8");	//한글 정상 인식을 위해
		
		String id = request.getParameter("id");	
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		int jumin = Integer.parseInt(request.getParameter("jumin"));
		String address = request.getParameter("address");
		String email = request.getParameter("email");
		
		PersonDao personDao = new PersonDao();
		int result = personDao.insertPerson(id,pw,1,name,address,email,SHA256.getSHA256(email));

		if(result == 1){
	%>
		<script>
			alert('가입되었습니다');
			alert('이메일 인증해주세요');
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
