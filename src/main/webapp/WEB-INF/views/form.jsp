<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>사용자 입력</h1>
<!-- 파일을 포함하여 전송하는 form은 반드시 enctype="multipart/form-data"로 설정 -->
	<form action="/param.do" method="post" enctype="multipart/form-data" >
		X : <input type="number" name="x" value="0" />	
		Y : <input type="number" name="y" value="0" />
		<br />
		좋아하는 음식 :
		<input type="checkbox" name="food" value="piz" /> 피자
		<input type="checkbox" name="food" value="ham" /> 햄버거
		<input type="checkbox" name="food" value="san" /> 샌드위치
		<br />
		생일 : <input type="date" name="birth" />
		<br />
		첨부파일 : <input type="file" name="upfile" />
		<br />
		<input type="submit" />	
	</form>
	
</body>
</html>


