<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="dao.ProductDao"%>
<%@ page import="dto.ProductDto"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    label {
        width: 200px;
    }
</style>
<body>
	<%@ include file="common.jsp"%>
	<% ProductDao productDao = new ProductDao(); %>
    <h1>신규 상품 등록</h1><br><br>
    <form name="productAddForm" action="upload.jsp" method="post" enctype="multipart/form-data"> 

            <label for="inputPname">상품명&nbsp;&nbsp;&nbsp;</label>
            <input type="text" name="pname" id="inputPname"><br><br>
            
            <label for="inputPrice">판매가</label>
            <input type="text" name="price" id="inputPrice"><br><br>
            
            <label for="inputStock">입고수량</label>
            <input type="text" name="stock" id="inputStock"><br><br>

            <label for="inputImage">이미지&nbsp;&nbsp;&nbsp;</label>
            <input type="file" name="file" id="inputImage" accept="image/*" style="width:180px"><br><br>
               
            <button id="uploadBtn" type="button" style="margin: 30px 320px;" onclick="Upload()">Upload</button>
            <br>
            <img id="previewImg" width="400px">
	</form>

	<script>
	
	//선택한 이미지 미리보기
	const fileInput = document.getElementById("inputImage");
	const handleFiles = (e) => {
	  const selectedFile = [...fileInput.files]; 
	  const fileReader = new FileReader();

	  fileReader.readAsDataURL(selectedFile[0]);

	  fileReader.onload = function () {
	    document.getElementById("previewImg").src = fileReader.result;
	  };
	};
	fileInput.addEventListener("change", handleFiles);
	
	
	//업로드 버튼 함수
	function Upload() {
		
		let form = document.productAddForm;
		let pname = document.querySelector("#inputPname").value;
		let price = document.querySelector("#inputPrice").value;
		let stock = document.querySelector("#inputStock").value;
		let filePath = document.querySelector("#inputImage").value;
		let parts = filePath.split('\\');
		let filename = parts[parts.length - 1];
		
		if(pname == "" || price == "" || stock == ""){
			alert('상품명,판매가,재고수량을 모두 입력해주세요.');
		} else {
			if(confirm('상품을 등록하시겠습니까?')){
				
				$.ajax({
					async : true, // 비동기 true
					type : 'get', // GET 타입
					data : { // 넘겨줄 매개변수, 실제로 ?id=input_id 형식으로 넘어감
						"pname" : pname,
						"price" : price,
						"stock" : stock,
						"filename" : filename
					},
					url : "./addProduct_proc.jsp", // 타겟 url 주소
					dataType : "json", // json 형태로 받아오겠다
					contentType : "application/json; charset=UTF-8",
					success : function(data) {            
						if (data.result === 'true') { //DB update 성공
							alert("추가 성공");
							form.submit();
						} else if (data.result === 'false') {
							alert("실패");
						}
					},
					error : function() {
						alert("오류가 발생했습니다.");
					}
				})
			}
		}
	}
	</script>
<%@ include file="footer.jsp"%>