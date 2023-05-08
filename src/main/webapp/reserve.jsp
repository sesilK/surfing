<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="dao.ReserveDao"%>
<%@ page import="dto.ReserveDto"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

.container {
	width: 90%;
	margin: 0 auto;
}
li{
   list-style:none;
}

</style>

</head>
<body>
	<%@ include file="common.jsp"%>

	<div class="container">
		<div class= >
			<form name='reserveForm' action="reserve_proc.jsp" method="post">
				<fieldset>

					<label for="date">날짜:</label> <input type="date" id="date"
						name="date" required><br>

					<!-- <label for="time">시간:</label>
			<input type="time" id="time" name="time" required><br> -->

					<label for="stage">강습선택:</label> <select id="stage" name="stage"
						required>
						<option value="1">BEGINNER</option>
						<!-- BEGINNER -->
						<option value="2">LEARNNE</option>
						<!-- LEARNNE -->
						<option value="3">APPRENTIC</option>
						<!-- APPRENTIC -->
					</select><br> <label for="persons">강습인원:</label> <select id="persons"
						name="persons" required>
						<option value="1">1명</option>
						<option value="2">2명</option>
						<option value="3">3명</option>
						<option value="4">4명</option>
						<option value="5">5명</option>

					</select><br>

					<button id="insertBtn" type="button" class="btn btn-primary">예약하기</button>
					<a href="./reserve_check.jsp"><button id="insertck_Btn" type="button" class="btn btn-primary">예약확인</button></a>
				</fieldset>
			</form>
		</div>


		<div class="info_rule">
			<b class="tit">👉 강습/렌탈 환불규정안내</b>
			<ul>
				<li>✔강습/렌탈 당일 취소는 환불이 불가합니다.</li>
				<li>✔강습/렌탈 이틀 전 취소하시면 전액 환불 가능합니다.</li>
				<li>✔강습/렌탈 하루 전 취소하시면 50% 위약금을 부담하셔야 합니다.</li>
				<li>✔기상에 따라 강습을 연기해야 할 경우에는 연기·환불이 가능합니다.</li>
				<li>✔기상악화 : 태풍주의보, 태풍경보, 풍랑경보, 기타 대표코치 판단에 의한 강습불가 인 경우
					(우천시 취소 불가)</li>
			</ul>
		</div>

	
	<script>
	
			document.getElementById('insertBtn').addEventListener('click', ()=>{
			let form = document.reserveForm;
			
			let inputDate = document.getElementById('date');
			/* let inputTime = document.getElementById('time'); */

			if(inputDate.value == ""){
				alert('날짜는 필수입니다');
				inputDate.focus();
			} else {
				if(confirm('예약하시겠습니까?')){
					form.submit();
				}				
			}

		});
		

		</script>
</body>
</html>