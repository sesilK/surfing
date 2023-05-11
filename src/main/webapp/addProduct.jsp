<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <h1>상품 추가 페이지</h1>
    <form action="/" method="post">

            <label for="inputCode">상품코드</label>
            <input type="text" name="code" id="inputCode" value="112" readonly><br>
            <label for="inputPname">상품명&nbsp;&nbsp;&nbsp;</label>
            <input type="text" name="pname" id="inputPname"><br>
            <label for="inputPrice">판매가&nbsp;&nbsp;&nbsp;</label>
            <input type="text" name="price" id="inputPrice"><br>
            <label for="inputStock">재고수량</label>
            <input type="text" name="stock" id="inputStock"><br>
            <label for="inputImage">이미지&nbsp;&nbsp;&nbsp;</label>
            <input type="file" name="image" id="inputImage"><br>
            <button type="submit">Upload</button>

    </form>
</body>
</html>