<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
    <%
    	int size = 5;
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:set var="el_size" value="<%=size %>"/>
<c:set var="el_size" value="<%=request.getParameter("size") %>"/>
el_size:${el_size } $  {}는 태그 라이브러리에서 제공해주는 것이다.
</body>
</html>