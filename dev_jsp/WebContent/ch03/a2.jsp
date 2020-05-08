<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>a2.jsp</title>
</head>
<body>
<%
	//response.setContentType("application/json; charset=UTF-8"); //mineType을 html로 설정 
//				┌>request는 내장객체로 따로 선언하지 않아도 사용이 가능하다.
	String id = request.getParameter("mem_id");
	out.print("테스트");
%>
</body>
</html>