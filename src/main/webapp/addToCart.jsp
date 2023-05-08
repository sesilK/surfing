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
	
	<%
	request.setCharacterEncoding("UTF-8"); //한글 정상 인식을 위해

	String id = request.getParameter("id");
	int code = Integer.parseInt(request.getParameter("code"));
	ProductDao productDao = new ProductDao();
	CartDto cartDto = productDao.alreadyInCart(id, code);
	


	if(cartDto == null){
		productDao.addToCart(id,code);
		out.print("<script>alert('장바구니에 담았습니다.');</script>");
	} else {
		int result = productDao.increaseQty(id, code);
		out.print("<script>alert('장바구니에 담았습니다.');</script>");
	}
	
	out.print("<script>location.href = './shop.jsp';</script>");
	%>
	<script>

	</script>

</body>
</html>