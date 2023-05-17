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
	int no = Integer.parseInt(request.getParameter("no"));
	BbsDao dao = new BbsDao();
	BbsDto bbsDto = dao.selectBbsByNo(no);
	%>
	<div class="container">
		<div class="bbs_view">
			<form name="DeleteForm" method="post">
				<h1><%=bbsDto.getId()%>님 문의사항
				</h1>

				<table class="board">
					<input id="form_no" name="form_no" type="hidden"
						value="<%=bbsDto.getNo()%>"></input>
					<tr>
						<th rowspan="2">no <%=bbsDto.getNo()%></th>
						<th>제목</th>
					</tr>
					<tr>
						<td id="title"><%=bbsDto.getTitle()%></td>
					</tr>
					<tr>
						<th colspan="2">내용</th>
					</tr>
					<tr>
						<td id="content" colspan="2"><%=bbsDto.getBbs_content()%></td>
					</tr>
					<%if(bbsDto.getAnswer_check()==1){ %>
					<tr>
						<th colspan="2">답변</th>
					</tr>
					<tr>
						<td id="answer" colspan="2"><%=bbsDto.getAnswer_content()%></td>
					</tr>
					<%} %>
				</table>
			</form>
		</div>

	
		<%
		if (id != null) { //로그인 안하면 비교대상이 없기때문에
			if (id.equals(bbsId)) {
		%>
		<button id="deleteBtn">삭제하기</button>
		<% if(bbsDto.getAnswer_check()==0){%>
		<button id="updateBtn" onclick="editPost()">수정하기</button>
		
				<%
		}}
			if (id.equals("admin") && bbsDto.getAnswer_check()==0) {
		%>
			<form name="answerForm" method="post">
				<input name="form_no" type="hidden" value="<%=bbsDto.getNo()%>"></input>
				<input name="writer_id" type="hidden" value="<%=bbsDto.getId()%>"></input>
				<input id="answer" name="answer">
				<button id="answerBtn">답글남기기</button>
			</form>
		<%	
			}
		}
		%>
	</div>


	<script>
	
//답글달기
	document.getElementById('answerBtn').addEventListener('click', ()=>{
		let form =document.answerForm;
		let answer = document.getElementById("answer");
		if(answer.value!=''){
			form.action = 'bbs_answer_proc.jsp';
			form.submit();
		} else {
			alert('답글 내용을 입력해주세요.');
		}
	});
	
//삭제하기
		document.getElementById('deleteBtn').addEventListener('click', ()=>{
			let form =document.DeleteForm;
			if(confirm('삭제 하시겠습니까?')){
				form.action = 'bbs_delete_proc.jsp';
				form.submit();
			}
		});


//수정하기
	function editPost() {
		let title = document.getElementById("title");
		let content = document.getElementById("content");

		let titleInput = document.createElement("input");
		titleInput.type = "text";
		titleInput.style.width = "100%";
		titleInput.placeholder = "제목 입력";
		titleInput.value = title.innerText;

		let contentInput = document.createElement("input");
		contentInput.type = "text";
		contentInput.style.width = "100%";
		contentInput.placeholder = "내용 입력";
		contentInput.value = content.innerText;

		title.replaceWith(titleInput);
		content.replaceWith(contentInput);

		titleInput.id = "titleInput";
		contentInput.id = "contentInput";

		let updateBtn = document.getElementById("updateBtn");
		updateBtn.innerText = "수정완료";
		updateBtn.onclick = function() {
			let update_title = document.getElementById("titleInput").value;
			let update_content = document.getElementById("contentInput").value;
			let writer_id = "<%=bbsDto.getId()%>";
			let content_no ="<%=no%>";
			

			
			location.href = "bbs_update_proc.jsp?id=" + writer_id
					+ "&no=" + content_no
					+ "&title=" + update_title
					+ "&content=" + update_content;
			
		}
	}
</script>

</body>
</html>
