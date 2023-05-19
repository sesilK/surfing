<%@page import="java.util.List"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.ProductDao"%>
<%@ page import="dto.ProductDto"%>
<%@ page import="dto.CartDto"%>

<%
	//카트담기 기능
	response.setContentType("application/json"); 
	JSONObject obj = new JSONObject(); 
	
	request.setCharacterEncoding("UTF-8"); 
	
	String id = request.getParameter("id");
	int code = Integer.parseInt(request.getParameter("code"));
	
	ProductDao productDao = new ProductDao();
	CartDto cartDto = productDao.alreadyInCart(id, code);
	
	int result = 0;
	
	if (cartDto != null) {	//카트에 이미 있는 상품이면 수량 컬럼을 +1 update
		result = productDao.increaseQty(id, code);	//성공하면 1, 아니면 0
	} else if (cartDto == null){	//카트에 없는 상품이면 장바구니 테이블에 insert
		result = productDao.addToCart(id, code);	//성공하면 1, 아니면 0
	}

	if (result == 1) {
		
		cartDto = productDao.sumQty(id);
		int sumQty = cartDto.getQty();
		List<ProductDto> productList = productDao.selectProductList();
		
		obj.put("result", "true"); //카트담기 성공
		obj.put("sumQty", sumQty); //
	} else {
		obj.put("result", "idNull"); //카트담기 실패
	} 
	
	response.getWriter().write(obj.toString());
		
 
%>