<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page import="java.util.*"%>
<%@ page import="dao.ProductDao"%>
<%@ page import="dto.ProductDto"%>
<%@ page import="dto.CartDto"%>

	<%	
	//신규상품 추가하는 기능 (관리자)
		response.setContentType("application/json");
		JSONObject obj = new JSONObject();
	
		request.setCharacterEncoding("UTF-8");
		
		String pname = request.getParameter("pname");
		int price = Integer.parseInt(request.getParameter("price"));
		int stock = Integer.parseInt(request.getParameter("stock"));
		String filename = request.getParameter("filename");
		
		ProductDao  productDao = new ProductDao();
		int result = productDao.addProduct(pname,price,stock,filename);
		if (result == 1) {
			obj.put("result", "true"); //추가 성공
		} else {
			obj.put("result", "false"); //추가 실패
		} 

		response.getWriter().write(obj.toString());
		
	%>
