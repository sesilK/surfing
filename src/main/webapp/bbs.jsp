<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="dao.BbsDao"%>
<%@ page import="dto.BbsDto"%>

<title>문의 게시판</title>

<style>
.bbs_box{
	margin-top:80px;
	margin-bottom: 300px;
}
.bbs_table th {
	border-top: 1px solid #ddd;
	background-color: #EDE6C5;
	padding: 10px;
	text-align: center;
}

.bbs_table td {
	border-top: 1px solid #ddd;
	padding: 10px;
	text-align: center;
	text-decoration:none;
}
td >img {
	width: 80px;
	height: 30px;
}

#bbs_insertBtn{
  border: 0;
  outline: none;
  margin: 10px;
  background: black;
  color: white;
  padding: 10px;
  cursor: pointer;
  border-radius: 10px;
  float: right;
}
</style>

	<%@ include file="common.jsp"%>

	<!-- 로그인해야됨 -->
	<%
	id = (String) session.getAttribute("id");
	request.setCharacterEncoding("UTF-8"); //한글 정상 인식을 위해
	%>

	<div class="bbs_box">
		<div class="bbs_table">
			<div style="display: inline-block; width: 100%;">
			<h1>문의게시판</h1>
			<button id="bbs_insertBtn">질문하기</button>
			</div>
			
			<table>
				<thead>
					<tr>
						<th style="width: 50px;">no</th>
						<th style="width: 400px;">title</th>
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
					    <td><img src="images/answerok.png"></td>
					    <%} else {%>
					    <td><img src="images/answerno.png"></td>
					    <%} %>
					</tr>
					<%}%>
				</tbody>
			</table>
		</div>
	</div>

<%@ include file="footer.jsp"%>
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

