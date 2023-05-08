<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8"); //한글 정상 인식을 위해
	int no = Integer.parseInt(request.getParameter("code"));
	ProductDao productDao = new ProductDao();
	productDao.addToCart(id,code);
	%>
	<script>
		/* location.href = "./shop.jsp"; */
	</script>

</body>
</html>