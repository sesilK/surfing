<%@page import="dao.PersonDao"%>
<%@page import="dto.PersonDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		request.setCharacterEncoding("UTF-8");	//한글 정상 인식을 위해
		
		String id = request.getParameter("id");	
		String beforepw = request.getParameter("beforePw");
		String afterpw = request.getParameter("afterPw");
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String email = request.getParameter("email");
		
		PersonDao persondao = new PersonDao();
		PersonDto persondto = new PersonDto();
		int result = persondao.login(request.getParameter("id"), request.getParameter("beforePw")); 		

		if(result == 1){
			int update = persondao.PersonUpDate(id, afterpw, address, email);
				if(update == 1){
		%>
				<script>
					alert('수정되었습니다');
					location.href = './home.jsp';
				</script>
	<%
			}	else {%>
				<script>
					alert('수정실패');
				</script>
			<%}
	} else {
	%>
			<script>
				alert('비밀번호가 다릅니다 옳바른 비밀번호를 입력해주세요');
				location.href = './infoupdate.jsp';
			</script>
	<%
		}
	%>