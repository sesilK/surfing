<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.ProductDao"%>
<%@ page import="dto.ProductDto"%>
<%@ page import="dto.CartDto"%>

<%
	//장바구니 안에 전체체크박스 눌렀을때 나타나는 기능
	response.setContentType("application/json"); // HTML 형식이 아닌 JSON 형식으로 쓰겠다
	JSONObject obj = new JSONObject(); // JSON 객체를 담기위해 선언
	
	request.setCharacterEncoding("UTF-8"); //한글 정상 인식을 위해
	
	String id = request.getParameter("id");
	String isChecked = request.getParameter("isChecked");
	
	ProductDao productDao = new ProductDao(); // DB 처리하기위한 자바 DAO 클래스 선언

	int result = 0;
	
	if (isChecked.equals("allUncheck")) {	//전체 체크 안 되어있으면
		result = productDao.checkedAll(id); //체크상태 1로 만드는 메서드 (성공하면 1)
	} else if (isChecked.equals("allCheck")) {	//전체 체크 되어있으면
		result = productDao.uncheckedAll(id); //체크상태 0으로 만드는 메서드 (성공하면 1)
	}

	if (result == 0) {	//실행 실패
		obj.put("result", "false"); // json 객체의 result 키에 false 넣기	
	} else { // 실행 성공
		obj.put("result", "true"); // json 객체의 result 키에 true 넣기
	} 
	
	response.getWriter().write(obj.toString()); // 최종으로 만들어둔 json 객체를 완성해서 뿌림
		
 
%>