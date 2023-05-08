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
		/* border: 1px solid red; */
		display: flex;
		flex-direction: column;
		justify-content: center;
	}
	img {
		width: 500px;
	}
	.pname, .price {
		font-size: 16px;
		text-align: center;
	}
	.btnBox {
		display: flex;
		justify-content: center;
	}
	.btn {
		margin: 0px 3px;
	}
</style>
</head>
<body>
	<%@ include file="common.jsp"%>
	<%
		int code = Integer.parseInt(request.getParameter("code"));
		ProductDao productDao = new ProductDao();
		ProductDto productDto = productDao.selectProductByCode(code);
	%>
		<h1>상품 상세정보</h1>
		<div class="container">
			<div class="btnBox">
				<img src="images/product_<%=productDto.getCode()%>.png">
			</div>
			<div class="pname"><%=productDto.getPname()%></div>
			<div class="price">\<%=productDto.getSprice()%></div>
			<div class="btnBox">
				<button type="button" class="btn cartBtn btn-primary">카트담기</button>
				<button type="button" class="btn buyBtn btn-warning">바로구매</button>
			</div>
		</div>
</body>
</html>