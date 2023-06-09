<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	crossorigin="anonymous"></script>
</head>

<style>
		.video-background {
			position: absolute;
			top: 0;
			left: 0;
			width: 100%;
			height: 100%;
			object-fit: cover;
			z-index: -1;
		}
@font-face {
	font-family: 'SUITE-Regular';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/SUITE-Regular.woff2')
		format('woff2');
	font-weight: 400;
	font-style: normal;
}

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	text-align: center;
	font-family: 'SUITE-Regular';
	text-decoration: none;
	color:black;
}
body{
background-color: #dddddd;
}

.container {
	background-color:white;
	width: 900px;
	margin: 0 auto;
	display: flex;
	flex-direction: column;
	align-items: center;
	overflow: hidden; /* 컨테이너 밖 요소들 안보이게 */
}

.topnav {
	display: flex;
	list-style: none;
	justify-content: space-evenly;
}

.nav-item img {
	width: 70px;
	height: 70px;
}

.mainSlides {
	width: 900px;
	height: 400px;
	object-fit: cover;
}

li {
	list-style: none;
}

#menulist {
	display: flex;
	list-style: none;
	justify-content: space-evenly;
	width: 900px;
	background-color: #585f54;
}

#menulist li {
	padding: 30px;
	color: white;
}

#menulist li>a {
	color: white;
	text-decoration: none;
}

#menulist li>a:hover {
	font-weight:bold;
	color: #1f2e18;
}

/* 아코디언 */
.que:first-child {
	border-top: 1px solid #dddddd;
	background-color: #333333;
	color: white;
	text-align: center;
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
	color: #ffffff;
	margin: 0 5px;
}

.que.on>span {
	font-weight: bold;
	color: #000000;
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
#mem_accordion {
    cursor: pointer;
    padding: 18px;
    outline: none;
    transition: 0.4s;
}

#panel {
	width: 107px;
    padding: 0 18px;
    background-color: transparent;
	position: absolute;
	right: 270px;
	top: 460px;
	z-index: 100;
	display: none;
    overflow: hidden;
}

#panel a {
	text-decoration: none;
}

#panel div {
	padding: 5px;
	color: black;
}

</style>

<body>
	<%
	String id = null;

	if (session.getAttribute("id") != null) {

		id = (String) session.getAttribute("id");

	}
	%>

	
	<!-- 홈버튼 회원가입여부 고정 -->
	<div class ="container" backgroun>
	<div class ="topnav" style="position: absolute; z-index: 2">
	<a href="./home.jsp" style= "position:absolute ;right:360px;" ><img src="images/whitelogo.png"
                        style="width: 100px; height: 100px  "></a>
		<ul>
			<%
			if (id == null) {
			%>
			<li class="nav-item">
			<a href="member.jsp" style= "position:absolute ;left:380px;" ><img src="images/whitelogin.png" ></a>
			</li>
			<%
			} else {
			%>
			<li class="nav-item">
			<a href="signout_proc.jsp" style= "position:absolute ;left:380px;"><img src="images/whitelogout.png"></a>
			</li>
			<%
			}
			%>
		</ul>
	</div>
	<!-- 이미지 슬라이드 -->
	<div class="headimg" style="position: relative; z-index: 1">
		<img class="mainSlides" src="images/head1.jpg"> 
		<img class="mainSlides" src="images/head2.jpg"> 
		<img class="mainSlides" src="images/head3.jpg"> 
		<img class="mainSlides" src="images/head4.jpg">
	</div>

	<!-- 고정 nav -->
	<div class="nav" id="targetElement">
		<ul id="menulist">
			<li><a href="./reserve.jsp">reserve</a></li>
			<li><a href="./shop.jsp">shop</a></li>
			<li><a href="./bbs.jsp">community</a></li>
			<%
			if (id == null) {
			%>
			<a href="member.jsp" style="text-decoration: none;"><li class="nav-item">login</li></a>
			<%
			} else {
			%>
			<li class="nav-item" id="mem_accordion" style="text-decoration: none;"><a><%=id%>님</a></li>
			<%
			}
			%>
		</ul>
	</div>

	<div id="panel" style="background:white;">
		<a href="infoupdate.jsp"><div>정보수정</div></a>
		<a href="reserve_check.jsp"><div>예약확인</div></a>
		<a href="orderCheck.jsp"><div>주문내역</div></a>
		<a href="cart.jsp"><div>장바구니</div></a>
		<a href="signout_proc.jsp"><div>로그아웃</div></a>
	</div>

		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
			crossorigin="anonymous">
			function rogout() {
				alert('로그아웃 되었습니다.');
			}
		</script>

		<script>
			let myIndex = 0;
			carousel();
			function carousel() {
				var i;
				var x = document.getElementsByClassName("mainSlides");
				for (i = 0; i < x.length; i++) {
					x[i].style.display = "none";
				}
				myIndex++;
				if (myIndex > x.length) {
					myIndex = 1
				}
				x[myIndex - 1].style.display = "block";
				setTimeout(carousel, 2000); // Change image every 2 seconds
			}
			
			document.getElementById("mem_accordion").addEventListener("mouseover", function() {
				let panel = document.getElementById("panel");
				panel.style.display = "block";
			});

			document.getElementById("mem_accordion").addEventListener("mouseout", function() {
				let panel = document.getElementById("panel");
				panel.style.display = "none";
			});

			document.getElementById("panel").addEventListener("mouseover", function() {
				let panel = document.getElementById("panel");
				panel.style.display = "block";
			});

			document.getElementById("panel").addEventListener("mouseout", function() {
				let panel = document.getElementById("panel");
				panel.style.display = "none";
			});

		</script>