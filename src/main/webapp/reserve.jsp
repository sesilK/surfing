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

li {
	list-style: none;
}

.formbox {
	background-color: rgb(240, 240, 240);
	width: 100%;
	height: 100px;
	padding: 35px;
	display: inline-block;
}

#insertBtn{
	margin-left:0px;
}


</style>

</head>
<body>
	<%@ include file="common.jsp"%>
	
	<div class="container">
		<div class="formbox">
			<form name='reserveForm' action="reserve_proc.jsp" method="post">
				<fieldset>

					<label for="date">날짜🗓</label>
					 <input type="date" id="date" class="date" name="date" required>

					<label for="time">시간⌚</label>
		        	 10시<input type="radio" name="time" value="10시" checked>
		        	 1시<input type="radio" name="time" value="1시">
                     3시<input type="radio" name="time" value="3시">

					<label for="stage">강습선택🏄🏾‍♂️</label> 
					<select id="stage" name="stage" required>
						<option value="1">BEGINNER</option>
						<option value="2">LEARNNE</option>
						<option value="3">APPRENTIC</option>
					</select> 
					
					<label for="persons">강습인원👨🏾‍🦲</label> 
					<select id="persons" name="persons" required>
						<option value="1">1명</option>
						<option value="2">2명</option>
						<option value="3">3명</option>
						<option value="4">4명</option>
						<option value="5">5명</option>
						<option value="6">6명</option>
						<option value="7">7명</option>
						<option value="8">8명</option>
						<option value="9">9명</option>
						<option value="10">10명</option>
					</select>

					<button id="insertBtn" type="button" class="btn btn-success">예약하기</button>
					<button id="insertck_Btn" type="button" class="btn btn-success">예약확인</button>
					
				</fieldset>
			</form>
		</div>

		<div class="rule">
			<b>👉 강습/렌탈 환불규정안내</b>
			<ul>
				<li>✔10인 이상 강습 예약 시 샵으로 연락 부탁드립니다.</li>
				<li>✔강습/렌탈 당일 취소는 환불이 불가합니다.</li>
				<li>✔강습/렌탈 이틀 전 취소하시면 전액 환불 가능합니다.</li>
				<li>✔강습/렌탈 하루 전 취소하시면 50% 위약금을 부담하셔야 합니다.</li>
				<li>✔기상에 따라 강습을 연기해야 할 경우에는 연기·환불이 가능합니다.</li>
				<li>✔기상악화 : 태풍주의보, 태풍경보, 풍랑경보, 기타 대표코치 판단에 의한 강습불가 인 경우 (우천시 취소
					불가)</li>
			</ul>
		</div>
	</div>


	<script>
			/* 예약하기 버튼 */	
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
			
			// 예약확인 버튼

			document.getElementById('insertck_Btn').addEventListener('click', () => {
			  
			<%-- alert('<%=id%>'); --%>
 			if ('<%=id%>' == 'null') {
				    alert('로그인을 해야 예약확인 가능합니다');
				    location.href = './member.jsp';
			  } else {
			    	location.href = './reserve_check.jsp';
			  }
				
			});

			
			
			// 현재 날짜를 구합니다.
			const today = new Date().toISOString().split('T')[0];

			// date input 요소의 min 속성을 현재 날짜로 설정합니다.
			document.getElementById("date").min = today;
			
			//한달 이후 부터 예약불가
			const maxDate = new Date();
			maxDate.setDate(maxDate.getDate() + 30);
			document.getElementById("date").max = maxDate.toISOString().split('T')[0];
			
			
        </script>


</body>
</html>