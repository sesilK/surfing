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
	
	int code = Integer.parseInt(request.getParameter("code"));
	
	List<CartDto> cartList = null;
	CartDto cartDto = null;
	
	if(code != 0){	//바로구매
		cartList = productDao.somethingToBuy(code);
		cartDto = cartList.get(0);
		
	} else {	//장바구니 통해서 구매
		cartList = productDao.orderList(id);
		cartDto = productDao.sumQtyTotal(id);
	}
	
	
	if(cartDto.getQty() == 0){
%>	
	<script>
		alert('선택한 상품이 없습니다.');
		location.href = "./cart.jsp?id=<%=id%>";
	</script>
 <%} else { %>
<div class="order_box" style="margin-top:80px;
	margin-bottom: 300px;">
<h1>주문 정보</h1><br>
<p>주문자명<input id="info1" value="<%=personDto.getName()%>"></p><br>
<p>받을주소<input id="info2" value="<%=personDto.getAddress()%>" style="width: 400px;"></p><br>
<br><br>
<table>
	<thead>
		<tr>
			<th></th>
			<th>상품명</th>
			<th>상품금액</th>
			<th style="white-space: pre;">    수량    </th>
			<th>주문금액</th>
		</tr>
	</thead>
	<tbody>
	<%
		for(CartDto item : cartList){ %>
		<tr>
			<td style="white-space: pre;"><img style="width:50px" src="images/<%=item.getFilename()%>">   </td>
			<td style="white-space: pre;">   <%=item.getPname()%>   </td>
			<td><%=item.getStrPrice()%></td>
			<td><%=item.getQty()%></td>
			<td><%=item.getStrTotal()%></td>
		</tr>
	<%} %>
	</tbody>
	<hr>
	<tfoot>
		<tr><td colspan="5" style="white-space: pre;"> </td></tr>
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<th>총 수량</th>
			<th>총 금액</th>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<th><%=cartDto.getQty()%></th>
			<th><%=cartDto.getStrTotal()%></th>
		</tr>
	</tfoot>
</table><br><br><br>
<%}%>
<form action="./payment.jsp" method="get">
	<br><br>
<h1>결제 정보</h1><br>
		<label for="payment">결제 방법:</label>
		<select id="payment" name="payment">
		  <option value="none">선택하세요</option>
		  <option value="신용카드">신용카드</option>
		  <option value="카카오페이">카카오페이</option>
		  <option value="무통장입금">무통장입금</option>
		</select><br><br>
		
<%=cartDto.getStrTotal()%>원
<button type="button" onclick="pay()">결제하기</button>
<input type="hidden" name="code" value="<%=code%>">
</form>
</div>

<script>
	function pay() {
		let payment = document.getElementById('payment').value;
		
		if(payment == 'none'){
			alert('결제 방식을 선택해주세요.');
		} else {
			if(confirm('결제하시겠습니까?')){
				document.querySelector('form').submit();
			}
		}

	}
</script>
<%@ include file="footer.jsp"%>


<style>
		table {
			border-collapse: collapse;
		}
		table, th, td {
            border: none;
		}
</style>