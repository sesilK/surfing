<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="dao.ProductDao"%>
<%@ page import="dto.ProductDto"%>
<%@ page import="dao.Api"%>
<%
String temp = "";
try {
    temp = Api.getWater_temp();
} catch (Exception e) {
    e.printStackTrace();
}
%>

<style>
.home_box{
margin-top:50px;
width:100%;
}r_api {
	margin-top: 20px;
	display: flex;
	width: 1500px;
	justify-content: space-evenly;
	margin-bottom: 50px;
}
/*선생님소개*/

.hover01{
display: flex;
}
.hover01 img{
width:230px;
height:250px;
margin:20px;
}


/* Zoom In */
.t_box{
margin:10px;
padding:30px;
}
.hover01 figure img {
  -webkit-transform: scale(1);
  transform: scale(1);
  -webkit-transition: .3s ease-in-out;
  transition: .3s ease-in-out;
}
.hover01 figure:hover img {
  -webkit-transform: scale(1.3);
  transform: scale(1.3);
}

/* 인기상품 */
.list_text{
	width:900px;
	height:50px;
	display: flex;
	list-style: none;
	justify-content: space-between;
	border-top: 1px solid #dddddd;
	border-bottom: 1px solid #dddddd;
	padding: 15px;
}

.populerBox_text {
	width: 2000px;
	height: 50px;
	padding: 20px;
	display: flex;
	list-style: none;
	justify-content: space-evenly;
	border: 1px solid #dddddd;
}
.populerBox_text>button {
	text-decoration: none;
	border-radius: 5px;
}

.populerBox{
	width: 18.5%;
	display: flex;
	margin: 3%;
	animation: slide 15s infinite;
}

@keyframes slide {
	0% {
		transform: translateX(-200%);
	}
	30% {
		transform: translateX(-400%);
	}
	60% {
		transform: translateX(-600%);
	}
	90% {
		transform: translateX(-800%);
	}
	100% {
		transform: translateX(-900%);
	}

}

/* 시간css */
 #current-time {
	color: black;
}

.iframebox{
margin:50px;
}

.buttons{
 margin: 10px
}
.buttons>button{
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
button:hover{
  background:#fff;
  color:#354e58;
}
.buttons>button:before,button:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #bdbfc0;
  transition:400ms ease all;
}
.buttons>button:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
.buttons>button:hover:before,button:hover:after{
  width:100%;
  transition:800ms ease all;
}

</style>
<%@ include file="common.jsp"%>
<div class="home_box">

