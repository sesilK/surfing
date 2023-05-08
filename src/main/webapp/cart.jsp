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
	<h1>장바구니</h1>
	<table>
		<thead>
			<tr>
				<th>선택</th>
				<th style="text-align: center;">상품명</th>
				<th>상품금액</th>
				<th></th>
				<th>수량</th>
				<th></th>
				<th>주문금액</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<%
			ProductDao productDao = new ProductDao();
			List<CartDto> cartList = null;
			cartList = productDao.selectCartList(id);

			if(cartList != null) {
				for (CartDto item : cartList) {
				%>
				<tr class="" id="<%=item.getCode()%>">
					<td><input type="checkbox"></td>
					<td><%=item.getPname()%></td>
					<td><%=item.getStrPrice()%></td>
					<td><button>+</button></td>
					<td><%=item.getQty()%></td>
					<td><button>-</button></td>
					<td><%=item.getStrTotal()%></td>
					<td><button class="RemoveFromCart" id=<%=item.getCode()%>>삭제</button></td>
				</tr>
				<%
				}
			} else { %>
				<tr>
					<td colspan="4">장바구니에 담긴 상품이 없습니다.</td>
				</tr>
			<% } %>

		</tbody>
	</table>
</body>
</html>