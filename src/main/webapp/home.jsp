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
.wather_api {
	margin-top: 20px;
	display: flex;
	width: 1500px;
	justify-content: space-evenly;
	margin-bottom: 50px;
}

/* 인기상품 */
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

.populerBox {
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

</style>
<%@ include file="common.jsp"%>

<h1 id="current-time"></h1>
<div class="wather_api">

	<span> 현재 수온:<%=temp%>°C <!-- 해운대해수욕장 -->
	</span>
	<!-- 슈트추천-->
	<%
	String suit = "";
	String image = "";
	try {
		double waterTemp = Double.parseDouble(temp);
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
		style="width: 50px; height: auto;">
	</span>
</div>

<script>
	const time = document.getElementById('current-time'); // id가 'current-time'인 요소

	// 1초마다 현재 시각 업데이트
	setInterval(() => {
		const date = new Date(); // 새로운 Date 객체 생성
		time.innerHTML = date.toLocaleTimeString();
	}, 1000);
</script>

<div class="populerBox_text">
	<span>인기상품</span>
	<button>
		<a href="shop.jsp">더보기</a>
	</button>
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

<%@ include file="footer.jsp"%>