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
	</style>
</head>
<body>
	<%@ include file="common.jsp"%>
	<h1 style="margin-left:100px">장바구니</h1>
	<table>
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
				<th></th>	<!-- 삭제버튼 -->
			</tr>
		</thead>
		<tbody>
			<%
			ProductDao productDao = new ProductDao();
			List<CartDto> cartList = null;
			
			if(id != null){
				cartList = productDao.selectCartList(id);
	
				if(cartList.size() != 0) {
					for (CartDto item : cartList) {
					%>
					<tr class="" id="<%=item.getCode()%>">
						<td><input type="checkbox"></td>
						<td><img style="width:50px" src="images/product_<%=item.getCode()%>.png"></td>
						<td><%=item.getPname()%></td>
						<td><%=item.getStrPrice()%></td>
						<td><button class="decreaseQty">-</button></td>
						<td><%=item.getQty()%></td>
						<td><button class="increaseQty">+</button></td>
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
	</table>

	<script>
	
		let removeBtnArr = document.querySelectorAll(".removeFromCart");
			for (let btn of removeBtnArr) {
		  	btn.addEventListener("click", deleteBtn);
		}
		
		function deleteBtn() {
			const code = $(this).parent().parent().attr('id');
			
			alert(' ' + code);
			
			/* $.ajax({
				async : true, // 비동기 true
				type : 'get', // GET 타입
				data : { // 넘겨줄 매개변수, 실제로 ?id=input_id 형식으로 넘어감
					"input_id" : input_id,
					"input_pw" : input_pw,
					"input_name" : input_name,
					"input_nickname" : input_nickname
				},
				url : "./actions/register_action.jsp", // 타겟 url 주소
				dataType : "json", // json 형태로 받아오겠다
				contentType : "application/json; charset=UTF-8",
				success : function(data) {
					//console.log(data.result);
					if (data.result === 'true') { // 회원가입 DB insert 성공
						alert("가입완료!");
						location.href = "./login.jsp";
					} else {
						alert("회원가입중 오류가 발생했습니다."); // DB insert중 오류발생함
					}
				},
				error : function() {
					alert("오류가 발생했습니다. 다시 시도해주세요.");
				}
			}) */
		}

	</script>

	

</body>
</html>