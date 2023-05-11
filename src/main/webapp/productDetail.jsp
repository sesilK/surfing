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
	<%
		int code = Integer.parseInt(request.getParameter("code"));
		ProductDao productDao = new ProductDao();
		ProductDto productDto = productDao.selectProductByCode(code);
		CartDto cartDto = productDao.sumQty(id);
		int sumQty = cartDto.getQty();
	%>
		<h1>상품 상세정보</h1>
		
		<a href="./cart.jsp?id=<%=id%>" style="text-decoration: none;">
			<div class="cart_icon">
				<span id="cart_count"><%=sumQty%></span>
			</div>
		</a>
		
		<div class="container">
			<div class="btnBox">
				<img src="images/product_<%=productDto.getCode()%>.png">
			</div>
			<div class="pname"><%=productDto.getPname()%></div>
			<div class="price">\<%=productDto.getSprice()%></div>
			<div class="btnBox">
				<a href="./shop.jsp">
				<button type="button" class="btn cartBtn btn-secondary">상품목록</button></a>
				<button type="button" class="btn cartBtn btn-primary addBtn">카트담기</button></a>
				<button type="button" class="btn buyBtn btn-warning">바로구매</button>
			</div>
		</div>
		<script>
		//카트담기 버튼
		let addBtnArr = document.querySelectorAll(".addBtn");
			for (let btn of addBtnArr) {
		  	btn.addEventListener("click", addCartBtn);
		}
		//카트담기버튼 함수
		function addCartBtn() {
			const id = '<%=id%>';
			const code = '<%=code%>';
			
			
			$.ajax({
				async : true, // 비동기 true
				type : 'get', // GET 타입
				data : { // 넘겨줄 매개변수, 실제로 ?id=input_id 형식으로 넘어감
					"id" : id,
					"code" : code
				},
				url : "./addToCart.jsp", // 타겟 url 주소
				dataType : "json", // json 형태로 받아오겠다
				contentType : "application/json; charset=UTF-8",
				success : function(data) {
					if (data.result === 'true') { //DB insert/update 성공
						$('#cart_count').text(data.sumQty);
					} else if (data.result === 'idNull') {
						alert("로그인을 해주세요."); // 로그인 안함
						location.href = "./member.jsp";
					} 
				},
				error : function() {
					alert("오류 발생");
				}
			})
		}
		</script>
</body>
</html>