<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="dao.ReserveDao"%>
<%@ page import="dto.ReserveDto"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

//	<%
//		int id = Integer.parseInt(request.getParameter("no"));
//		
//		ReserveDao reserveDao = new ReserveDao();
//		int result = reserveDao.deleteReserveInfo(id);
// 		int result = 0;
//		request.getParameter("no");
		
//		if(result == 1){
			//삭제성공
//	%>
		<script>
//			alert('예약취소 완료');
//			location.href = './reserve_proc.jsp'; 
		</script>	
	<%
//		} else {
	%>
			<!--삭제실패-->
			<script>
//				alert('예약취소 실패!');
//				location.href = './personInfoDetail.jsp?persons=<%=%>';
			</script>
	<%
//		}
	%>
	

</body>
</html>