<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="dao.ProductDao"%>
<%@ page import="dto.ProductDto"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file = "common.jsp" %>
	<% ProductDao productDao = new ProductDao();
	   /* List<ProductDto> productList = productDao.selectProductList(); */
	   ProductDto productDto = new ProductDto();
	   productDto = productDao.selectProductByCode(101);

	   %>
	   <h1>서핑 용품</h1>
<%-- 	<% for(ProductDto item : productList){ 
		%> <h1><%=item.getPname()%></h1>  <%
	};  %> --%>
	
	<% for(int i=0;i<5;i++){ 
		%> <h1><%=i%></h1>  <%
	};  %>
</body>
</html>