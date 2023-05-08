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
</head>
<body>
	<%@ include file="common.jsp"%>

	<form name='reserveForm' action="reserve_proc.jsp" method="post">
		<fieldset>
		
			<label for="date">날짜:</label> 
			<input type="date" id="date" name="date" required><br>
			
			<!-- <label for="time">시간:</label>
			<input type="time" id="time" name="time" required><br> -->
			
			<label for="stage">강습선택:</label>
			<select id="stage" name="stage" required>
				<option value="1">BEGINNER</option>	<!-- BEGINNER -->
				<option value="2">LEARNNE</option>	<!-- LEARNNE -->
				<option value="3">APPRENTIC</option>	<!-- APPRENTIC -->
			</select><br> 
			
			<label for="persons">강습인원:</label> <select id="persons"
				name="persons" required>
				<option value="1">1명</option>
				<option value="2">2명</option>
				<option value="3">3명</option>
				<option value="4">4명</option>
				<option value="5">5명</option>

			</select><br>
			
			<button id="insertBtn" type="button" class="btn btn-primary">예약하기</button>
		</fieldset>
		</form>
		
		
		<div class="reserv_left_content">
                <div class="info_rule">
                    <b class="tit">👉 강습/렌탈 환불규정안내</b>
                    <p class="dark3">그린웨이브 강습/렌탈 ·환불 규정은 [서프홀릭 장비대여 및 강습 약관]에 의해 처리 됩니다.<br>
                        강습신청하시는 경우 약관에 동의한 것으로 간주합니다.<br>
                        강습생이 많은 관계로 취소 시 강습 일정에 차질이 있기 때문에 불가피 하게 정한 규정입니다. 죄송합니다.</p>
                    <ul>
                        <li>강습/렌탈 당일 취소는 환불이 불가합니다.</li>
                        <li>강습/렌탈 이틀 전 취소하시면 전액 환불 가능합니다.</li>
                        <li>강습/렌탈 하루 전 취소하시면 50% 위약금을 부담하셔야 합니다.</li>
                        <li>기상에 따라 강습을 연기해야 할 경우에는 연기·환불이 가능합니다.</li>
                        <li>기상악화 : 태풍주의보, 태풍경보, 풍랑경보, 기타 서프홀릭 대표코치 판단에 의한 강습불가 인 경우 (비 내린다고 강습이 취소 되거나 연기 되진 않습니다.)</li>
                    </ul>
                </div>
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