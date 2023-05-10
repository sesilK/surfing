<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.ProductDao"%>
<%@ page import="dto.ProductDto"%>
<%@ page import="dto.CartDto"%>

<%
	response.setContentType("application/json"); // HTML 형식이 아닌 JSON 형식으로 쓰겠다
	JSONObject obj = new JSONObject(); // JSON 객체를 담기위해 선언
	
	request.setCharacterEncoding("UTF-8"); //한글 정상 인식을 위해
	
	String id = request.getParameter("id");
	int code = Integer.parseInt(request.getParameter("code"));
	
	ProductDao productDao = new ProductDao(); // DB 처리하기위한 자바 DAO 클래스 선언
	CartDto cartDto = productDao.alreadyInCart(id, code); 
	
	int result = productDao.removeFromCart(cartDto.getId(), cartDto.getCode());
	
	if (result == 1) {
		obj.put("result", "true"); // json 객체의 result 키에 true 넣기
	} else {
		obj.put("result", "false"); // json 객체의 result 키에 false 넣기
	}
	response.getWriter().write(obj.toString()); // 최종으로 만들어둔 json 객체를 완성해서 뿌림
%>
