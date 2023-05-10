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
		table {
			border-collapse: collapse;
			margin: 20px;
		}
		th, td {
			border: 1px solid black;
			padding: 10px;
			text-align: center;
		}
		button {
			padding: 5px 10px;
			background-color: white;
			border: 1px solid black;
			cursor: pointer;
			margin-left: 10px;
		}
		button:hover {
			background-color: lightgray;
		}
		#solid {
			border-top: 1px solid black;
		}
	</style>
</head>
<body>
	<%@ include file="common.jsp"%>
	<%String idParam = request.getParameter("id");
		ProductDao productDao = new ProductDao();
		List<CartDto> cartList = null;%>
	<h1 style="margin-left:100px">장바구니</h1>
	<table>
		<%if(id != null){
			cartList = productDao.selectCartList(id);
			if(cartList.size() != 0) {%>
		<thead>
			<tr>
				<th>선택</th>
				<th></th>	<!-- 이미지 -->
				<th style="text-align: center;">상품명</th>
				<th>상품금액</th>
				<th></th>	<!-- 수량감소 -->
				<th>수량</th>
				<th></th>	<!-- 수량증가 -->
				<th>주문금액</th>
				<th><button id="removeAllFromCart">전체삭제</button></th>	<!-- 삭제버튼 -->
			</tr>
		</thead>
		<%}}%>
		<tbody>
			<%			
			if(id != null){
				cartList = productDao.selectCartList(id);
	
				if(cartList.size() != 0) {
					for (CartDto item : cartList) {
					%>
					<tr class="" id="<%=item.getCode()%>">
						<td><input type="checkbox" checked></td>
						
						
						<td><a href="./productDetail.jsp?code=<%=item.getCode()%>" style="color:black; text-decoration: none;">
								<img style="width:50px" src="images/product_<%=item.getCode()%>.png"></a></td>
						<td><a href="./productDetail.jsp?code=<%=item.getCode()%>" style="color:black; text-decoration: none;">
								<%=item.getPname()%></a></td>
						<td><a href="./productDetail.jsp?code=<%=item.getCode()%>" style="color:black; text-decoration: none;">
								<%=item.getStrPrice()%></a></td>
						
						
						<td><button class="decreaseQtyBtn">-</button></td>
						<td><%=item.getQty()%></td>
						<td><button class="increaseQtyBtn">+</button></td>
						<td><%=item.getStrTotal()%></td>
						<td><button class="removeFromCart">삭제</button></td>
					</tr>
					<%
					}
				} else { %>
					<tr>
						<td colspan="9">장바구니에 담긴 상품이 없습니다.
						<a href="./shop.jsp"><button>상품보러가기</button></a></td>
					</tr>
				<% }
			} else {%>
					<tr>
						<td colspan="9">로그인을 하시면, 장바구니에 보관된 상품을 확인하실 수 있습니다.
						<a href="./member.jsp"><button>로그인하기</button></a></td>
					</tr>
			<% } %>
		</tbody>
		<% if(id != null){
			if(cartList.size() != 0) {%>
		<tfoot>
			<hr>
			<tr id="solid">
				<td colspan="2"></td>
				<td><a href="./shop.jsp"><button>상품 추가하러 가기</button></a></td>
				<td colspan="2"></td>
				<%
				CartDto cartDto = productDao.sumQtyTotal(id);
				int sumQty = cartDto.getQty();
				String sumTotal = cartDto.getStrTotal();
				%>
				<td><%=sumQty%></td>
				<td></td>
				<td><%=sumTotal%></td>
				<td></td>
			</tr>
		</tfoot>
		<% }} %>

	</table>

	<script>
		//수량감소버튼
		let decreaseBtnArr = document.querySelectorAll(".decreaseQtyBtn");
			for (let btn of decreaseBtnArr) {
		  	btn.addEventListener("click", decreaseBtn);
		}
		//수량감소버튼 함수
			function decreaseBtn() {
			const id = '<%=idParam%>';
			const code = $(this).parent().parent().attr('id');
			
			$.ajax({
				async : true, // 비동기 true
				type : 'get', // GET 타입
				data : { // 넘겨줄 매개변수, 실제로 ?id=input_id 형식으로 넘어감
					"id" : id,
					"code" : code
				},
				url : "./decreaseQtyCart.jsp", // 타겟 url 주소
				dataType : "json", // json 형태로 받아오겠다
				contentType : "application/json; charset=UTF-8",
				success : function(data) {            
					console.log(data.result);
					if (data.result === 'true') { //DB update 성공
						location.href = "cart.jsp?id="+id;
					} else {
						if(confirm("카트에서 삭제하시겠습니까?")){ // 수량 0개인데 수량감소 버튼 누르면 확인창
							$.ajax({
								async : true, // 비동기 true
								type : 'get', // GET 타입
								data : { // 넘겨줄 매개변수, 실제로 ?id=input_id 형식으로 넘어감
									"id" : id,
									"code" : code
								},
								url : "./removeFromCart.jsp", // 타겟 url 주소
								dataType : "json", // json 형태로 받아오겠다
								contentType : "application/json; charset=UTF-8",
								success : function(data) {            
									console.log(data.result);
									if (data.result === 'true') { //DB delete 성공
										location.href = "cart.jsp?id="+id;
									} else {
										alert("삭제 중 오류가 발생했습니다."); // delete중 오류발생
									}
								},
								error : function() {
									alert("오류가 발생했습니다. 다시 시도해주세요.");
								}
							})                                                                                                        
						};
					}
				},
				error : function() {
					alert("오류가 발생했습니다. 다시 시도해주세요.");
				}
			})
		}
		//수량추가버튼
		let increaseBtnArr = document.querySelectorAll(".increaseQtyBtn");
			for (let btn of increaseBtnArr) {
		  	btn.addEventListener("click", increaseBtn);
		}
		//수량추가버튼 함수
			function increaseBtn() {
			const id = '<%=idParam%>';
			const code = $(this).parent().parent().attr('id');
			
			$.ajax({
				async : true, // 비동기 true
				type : 'get', // GET 타입
				data : { // 넘겨줄 매개변수, 실제로 ?id=input_id 형식으로 넘어감
					"id" : id,
					"code" : code
				},
				url : "./increaseQtyCart.jsp", // 타겟 url 주소
				dataType : "json", // json 형태로 받아오겠다
				contentType : "application/json; charset=UTF-8",
				success : function(data) {            
					console.log(data.result);
					if (data.result === 'true') { //DB update 성공
						location.href = "cart.jsp?id="+id;
					} else {
						alert("처리 중 오류가 발생했습니다."); // update 중 오류발생
					}
				},
				error : function() {
					alert("오류가 발생했습니다. 다시 시도해주세요.");
				}
			})
		}
		//삭제버튼
		let removeBtnArr = document.querySelectorAll(".removeFromCart");
			for (let btn of removeBtnArr) {
		  	btn.addEventListener("click", deleteBtn);
		}
		//삭제버튼 함수
		function deleteBtn() {
			const id = '<%=idParam%>';
			const code = $(this).parent().parent().attr('id');
			/* alert(id+" "+code); */
			
			$.ajax({
				async : true, // 비동기 true
				type : 'get', // GET 타입
				data : { // 넘겨줄 매개변수, 실제로 ?id=input_id 형식으로 넘어감
					"id" : id,
					"code" : code
				},
				url : "./removeFromCart.jsp", // 타겟 url 주소
				dataType : "json", // json 형태로 받아오겠다
				contentType : "application/json; charset=UTF-8",
				success : function(data) {            
					console.log(data.result);
					if (data.result === 'true') { //DB delete 성공
						location.href = "cart.jsp?id="+id;
					} else {
						alert("삭제 중 오류가 발생했습니다."); // delete중 오류발생
					}
				},
				error : function() {
					alert("오류가 발생했습니다. 다시 시도해주세요.");
				}
			})
		}
		

		//전체삭제버튼
		document.querySelector("#removeAllFromCart").addEventListener("click", deleteAllBtn);

		//전체삭제버튼 함수
		function deleteAllBtn() {
			const id = '<%=idParam%>';
			
			if(confirm('장바구니 목록을 지우시겠습니까?')){
				$.ajax({
					async : true, // 비동기 true
					type : 'get', // GET 타입
					data : { // 넘겨줄 매개변수, 실제로 ?id=input_id 형식으로 넘어감
						"id" : id,
					},
					url : "./removeAllFromCart.jsp", // 타겟 url 주소
					dataType : "json", // json 형태로 받아오겠다
					contentType : "application/json; charset=UTF-8",
					success : function(data) {            
						console.log(data.result);
						if (data.result === 'true') { //DB delete 성공
							location.href = "cart.jsp?id="+id;
						} else {
							alert("삭제 중 오류가 발생했습니다."); // delete중 오류발생
						}
					},
					error : function() {
						alert("오류가 발생했습니다. 다시 시도해주세요.");
					}
				})
			}
		}

		
	</script>

	

</body>
</html>