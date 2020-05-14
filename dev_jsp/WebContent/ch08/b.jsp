<%@page import="jsp.ch08.Sonata"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>b.jsp</title>
</head>
<body>
<%
	Sonata myCar = (Sonata) request.getAttribute("myCar");
	out.print("myCar: "+myCar);
%>
</body>
</html>