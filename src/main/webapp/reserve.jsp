<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="dao.ReserveDao"%>
<%@ page import="dto.ReserveDto"%>

<style>
li {
	list-style: none;
}

.reserve_box {
	margin-bottom: 100px;
	margin-top: 50px;
}

#insertBtn {
	margin-left: 0px;
}
/* 예약박스 */
fieldset{
	border:none;
	background-color: rgb(217, 226, 231);
	width: 80%;
	height: 100px;
	margin: auto;
	margin-bottom:40px;
	padding-top:10px;
}
input ,label{
margin : 10px;
}


/* 레슨정보 */
#lesson_list {
	margin: 30px;
}
table {
	margin-left:220px;
	width: 400px;
	border-top: 1px solid #444444;
}

th, td {
	border-bottom: 1px solid #444444;
	padding: 10px;
}

th:first-child, td:first-child {
	border-left: none;
}

img {
	width: 300px;
	height: 400px;
}

/* 레슨버튼 */

#lesson_list>button{
  background:#bdbfc0;
  color:#fff;
  border:none;
  position:relative;
  height:40px;
  font-size:20px;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
#lesson_list>button:hover{
  background:#fff;
  color:#354e58;
}
#lesson_list>button:before,button:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #bdbfc0;
  transition:400ms ease all;
}
#lesson_list>button:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
#lesson_list>button:hover:before,button:hover:after{
  width:100%;
  transition:800ms ease all;
}



</style>


<%@ include file="common.jsp"%>

<div class="reserve_box">
	<div class="formbox">
		<form name='reserveForm' action="reserve_proc.jsp" method="post">
			<fieldset>
				<label for="date">예약날짜</label> <input type="date" id="date"
					class="date" name="date" required> <label for="time">시간⌚</label>
				10시<input type="radio" name="time" value="10시" checked> 1시<input
					type="radio" name="time" value="1시"> 3시<input type="radio"
					name="time" value="3시"> 
					<br><label for="stage">강습선택🏄🏾‍♂️</label>
				<select id="stage" name="stage" required>
					<option value="1">BEGINNER</option>
					<option value="2">LEARNNE</option>
					<option value="3">APPRENTIC</option>
				</select> <label for="persons">강습인원👨🏾‍🦲</label> <select id="persons"
					name="persons" required>
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

				<button id="insertBtn" >예약하기</button>
				<button id="insertck_Btn">예약확인</button>

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




	<div id="lesson_list">
		<button id="btn1" onclick="toggleDiv(1)">BEGINNER</button>
		<button id="btn2" onclick="toggleDiv(2)">LEARNNE</button>
		<button id="btn3" onclick="toggleDiv(3)">APPRENTIC</button>
		<button id="btn4" onclick="toggleDiv(4)">이용요금</button>
	</div>


	<div class="main">
		<!-- 아무것도 안눌렸을때 박스 -->

		<!-- 토글박스 -->
		<div id="div1" style="display: none;">
			<h5>전문적인 코치들과 함께 인생 첫 파도를 타는 짜릿함을 느껴보세요!</h5><br>
			<img src="images/teacher1.PNG" />
			<br><br><br>
			<p>지상 교육을 통해 패들, 테이크오프 까지 배우고 스스로 거품 파도를 잡아 롱 라이딩 할 수 있도록 도와드릴게요!</p>
			<p>
				거품 파도에서 패들, 테이크오프를 연습하고 싶으신 분<br>서핑을 처음 경험하시는 분
			</p>
		</div>

		<div id="div2" style="display: none">
			<h5>스스로 거품 파도를 잡아서 라이딩이 가능한 분들을 위한 강습!</h5><br>
			<img src="images/teacher2.PNG" />
			<br><br><br>
			<p>지상 교육을 통해 패들, 테이크오프 까지 배우고 스스로 거품 파도를 잡아 롱 라이딩 할 수 있도록 도와드릴게요!</p>
			<p>사의 도움 없이 스스로 거품파도 잡기 (80% 이상 성공) 가능한 분</p>
			<p>스스로 그린웨이브를 잡기를 원하시는 분</p>
		</div>

		<div id="div3" style="display: none;">
			<h5>스스로 그린웨이브를 잡아서 라이딩이 가능한 분들을 위한 강습!</h5><br>
			<img src="images/teacher3.PNG" />
			<br><br><br>
			<p>강사의 도움 없이 스스로 무릎사이즈의 깨지지 않은 파도 잡기 가능한 분</p>
			<p>파도의 파워존을 따라 속도를 유지하며 롱라이딩을 연습하는 분</p>
		</div>


		<div id="div4" style="display: none">
			<table style="text-align: center;">
				<tr>
					<th rowspan="2">서핑레슨
					</th>
					<td>BEGINNER 100,000원</td>
					<td>LEARNNE 100,000원</td>
					<td>APPRENTIC 110,000원</td>
				</tr>
				<tr>
					<td>+ BEGINNER 70,000원</td>
					<td>+ LEARNNE 70,000원</td>
					<td>+ APPRENTIC 80,000원</td>
				</tr>
			</table>
			<br> <br> <br>
			<table style="text-align: center;">
				<tr>
					<th rowspan="6">물품대여</th>
					<th>슈트</th>
					<td>10,000원</td>
				</tr>
				<tr>
					<th>소프트보드</th>
					<td>16,000원</td>
				</tr>
				<tr>
					<th>하드보드</th>
					<td>40,000원</td>
				</tr>
				<tr>
					<th>글러브</th>
					<td>4,000원</td>
				</tr>
				<tr>
					<th>부츠</th>
					<td>4,000원</td>
				</tr>
				<tr>
					<th>비치타올</th>
					<td>1,000원</td>
				</tr>
			</table>
		</div>
	</div>
</div>

<%@ include file="footer.jsp"%>

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
        
        <script>
        function toggleDiv(num) {
            const divs = document.querySelectorAll(".main > div");
            for (var i = 0; i < divs.length; i++) {
                if (divs[i].id === "div" + num) {
                    if (divs[i].style.display === "none") {
                        divs[i].style.display = "block";
                    } else {
                        divs[i].style.display = "none";
                    }
                } else {
                    divs[i].style.display = "none";
                }
            }
        }
        </script>

