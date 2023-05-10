<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<!-- bootstrap -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
	crossorigin="anonymous"></script>
<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.6.4.js"
	integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
	crossorigin="anonymous"></script>
</head>
<body>
	<% 	
		String id = null;

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
					
					<li class="nav-item"><a class="nav-link" href=""><%=id%>님</a></li>
					<li class="nav-item"><a class="nav-link" href="signout_proc.jsp">sign-out</a></li>
					
					<% 	if(id.equals("admin")){%>
							<li class="nav-item"><a class="nav-link" href="">관리자모드</a></li>
					<%	}
					}%>
				</ul>
			</div>

		</div>
	</nav>
</body>
</html>