<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<title>게시물 기입하는 곳</title>

<style>
.addcon_box{
	margin-top:40px;
	margin-bottom: 100px;
	display:inline-block;
}
#TextinsertBtn{
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
.addcon_box th>input {
	background-color: #EDE6C5;
	border: 1px solid #ddd;
	padding: 10px;
	text-align: center;
	width : 800px;
	height: 80px;
}

.addcon_box td>input {
	border: 1px solid #ddd;
	padding: 10px;
	text-align: center;
	width : 800px;
	height: 500px;
}
</style>

	<%@ include file="common.jsp"%>

	<%
	request.setCharacterEncoding("UTF-8"); //한글 정상 인식을 위해
	%>

<div class="addcon_box">
	<button id="TextinsertBtn">발행</button><br>
	<table>
		<tr>
		<th><input type="text" id="inputTitle" name="title" placeholder="제목">
		</th>
		</tr>
		
		<tr>
		<td><input type="text" id="inputText" name="content" placeholder="내용을입력하세요"></td>
		</tr>
	</table>
</div>

<script>
 		document.getElementById('TextinsertBtn').addEventListener('click', ()=>{
			
 			let inputTitle = document.getElementById('inputTitle');
			let inputTitleValue = document.getElementById('inputTitle').value;
			let inputTextValue = document.getElementById('inputText').value;
			
			if(inputTitleValue == ""){
				
				alert('제목은 필수 입니다.');
				inputTitle.focus();
				
			} else {
				
				if( confirm('글을 게시하시겠습니까?') ){
					$.ajax({
						async : true, // 비동기 true
						type : 'get', // GET 타입
						data : { // 넘겨줄 매개변수, 실제로 ?id=input_id 형식으로 넘어감
							"inputTitle" : inputTitleValue,
							"inputText" : inputTextValue
						},
						url : "./bbs_addcon_proc.jsp", // 타겟 url 주소
						dataType : "json", // json 형태로 받아오겠다
						contentType : "application/json; charset=UTF-8",
						success : function(data) {
							if (data.result === 'true') { //DB insert/update 성공
								alert("게시물 작성 완료")
								location.href = "./bbs.jsp"	//게시판으로 이동
							} else if (data.result === 'false') {
								alert("작성 실패");
							} 
						},
						error : function(data) {
							alert(data.test);
							alert("오류 발생");
						}
					})

				}
			}
		}); 
		
	</script>
<%@ include file="footer.jsp"%>
