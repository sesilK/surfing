<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="dao.ReserveDao"%>
<%@ page import="dto.ReserveDto"%>

<title>Insert title here</title>
<style>
.cancel-btn{
 border: 3px solid #519d9e;
    color: darkgray;
}
.reserve_check_box{
margin-bottom:100px;
margin-top:50px;
}
 
</style>


	<%@ include file="common.jsp"%>
	
	<!-- 로그인해야됨 -->
	<%
	id = (String)session.getAttribute("id");
	%>
	<h1>예약확인창🤙🏾</h1>

<div class="reserve_check_box">
	<table class="table">
		<thead>
			<tr>
				<th>예약일자</th>
				<th>인원</th>
				<th>레벨</th>
				<th>예약상태</th>
				<th>강습당담자</th>
				<th><th>
			</tr>
		</thead>
		<tbody>
			<%
			ReserveDao reserveDao = new ReserveDao();
			List<ReserveDto> reserveList = null;
			try {
				reserveList = reserveDao.selectReserveList(id);
			} catch (Exception e) {
			%>
		
			<%
			}

			/* 		List<ReserveDto> reserveList = reserveDao.selectReserveList("admin"); */

			for (ReserveDto item : reserveList) {
			%>
			<tr class="" id="<%=item.getNo()%>">
				<td><%=item.getDate()%></td>
				<td><%=item.getPersons()%></td>
				<td><%=item.getStage()%></td>
				<td><%=item.getState()%></td>
				<td><%=item.getTeacher()%></td>
				<td><% if(item.getState().equals("예약완료")) { %>
					<button class="cancel-btn" id='cancel_<%=item.getNo()%>'>예약취소</button>
				<%}%>
				</td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
</div>

<%@ include file="footer.jsp"%>

<script>
	window.onload = function () {
		let btnArr = document.querySelectorAll(".cancel-btn");
		for(let btn of btnArr) {
			btn.addEventListener("click", function() {
				const no = $(this).parent().parent().attr('id'); // 버튼의 부모의 부모를 찾아서 id값이 뭐냐
				if(confirm('예약을 취소 하시겠습니까?')){
					location.href = "reserve_update.jsp?no=" + no;
				}	
			});
		}
	}
</script>
