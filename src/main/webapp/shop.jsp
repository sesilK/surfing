<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="dao.ProductDao"%>
<%@ page import="dto.ProductDto"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	h1 {
		display: flex;
		justify-content: center;
	}
</style>
</head>
<body>
	<%@ include file="common.jsp"%>
	
	<h1>서핑 용품</h1>
	
	<table class="table">
		<thead>
			<tr>
				<th>name</th>
			</tr>
		</thead>
		<tbody>
			<%
		ProductDao productDao = new ProductDao();
		List<ProductDto> productList = productDao.selectProductList()();
		
		for(ProductDto item : productList) {
	%>
			<tr>
				<td><%=item.getPname()%></td>
				
			</tr>
			<%
		}
	%>
		</tbody>
	</table>
	

</body>
</html>