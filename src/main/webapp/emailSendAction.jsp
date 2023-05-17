<!-- 사용자가 Email 인증 버튼을 눌렀을 때 처리해주는 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.mail.*"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@ page import="java.util.Properties"%>
<%@page import="dto.PersonDto"%>
<%@ page import="dao.PersonDao"%>
<%@ page import="util.SHA256"%>
<%@ page import="util.Gmail"%>
<%@ page import="java.io.PrintWriter"%>


<%
	request.setCharacterEncoding("UTF-8");
	PersonDao userDAO = new PersonDao();
	
	String id = request.getParameter("id");
	
	/*
	if(session.getAttribute("id") != null){
		id = (String) session.getAttribute("id");
	}	
	if(id == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인 해주세요');");
		script.println("location.href = './member.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
	*/
	
	
	boolean emailChecked = PersonDao.getUserEmailChecked(id);
	if(emailChecked == true){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 인증된 회원입니다');");
		script.println("location.href = './home.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
	
	
	String host = "http://localhost:8080/Surfing/";
	String from = "csd931009@gmail.com";
	String to = PersonDao.getUserEmail(id);
	String subject = "서퍼들을 위한 이메일인증메일입니다";
	String content = "다음 링크를 타서 이메일 인증을 진행해주세요 " +
		"<a href='" + host + "emailCheckAction.jsp?code=" + new SHA256().getSHA256(to) + "&id=" + id +"'>이메일 인증하기</a>";
	
	Properties p = new Properties();
	p.put("mail.smtp.user",from);
	p.put("mail.smtp.host","smtp.gmail.com");
	p.put("mail.smtp.port","465");
	p.put("mail.smtp.starttls.enable","true");
	p.put("mail.smtp.auth","true");
	p.put("mail.smtp.debug","true");
	p.put("mail.smtp.ssl.protocols","TLSv1.2");
	p.put("mail.smtp.socketFactory.port","465");
	p.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
	p.put("mail.smtp.socketFactory.fallback","false");
	
	try{
		Authenticator auth = new Gmail();
		Session ses = Session.getInstance(p,auth);
		ses.setDebug(true);
		MimeMessage msg = new MimeMessage(ses);
		msg.setSubject(subject);
		Address fromAddr = new InternetAddress(from);
		msg.setFrom(fromAddr);
		Address toAddr = new InternetAddress(to);
		msg.addRecipient(Message.RecipientType.TO, toAddr);
		msg.setContent(content, "text/html; charset = UTF8");
		Transport.send(msg);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('가입이 완료되었습니다 이메일인증해주세요.');");
		script.println("location.href = 'home.jsp'");
		script.println("</script>");
	} catch(Exception e){
		e.printStackTrace();
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('오류가 발생하였습니다.');");
		script.println("location.href = 'index.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
%>