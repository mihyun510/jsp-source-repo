<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표현언어</title>
</head>
<body>
	a*b = ${param.a * param.b} <!-- 0이 나온다. a와 b가 존재하지 않는다. 그래서 0이 찍힘. 값을 ?(ex.?a=10&b=2)로 넘기면 해당 값이 나옴  -->
</body>
</html>