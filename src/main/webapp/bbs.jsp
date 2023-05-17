<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="dao.BbsDao"%>
<%@ page import="dto.BbsDto"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 게시판</title>
</head>
<style>

.bbs_table th {
	background-color: #EDE6C5;
	border: 1px solid #ddd;
	padding: 10px;
	text-align: center;
}

.bbs_table td {
	border: 1px solid #ddd;
	padding: 10px;
	text-align: center;
}
</style>
<body>
	<%@ include file="common.jsp"%>

	<!-- 로그인해야됨 -->
	<%
	id = (String) session.getAttribute("id");
	request.setCharacterEncoding("UTF-8"); //한글 정상 인식을 위해
	%>

	<div class="container">
		<div class="bbs_table">
			<table>
				<thead>
					<tr>
						<th>no</th>
						<th>title</th>
						<th>name</th>
						<th>date</th>
						<th>answer</th>
					</tr>
				</thead>

				<tbody>
					<%
					BbsDao dao = new BbsDao();
					List<BbsDto> bbsList = null;
					bbsList = dao.selectBbsList();
					
					for (BbsDto item : bbsList) {
					%>
					<tr class="bbs_list" id="<%=item.getNo()%>">
						<td><%=item.getNo()%></td>
						<td><a
							href="./bbs_con_view.jsp?id=<%=item.getId()%>&no=<%=item.getNo()%>"><%=item.getTitle()%></a></td>
						<td><%=item.getId()%>님</td>
						<td><%=item.getBbs_date()%></td>
						
					    <% if(item.getAnswer_check()==1){ %>
					    <td>답변완료</td>
					    <%} else {%>
					    <td>답변아직</td>
					    <%} %>
					</tr>
					<%}%>
				</tbody>
			</table>
		</div>

		<button id="bbs_insertBtn">문의하기</button>
	</div>


	<script>
	//로그인 해야 글쓰기 가능 
		document.getElementById('bbs_insertBtn').addEventListener('click', () => {
  
		if ('<%=id%>' == 'null') {
	  	  		alert('로그인을 해야 글쓰기 가능합니다');
	  	 	 location.href = './member.jsp';
 		 } else {
    		location.href = './bbs_addcontent.jsp';
  		}
	
		});

</script>
</body>
</html>