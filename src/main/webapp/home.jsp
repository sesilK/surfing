<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="dao.ProductDao"%>
<%@ page import="dto.ProductDto"%>
<%@ page import="dao.Api"%>
<%
String temp = Api.getWater_temp();
%>

<style>
</style>
	<%@ include file="common.jsp"%>

	<div class="wather_api">
		<span>현재 날씨</span> <span id="temperature"></span>
		<p>
			현재 수온:<%=temp%>°C
			<!-- 해운대해수욕장 -->
		</p>
		<%
		String suit = "";
		double waterTemp = Double.parseDouble(temp);
		if (waterTemp < 15) {
			suit = "5/4mm 추천드려요";
		} else if (waterTemp >= 15 && waterTemp < 22) {
			suit = "4/3mm 추천드려요";
		} else if (waterTemp >= 22 && waterTemp < 26) {
			suit = "2mm 추천드려요";
		} else if (waterTemp >= 26) {
			suit = "수영복만 입고 들어가도 좋을거에요";
		}
		%>
		<p>
			추천 웨트슈트:
			<%=suit%>
		</p>
	</div>


	<script>

	//날씨 api
	function getWeather(){
	            fetch('https://goweather.herokuapp.com/weather/Busan')
	            .then((response)=> response.json())
	            .then((data)=>{
	                document.getElementById("temperature").innerHTML =data['temperature']
	            });
	        }
	getWeather();
	
}

</script>
	
<%@ include file="footer.jsp"%>

