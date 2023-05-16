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
	CartDto cartDto = productDao.sumQty(id);
	int sumQty = cartDto.getQty();
	List<ProductDto> productList = productDao.selectProductList();
	%>
		<a href="./cart.jsp?id=<%=id%>" style="text-decoration: none;">
			<div class="cart_icon">
				<span id="cart_count"><%=sumQty%></span>
			</div>
		</a>
	
	<div class="container">
		<%
		for (ProductDto item : productList) {
		%>

		<div class="product_box" id="<%=item.getCode()%>">
			<a href="./productDetail.jsp?code=<%=item.getCode()%>">
				<img src="images/<%=item.getFilename()%>">
				<div class="pname"><%=item.getPname()%></div>
				<div class="price"><%=item.getSprice()%></div>
			</a>
				<button type="button" class="btn cartBtn btn-primary addBtn">카트담기</button>
				<button type="button" class="btn buyBtn btn-warning buyNowBtn">바로구매</button>			 
		</div>
		<%
		}
		if(id != null && id.equals("admin")){ %>
		<div class="product_box" style="position:relative; bottom: 150px; margin-top:180px;">
			<a href="./addProduct.jsp">
			<img src="images/plus.png">
			</a>	
		</div>
		<%
		} %>
		
		
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
			const code = $(this).parent().attr('id');
			
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
		//바로구매 버튼
		let buyNowBtnArr = document.querySelectorAll(".buyNowBtn");
			for (let btn of buyNowBtnArr) {
		  	btn.addEventListener("click", buyNowBtn);
		}
		//바로구매버튼 함수
		function buyNowBtn() {
			const id = '<%=id%>';
			const code = $(this).parent().attr('id');
			
			if (id == null || id =="") { // 로그인 안함
				alert("로그인을 해주세요."); 
				location.href = "./member.jsp";
			} else {
				location.href = "./order.jsp?code="+code;
			}
			
		}
	</script>
</body>
</html>