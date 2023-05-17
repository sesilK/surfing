<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	crossorigin="anonymous"></script>
<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.6.4.js"
	integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
	crossorigin="anonymous"></script>
</head>

<style>
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
}

.container {
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

#menulist {
	display: flex;
	list-style: none;
	justify-content: space-evenly;
	width: 900px;
	background-color: #585f54;
	margin-bottom: 100px;
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

<body>
	<%
	String id = null;

	if (session.getAttribute("id") != null) {

		id = (String) session.getAttribute("id");

	}
	%>


	<!-- 홈버튼 회원가입여부 고정 -->
	<div class ="container">
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
	<div class="nav">
		<ul id="menulist">
			<li><a href="./reserve.jsp">reserve</a></li>
			<li><a href="./shop.jsp">shop</a></li>
			<li><a href="./bbs.jsp">community</a></li>
			<%
			if (id == null) {
			%>
			<li class="nav-item " style="display :none" ></li>
			<%
			} else {
			%>
			<li class="nav-item" style="text-decoration: none;"><%=id%>님</li>
			<%
			}
			%>
		</ul>
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
		</script>