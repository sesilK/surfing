<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.ProductDao"%>
<%@ page import="dto.ProductDto"%>
<%@ page import="dto.CartDto"%>

<%
	//장바구니 안에 물건마다 갖고있는 체크박스 눌렀을때 나타나는 기능
	response.setContentType("application/json"); // HTML 형식이 아닌 JSON 형식으로 쓰겠다
	JSONObject obj = new JSONObject(); // JSON 객체를 담기위해 선언
	
	request.setCharacterEncoding("UTF-8"); //한글 정상 인식을 위해
	
	String id = request.getParameter("id");
	int code = Integer.parseInt(request.getParameter("code"));
	
	ProductDao productDao = new ProductDao(); // DB 처리하기위한 자바 DAO 클래스 선언
	CartDto cartDto = productDao.alreadyInCart(id, code); 	//카트에 이미 들어있는 객체
	
	int ischecked = cartDto.getChecked();	//체크되어있는지 상태 확인
	int result = 0;
	
	if (ischecked == 0) {	//체크 안 되어있으면
		result = productDao.checked(id, code)+10; //체크상태 1로 만드는 메서드 (성공하면 11)
	} else if (ischecked == 1) {	//체크 되어있으면
		result = productDao.unchecked(id, code)+20; //체크상태 0으로 만드는 메서드 (성공하면 21)
	}

	if (result == 11) {	//체크 했음
		cartDto = productDao.sumQtyTotal(id);
		int sumQty = cartDto.getQty();
		String sumTotal = cartDto.getStrTotal();
		obj.put("result", "checked"); // json 객체의 result 키에 true 넣기
		obj.put("sumQty", sumQty);
		obj.put("sumTotal", sumTotal);		
	} else if (result == 21) { //체크 풀었음
		cartDto = productDao.sumQtyTotal(id);
		int sumQty = cartDto.getQty();
		String sumTotal = cartDto.getStrTotal();
		obj.put("result", "unchecked"); // json 객체의 result 키에 false 넣기
		obj.put("sumQty", sumQty);
		obj.put("sumTotal", sumTotal);
	} else { //실행 실패
		obj.put("result", "false"); // json 객체의 result 키에 false 넣기
	} 
	
	response.getWriter().write(obj.toString()); // 최종으로 만들어둔 json 객체를 완성해서 뿌림
		
 
%>