<h1 id="current-time"></h1>
<div class="wather_api">
	<!-- 수온 api  -->
	<br><span> 현재 수온:<%=temp%>°C <!-- 해운대해수욕장 --></span><br>
	<!-- 슈트추천-->
	<%
	String suit = "";
	String image = "";
	try {
		/* double waterTemp = Double.parseDouble(temp); */
		double waterTemp = 14.0; //옷입히기
		if (waterTemp < 15) {
			suit = "5/4mm 추천드려요";
			image = "images/w1.jpg";
		} else if (waterTemp >= 15 && waterTemp < 22) {
			suit = "4/3mm 추천드려요";
			image = "images/w2.jpg";
		} else if (waterTemp >= 22 && waterTemp < 26) {
			suit = "2mm 추천드려요";
			image = "images/w3.jpg";
		} else if (waterTemp >= 26) {
			suit = "1mm or 보드숏 , 수영복 입으세요";
			image = "images/w4.jpg";
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	%>
	<span> 현재 웨트슈트는 <%=suit%> <img src="<%=image%>" alt="<%=suit%>"
		style="width: 100px; height: auto;">
	</span><br><br><br>
</div>
<!-- 시간 -->
 <script>
            const time = document.getElementById('current-time'); // id가 'current-time'인 요소

	// 1초마다 현재 시각 업데이트
	setInterval(() => {
		const date = new Date(); // 새로운 Date 객체 생성
		time.innerHTML = date.toLocaleTimeString();
	}, 1000);
</script>

<!-- 선생님소개 -->
<div class="list_text">
	<h3>Green Wave 의 최고의 강사진</h3>
	<a href="reserve.jsp" style="text-decoration:none";>예약하기</a>
</div>

<div class="t_box">
	<div class="hover01 column">
		<div>
			<figure>
				<img src="images/teacher1.PNG" />
			</figure>
		</div>
		<div>
			<figure>
				<img src="images/teacher2.PNG" />
			</figure>
		</div>
		<div>
			<figure>
				<img src="images/teacher3.PNG" />
			</figure>
		</div>
	</div>
</div>

<!-- 상품슬라이드 -->
<div class="list_text">
	<h3>인기상품</h3>
	<a href="shop.jsp" style="text-decoration:none";>더보기</a>
</div>

<div class="populerBox">
	<%
	ProductDao productDao = new ProductDao();
	List<ProductDto> productList = productDao.selectProductList();
	%>

	<%
	for (ProductDto item : productList) {
	%>

	<div class="product_box" id="<%=item.getCode()%>">
		<a href="./productDetail.jsp?code=<%=item.getCode()%>"
			style="text-decoration: none;"> <img
			src="images/<%=item.getFilename()%>"
			style="width: 150px; margin: 30px;">
		</a>
		<div class="pname" style="font-size: small;"><%=item.getPname()%></div>
		<div class="price" style="font-size: small;"><%=item.getSprice()%></div>
	</div>
	<%
	}
	%>
</div>
<!--
	지도
<div class="list_text">
	<h3>찾아오시는 길</h3>
</div>	
<div class= "iframebox">
<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d26095.323275171224!2d129.13978462747602!3d35.158730342854426!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x35688d5c0efe075f%3A0x9963b1d5c163ac98!2z7ZW07Jq064yA7ZW07IiY7JqV7J6l!5e0!3m2!1sko!2skr!4v1684322192122!5m2!1sko!2skr" 
width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
</div>
-->

<div class="list_text">
    <h3>찾아오시는 길</h3>
</div>

<div class="buttons">
    <button onclick="showMap(1)">부산 서핑스팟</button>
    <button onclick="showMap(2)">양양 서핑스팟</button>
    <button onclick="showMap(3)">태안 서핑스팟</button>
</div>
<br>
<div class="map-container">
    <div id="map1" class="map"><iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d26095.323275171224!2d129.13978462747602!3d35.158730342854426!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x35688d5c0efe075f%3A0x9963b1d5c163ac98!2z7ZW07Jq064yA7ZW07IiY7JqV7J6l!5e0!3m2!1sko!2skr!4v1684322192122!5m2!1sko!2skr" 
width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe></div>
    <div id="map2" class="map" style="display: none;"><iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d25162.664411988306!2d128.74215654103443!3d37.96935613613608!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x5fdf5676467d7c41%3A0x7b84bba5283b70be!2z7J246rWs7ZW067OA!5e0!3m2!1sko!2skr!4v1684464583064!5m2!1sko!2skr"
     width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe></div>
    <div id="map3" class="map" style="display: none;"><iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d51125.394173261346!2d126.06853113553557!3d36.78646638743562!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357a16dab94bdbef%3A0x2925a7eed94473c3!2z66eM66as7Y-s7ZW07IiY7JqV7J6l!5e0!3m2!1sko!2skr!4v1684464625270!5m2!1sko!2skr"
     width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe></div>
</div>
<br><br><br>
<script>
    function showMap(mapNumber) {
        // 모든 지도 숨기기
        var maps = document.getElementsByClassName("map");
        for (var i = 0; i < maps.length; i++) {
            maps[i].style.display = "none";
        }
        
        // 선택한 지도 보이기
        var map = document.getElementById("map" + mapNumber);
        if (map) {
            map.style.display = "block";
            
        }
    }
</script>
	

<%@ include file="footer.jsp"%>