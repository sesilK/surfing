<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
</head>
<body>
<% 		String id = null;
		if(session.getAttribute("id") != null) {
	
		id = (String)session.getAttribute("id");
		
		
	}
	%>

	<nav class="navbar navbar-expand-lg bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="home.jsp">Green Wave</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
				
					<!-- <li class="nav-item"><a class="nav-link active"
						aria-current="page" href="index.jsp">Home</a></li> -->
						
					<li class="nav-item"><a class="nav-link" href="reserve.jsp">reserve</a></li>
					<li class="nav-item"><a class="nav-link" href="shop.jsp">shop</a></li>
					<% if (id == null){ %>
					<li class="nav-item"><a class="nav-link" href="member.jsp">member</a></li>
					<% } else {%>
					<li class="nav-item"><a class="nav-link" href="signout_proc.jsp">
					<%=id%>님</a></li>
					<li class="nav-item"><a class="nav-link" href="signout_proc.jsp">sign-out</a></li>
					<% }%>
				</ul>
			</div>
			
		</div>
	</nav>
		<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>