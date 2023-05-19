<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="dao.ProductDao"%>
<%@ page import="dto.ProductDto"%>
<%@ page import="dto.CartDto"%>
<%@ page import="java.io.File"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>


<%
   //상품추가 페이지에서 업로드 버튼 누르면 나타나는 기능
   String directory = application.getRealPath("/images/");
   int maxSize = 1024 * 1024 * 100; //100mb
   String encoding = "UTF-8";
   
   MultipartRequest multipartRequest
   = new MultipartRequest(request, directory, maxSize, encoding,
		   new DefaultFileRenamePolicy());
   
%>
<script>
location.href = "shop.jsp";
</script>