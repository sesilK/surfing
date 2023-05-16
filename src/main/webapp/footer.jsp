<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="container">
<footer>
	<ul id="footerlist">
		<li>이용약관</li>
		<li>개인정보처리방침</li>
		<li>제휴문의</li>
		<li>건의사항</li>
	</ul>

	<div id="footerSns">
		<a href="https://instagram.com/plant._.j?igshid=YmMyMTA2M2Y"
			target="_blank"> <img src="images/whitelongin.png"
			style="width: 62px; margin-top: 20px;">
		</a> <img src="images/whitelongin.png"> <img
			src="images/whitelongin.png">
	</div>

	<div id="Accordion_wrap">
		<div class="que">
			<span>사업자정보</span>
			<div class="arrow-wrap">
				<span class="arrow-top">↑</span> <span class="arrow-bottom">↓</span>
			</div>
		</div>
		<div class="anw">
			<span>(주)그린웨이브<br> 대표:심다정<br> 사업자등록번호: 630-98-00550<br>
				이메일: ekwjd1354@naver.com<br> 통신판매업신고번호: 제1995-충청남도-0425호<br>
				상담전화: 010-4019-0425<br> 입금계좌: NH농협은행 356-0314-9010-53 (예금주 :
				그린웨이브)
			</span>
		</div>
	</div>
</footer>

<p style="font-size: small;">©Copyrights(C) 2023 GREEN WAVE. All
	Rights Reserved.</p>
</div>


<style>
/* 하단 메뉴바 */
.container {
    height: 100%;
    width: 100%;
    margin: 0 auto;
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-bottom: 10px;
}
#footerlist {
    display: flex;
    list-style: none;
    justify-content: space-evenly;
    width: 900px;
    background-color: #ebf0e8;
    color: black;
}

#footerlist li {
    padding: 30px;
    text-align: center;
}

#footerSns {
    display: flex;
    list-style: none;
    justify-content: right;
    height: 100px;
    background-color: #333333;
    color: white;
}

#footerSns>img {
    margin-top: 20px;
    width: 50px;
    height: 60px;
}
</style>

<script>
	//사업자정보 아코디언
	$(".que").click(function() {
		$(this).next(".anw").stop().slideToggle(300);
		$(this).toggleClass('on').siblings().removeClass('on');
		$(this).next(".anw").siblings(".anw").slideUp(300); // 1개씩 펼치기
	});
</script>
</body>
</html>