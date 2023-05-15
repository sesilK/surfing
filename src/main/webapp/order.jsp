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
<p>주문자명<input id="info1" value="<%=personDto.getName()%>"></p>
<p>받을주소<input id="info2" value="<%=personDto.getAddress()%>" style="width: 600px;"></p>
<p>연 락 처<input id="info3" style="width: 40px;">-
		 <input id="info4" style="width: 50px;">-
		 <input id="info5" style="width: 50px;"></p>
<br><br>
<h1>주문 상품 목록</h1>
<table>
	<thead>
		<tr>
			<th></th>
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
			<td><img style="width:50px" src="images/<%=item.getFilename()%>"></td>
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


<script>
	function pay() {
		let payment = document.getElementById('payment').value;
		let info1 = document.getElementById('info1').value;
		let info2 = document.getElementById('info2').value;
		let info3 = document.getElementById('info3').value;
		let info4 = document.getElementById('info4').value;
		let info5 = document.getElementById('info5').value;
		
		if(info1!="" && info2!="" && info3!="" && info4!="" && info5!=""){
			if(payment == 'none'){
				alert('결제 방식을 선택해주세요.');
			} else {
				if(confirm('결제하시겠습니까?')){
					location.href = "./payment.jsp?payment="+payment;
				}
			}
		} else {
			alert('주문 정보를 모두 입력해주세요.');
		}
		

	}
</script>

</body>
</html>