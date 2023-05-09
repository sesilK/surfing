<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="dao.ProductDao"%>
<%@ page import="dto.ProductDto"%>
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
	request.setCharacterEncoding("UTF-8"); //한글 정상 인식을 위해

	String idParam = request.getParameter("id");
	int code = Integer.parseInt(request.getParameter("code"));
	ProductDao productDao = new ProductDao();
	
	if (session.getAttribute("id") == null) {
		
		out.print("<script>alert('로그인을 해주세요.');</script>");
		out.print("<script>location.href = './member.jsp';</script>");	//로그인페이지 이동
		
	} else if (session.getAttribute("id") != null){
		
		CartDto cartDto = productDao.alreadyInCart(idParam, code);
		
		if(cartDto == null){
			productDao.addToCart(idParam,code);
			out.print("<script>alert('장바구니에 담았습니다.');</script>");
		} else {
			productDao.increaseQty(idParam, code);
			out.print("<script>alert('장바구니에 담았습니다.');</script>");
		}
		out.print("<script>location.href = './shop.jsp';</script>");	//상품페이지 이동

	} 
	%>
	<script>

	</script>

</body>
</html>