<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="dao.ProductDao"%>
<%@ page import="dto.ProductDto"%>
<%@ page import="dao.PersonDao"%>
<%@ page import="dto.PersonDto"%>
<%@ page import="dto.CartDto"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제창</title>
</head>
<body>
<%@ include file="common.jsp"%>
<%
	PersonDao personDao = new PersonDao();
	PersonDto personDto = personDao.selectPersonInfoById(id);
	ProductDao productDao = new ProductDao();
	List<CartDto> cartList = productDao.orderList(id);
	CartDto cartDto = productDao.sumQtyTotal(id);
	if(cartDto.getQty() == 0){
%>	
	<script>
		alert('선택한 상품이 없습니다.');
		location.href = "./cart.jsp?id=<%=id%>";
	</script>
 <%} else { %>
<h1>주문 정보</h1>
<p>주문자명:<%=personDto.getName()%></p>
<p>받을주소:<%=personDto.getAddress()%></p>
<!-- <p>전화번호:</p> -->
<br><br>
<h1>주문 상품 목록</h1>
<table>
	<thead>
		<tr>
			<th>상품명</th>
			<th>상품금액</th>
			<th>주문수량</th>
			<th>주문금액</th>
		</tr>
	</thead>
	<tbody>
	<%
		for(CartDto item : cartList){ %>
		<tr>
			<td><%=item.getPname()%></td>
			<td><%=item.getStrPrice()%></td>
			<td><%=item.getQty()%></td>
			<td><%=item.getStrTotal()%></td>
		</tr>
	<%} %>
	</tbody>
	<tfoot>
		<tr>
			<td></td>
			<td></td>
			<th>총 수량</th>
			<th>총 금액</th>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<th><%=cartDto.getQty()%></th>
			<th><%=cartDto.getStrTotal()%></th>
		</tr>
	</tfoot>
</table><br><br>
<%}%>

<h1>결제 정보</h1><br><br>

<%=cartDto.getStrTotal()%>원
<button onclick="pay()">결제하기</button>
<script>
	function pay() {
		if(confirm('결제하시겠습니까?')){
			  location.href = "./orderCheck.jsp";
		} 
	}
</script>

</body>
</html>