<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page import="java.util.*"%>
<%@ page import="dao.ProductDao"%>
<%@ page import="dto.ProductDto"%>
<%@ page import="dto.CartDto"%>


	<%
		response.setContentType("application/json"); // HTML 형식이 아닌 JSON 형식으로 쓰겠다
		JSONObject obj = new JSONObject(); // JSON 객체를 담기위해 선언
	
		request.setCharacterEncoding("UTF-8");	//한글 정상 인식을 위해
		
		String pname = request.getParameter("pname");
		int price = Integer.parseInt(request.getParameter("price"));
		int stock = Integer.parseInt(request.getParameter("stock"));

		ProductDao  productDao = new ProductDao();
		int result = result = productDao.addProduct(pname,price,stock);
		if (result == 1) {
			obj.put("result", "true"); // json 객체의 result 키에 true 넣기
		} else {
			obj.put("result", "false"); // json 객체의 result 키에 false 넣기
		} 

		response.getWriter().write(obj.toString()); // 최종으로 만들어둔 json 객체를 완성해서 뿌림
		
	%>
