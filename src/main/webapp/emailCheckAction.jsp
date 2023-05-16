<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.PersonDao"%>
<%@ page import="dto.PersonDto"%>
<%@ page import="util.SHA256"%>
<%@ page import="java.io.PrintWriter"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	PersonDao personDao = new PersonDao(); //회원정보 DAO객체 생성
	
////////////////////////////////////////////////////////////////////////////////////////////

	String code = null;
	
	if(request.getParameter("code") != null){ // 받아온 파라미터값을 변수에 담아둔다 CODE
		code = request.getParameter("code");
	}  	
	
////////////////////////////////////////////////////////////////////////////////////////////
	
	String id = null;
	
	if(request.getParameter("id") != null){ // 받아온 파라미터값을 변수에 담아둔다 ID
		id = request.getParameter("id");
	}  	
	
////////////////////////////////////////////////////////////////////////////////////////////

	String email = personDao.getUserEmail(id);
	boolean emailchecked = (new SHA256().getSHA256(email).equals(code)) ? true : false ;
	if(emailchecked == true){
		int a = personDao.Emailauthentication(id);
		if(a == 1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('인증이 완료되었습니다 창을닫아주세요.');");
		script.println("</script>");
		}
	}else {
		
	}
%>