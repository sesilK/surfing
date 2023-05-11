<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 기입하는 곳</title>
</head>
<body>

	<%@ include file="common.jsp"%>

	<%
	request.setCharacterEncoding("UTF-8"); //한글 정상 인식을 위해
	%>

<form name='contentform' action='bbs_addcon_proc.jsp' method="post">
	<table>
		<tr>
			<th><input type="text" id="inputTitle" name="title" placeholder="글제목">
			</th>
		</tr>
		<tr>
			<td><input type="text" id="inputText" name="content" placeholder="내용을입력하세요"></td>
		</tr>
	</table>
	<button id="TextinsertBtn">발행</button>
</form>	


<script>
		document.getElementById('TextinsertBtn').addEventListener('click', ()=>{
			let form = document.personAddForm;
			
			let inputName = document.getElementById('inputTitle');
			if(inputName.value == ""){
				alert('제목은 필수 입니다.');
				inputTitle.focus();
			} else {
				if(confirm('')){
					form.submit();
				}				
			}
		});
		
	</script>
</body>
</html>