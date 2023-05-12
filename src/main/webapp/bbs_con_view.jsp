<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="dao.BbsDao"%>
<%@ page import="dto.BbsDto"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
  .board {
    border-collapse: collapse; 
    width: 100%;
  }
  .board th {
    background-color: #EDE6C5; 
    border: 1px solid #ddd; 
    padding: 10px; 
    text-align: center; 
  }
  .board td {
    border: 1px solid #ddd; 
    padding: 10px; 
     text-align: center;  
  }
</style>
<body>
	<%@ include file="common.jsp"%>
	<% 
		String bbsId = request.getParameter("id"); //작성자 아이디
		int no =Integer.parseInt(request.getParameter("no"));
		BbsDao dao = new BbsDao();
		BbsDto bbsDto = dao.selectBbsByNo(no);
		//String id = (String) session.getAttribute("id");
	
	%>
	<div class ="container">
		<div class= "bbs_view">
			<h1><%=bbsDto.getId()%>님 문의사항</h1>
			
			<table class="board">
				<tr>
					<th>제목</th>
				</tr>
				<tr>
					<td><%=bbsDto.getTitle()%></td>
				</tr>
				<tr>
					<th>내용</th>
				</tr>
				<tr>
					<td><%=bbsDto.getBbs_content()%></td>
				</tr>
			</table>
		
		</div>
		<%
		if (id != null){ //로그인 안하면 비교대상이 없기때문에
		if( id.equals(bbsId) ) {%>
		<button id="deleteBtn">삭제하기</button>
		<button id="updateBtn">수정하기</button>
		<% }} %>
		
	<!-- 	<div class= "bbs_comment">
		댓글<input type = text>
		<button>댓글올리기</button>
		</div> -->
		
	</div>
	

</body>
</html>