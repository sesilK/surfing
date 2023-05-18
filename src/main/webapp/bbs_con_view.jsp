<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="dao.BbsDao"%>
<%@ page import="dto.BbsDto"%>

<title>Insert title here</title>

<style>
.view_container {
	margin-bottom: 100px;
}

.board {
	border-collapse: collapse;
}

.board th {
	background-color: #EDE6C5;
	border-top: 1px solid #ddd;
	padding: 10px;
	text-align: center;
	width: 800px;
}

.board td {
	border-top: 1px solid #ddd;
	padding: 10px;
	text-align: center;
}

.board input {
	height: 5vh;
	border: 1px solid #ddd;
}

#deleteBtn, #updateBtn, #answerBtn {
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

.answerbox {
	margin-top: 100px;
	width: 800px;
}

.answerbox input {
	width: 800px;
	height: 100px;
}

.viewtop_box{
	margin-bottom: 50px;
	display:inline-block;
}
</style>

<%@ include file="common.jsp"%>
<%
String bbsId = request.getParameter("id"); //작성자 아이디
int no = Integer.parseInt(request.getParameter("no"));
BbsDao dao = new BbsDao();
BbsDto bbsDto = dao.selectBbsByNo(no);
%>

	<div class="viewtop_box">
		<h1>
			no.<%=bbsDto.getNo()%> <%=bbsDto.getId()%>님 문의사항
		</h1>
	</div>
<div class="view_container">


	<div class="bbs_view">
		<form name="DeleteForm" method="post">

			<table class="board">
				<input id="form_no" name="form_no" type="hidden"
					value="<%=bbsDto.getNo()%>"></input>
				<tr>
					<th>제목</th>
				</tr>
				<tr>
					<td id="title"><%=bbsDto.getTitle()%></td>
				</tr>
				<tr>
					<th>내용</th>
				</tr>
				<tr style="height: 400px;">
					<td id="content"><%=bbsDto.getBbs_content()%></td>
				</tr>
			</table>
			<br>
			<br>
			<br>
			<br>
			<table class="board" style="width: 800px;">
				<%
				if (bbsDto.getAnswer_check() == 1) {
				%>
				<tr>
					<th>답변</th>
				</tr>
				<tr>
					<td id="answer"><%=bbsDto.getAnswer_content()%></td>
				</tr>
				<%
				}
				%>
			</table>
		</form>
	</div>


	<%
	if (id != null) { //로그인 안하면 비교대상이 없기때문에
		if (id.equals(bbsId)) {
	%>
	<button id="deleteBtn">글 삭제하기</button>
	<%
	if (bbsDto.getAnswer_check() == 0) {
	%>
	<button id="updateBtn" onclick="editPost()">수정하기</button>

	<%
	}
	}
	if (id.equals("admin") && bbsDto.getAnswer_check() == 0) {
	%>
	<div class="answerbox">
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

<%@ include file="footer.jsp"%>
