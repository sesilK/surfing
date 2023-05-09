<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="dao.ProductDao"%>
<%@ page import="dto.ProductDto"%>
<%
request.setCharacterEncoding("UTF-8");
%>
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

.cart_icon {
	width: 40px;
	height: 40px;
	position: fixed;
	right: 30px;
	bottom: 40px;
	background-image: url('images/free-icon-add-cart.png');
	background-size: contain;
}

#cart_count {
	width: 10px;
	color: red;
	font-size: large;
	position: relative;
	bottom: 15px;
	left: 14px;
}
</style>
</head>
<body>
	<%@ include file="common.jsp"%>
	<h1>서핑 용품</h1>
	
	<%
	ProductDao productDao = new ProductDao();
	int totalQty = productDao.totalQty(id);
	List<ProductDto> productList = productDao.selectProductList();
	%>
		<a href="./cart.jsp?id=<%=id%>" style="text-decoration: none;">
			<div class="cart_icon">
				<span id="cart_count"><%=totalQty%></span>
			</div>
		</a>
	
	<div class="container">
		<%
		for (ProductDto item : productList) {
		%>

		<div class="product_box" id="<%=item.getCode()%>">
			<a href="./productDetail.jsp?code=<%=item.getCode()%>">
				<img src="images/product_<%=item.getCode()%>.png">
				<div class="pname"><%=item.getPname()%></div>
				<div class="price"><%=item.getSprice()%></div>
			</a>
			
			<a href="./addToCart.jsp?id=<%=id%>&code=<%=item.getCode()%>">
				<button type="button" class="btn cartBtn btn-primary addBtn"
			 	id="add_<%=item.getCode()%>">카트담기</button></a>
			 
			 <button type="button" class="btn buyBtn btn-warning buyNowBtn"
			 id="buyNow_<%=item.getCode()%>">바로구매</button>
			 
		</div>
		<%
		}
		%>
	</div>

	<script>

/* 	window.onload = function () {
		
		//카트담기 버튼 기능
		let addBtnArr = document.querySelectorAll(".addBtn");
		for(let btn of addBtnArr) {
			btn.addEventListener("click", function() {
 				const code = $(this).parent().attr('id');
				location.href = "./addToCart.jsp?code=" + code;
			});
		}
		
		//바로구매 버튼	기능
		let buyNowBtnArr = document.querySelectorAll(".buyNowBtn");
		for(let btn of buyNowBtnArr) {
			btn.addEventListener("click", function() {
				
			});
		}
	} */
	</script>

</body>
</html>