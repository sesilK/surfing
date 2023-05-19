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
		String address = request.getParameter("address");
		String email = request.getParameter("email");
		
		
		
		// id ,pw ,name ,address ,email ,SHA256.getSHA256(email)
		
		PersonDao personDao = new PersonDao();
		int result = personDao.insertPerson(new PersonDto(id,pw,name,address,email,SHA256.getSHA256(email)));
		
		//PersonDto personDto = new PersonDto();
		
		//personDto.setId(id);
		//personDto.setPw(pw);
		//personDto.setName(name);
		//personDto.setAddress(address);
		//personDto.setEmail(email);
		//personDto.setEmailHash(emailHash);
		

		if(result == 1){
	%>
		<script>
			location.href = 'emailSendAction.jsp?id=<%=id%>';
		</script>
	<%
		} else {
	%>
			<script>
			alert('중복된 아이디입니다.');
			location.href = './signup.jsp';
				//location.href = '.';
			</script>
	<%
		}
	%>
	<script>
		//location.href = './index.jsp'; 
	</script>
