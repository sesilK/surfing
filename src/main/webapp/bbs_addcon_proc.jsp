<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page import="java.util.*"%>
<%@ page import="dao.BbsDao"%>
<%@ page import="dto.BbsDto"%>
<%
		response.setContentType("application/json"); // HTML 형식이 아닌 JSON 형식으로 쓰겠다
		JSONObject obj = new JSONObject(); // JSON 객체를 담기위해 선언
		request.setCharacterEncoding("UTF-8"); //한글 정상 인식을 위해

		String id = (String) session.getAttribute("id");
		String title = request.getParameter("inputTitle");
		String content = request.getParameter("inputText");

		BbsDao dao = new BbsDao();

		int result = dao.insertBbsInfo(id, title, content);
		obj.put("test", result); // json 객체의 result 키에 true 넣기

		if (result == 1) {
			obj.put("result", "true"); // json 객체의 result 키에 true 넣기
		} else {
			obj.put("result", "false"); // json 객체의 result 키에 false 넣기
		}

		response.getWriter().write(obj.toString()); // 최종으로 만들어둔 json 객체를 완성해서 뿌림
%>
