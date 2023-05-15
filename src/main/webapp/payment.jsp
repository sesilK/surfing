<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="dao.ProductDao"%>
<%@ page import="dto.ProductDto"%>
<%@ page import="dao.OrderDao"%>
<%@ page import="dto.OrderDto"%>
<%@ page import="dto.CartDto"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="common.jsp"%>
	<%
	String payment = request.getParameter("payment");
	OrderDao orderDao = new OrderDao();
	int result1 = orderDao.makeOrder(id,payment); //주문건 insert (result1은 1)
	int order_no = orderDao.selectOrderNo(id); //생성한 주문번호 찾기
	int result2 = orderDao.makeOrderDetail(id, order_no); //상세내역 insert (result2는 n)
	int cnt = orderDao.orderCount(id); //상세내역 튜플 수와 일치
	
	if(result1 == 1 && result2 == cnt){
		orderDao.ordered(id); //장바구니에서 삭제
	%>	<script>
		
		alert('결제완료');
		
		location.href = "orderCheck.jsp";
		
		</script>	
	<%}
	%>
	




</body>
</html>