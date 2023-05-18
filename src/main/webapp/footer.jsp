<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

</div>
<div class =" footerbox">
	<ul id="footerlist">
		<li>이용약관</li>
		<li>개인정보처리방침</li>
		<li>제휴문의</li>
		<li>건의사항</li>
	</ul>

	<div id="footerSns">
		<img src="images/f1.png">
		<img src="images/f2.png"> 
		<img src="images/f3.png">
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


<p style="font-size: small;">©Copyrights(C) 2023 GREEN WAVE. All
	Rights Reserved.</p>
</div>	


<style>

 .footerbox {
	width: 900px;
	margin: 0 auto;
	display: flex;
	flex-direction: column;
	align-items: center;
	overflow: hidden; /* 컨테이너 밖 요소들 안보이게 */
}

/* 하단 메뉴바 */

#footerlist {
    display: flex;
    list-style: none;
    justify-content: space-evenly;
    width: 900px;
    background-color:#585f54;
    color: white;
}

#footerlist li {
    padding: 30px;
    text-align: center;
    color: white;
}

#footerSns {
    display: flex;
    list-style: none;
    justify-content: right;
    height: 100px;
    width: 900px;
    background-color:#585f54;
    color: white;
}

#footerSns>img {
    margin-top: 20px;
    width: 50px;
    height: 60px;
}

/* 아코디언 css */
.que:first-child {
    border-top: 1px solid #dddddd;
    background-color: #585f54;
    color: white;
    text-align: center;
    width: 900px;
}

.que {
    position: relative;
    padding: 17px 0;
    cursor: pointer;
    font-size: 14px;
    border-bottom: 1px solid #dddddd;

}

.que::before {
    display: inline-block;
    font-size: 14px;
    color: #82a8ee;
    margin: 0 5px;
}

.que.on>span {
    font-weight: bold;
    color: #82a8ee;
}

.anw {
    display: none;
    overflow: hidden;
    font-size: 14px;
    background-color: #f4f4f2;
    padding: 27px 0;
}

.anw::before {
    display: inline-block;
    font-size: 14px;
    font-weight: bold;
    color: #666;
    margin: 0 5px;
}

.arrow-wrap {
    position: absolute;
    top: 50%;
    right: 10px;
    transform: translate(0, -50%);
}

.que .arrow-top {
    display: none;
}

.que .arrow-bottom {
    display: block;
}

.que.on .arrow-bottom {
    display: none;
}

.que.on .arrow-top {
    display: block;
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