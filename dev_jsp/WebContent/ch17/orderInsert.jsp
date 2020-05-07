<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- jsp가 요청을 받음: mvc1, do가 요청을 받음: mvc2 -->
<form method="post" action="/ch17/orderInsert.do"> 
	<input type="text" name="mem_name">
	<input type="submit" value="전송"><!-- 즉시 전송이 가능 -->
	<input type="button" value="전송2" onclick="send()"><!-- send()라는 개인적인 함수가 필요함. -->
</form>
</body>
</html>