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
<style>
	* {
		margin: 0;
		padding: 0;
		box-sizing: border-box;
	}
	h1 {
		display: flex;
		justify-content: center;
	}
	.container {
		width: 90%;
		margin: 0 auto;
	}
	.product_box {
		width: 18.5%;
		display: inline-block;
		margin: 3%;
		/* border: 1px solid red; */
	}
	img {
		width: 100%;
	}
	.pname, .price {
		font-size: 11px;
		text-align: center;
	}
	.btn:first-of-type {
		margin-left: 10px;
	}
</style>
</head>
<body>
	<%@ include file="common.jsp"%>
	
	<h1>서핑 용품</h1>
	
	<%
		ProductDao productDao = new ProductDao();
		List<ProductDto> productList = productDao.selectProductList();
	%>
		<div class="container">
	<%
		for(ProductDto item : productList) {
	%>
			
			<div class="product_box">
				<a class="" href="./productDetail.jsp?code=<%=item.getCode()%>">
					<img src="images/product_<%=item.getCode()%>.png">
					<div class="pname"><%=item.getPname()%></div>
					<div class="price">\<%=item.getSprice()%></div>
				</a>
				<button type="button" class="btn cartBtn btn-primary">카트담기</button>
				<button type="button" class="btn buyBtn btn-warning">바로구매</button>
			</div>
	<%
		}
	%>
		</div>

</body>
</html>