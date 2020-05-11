<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>500에러 발생</title>
</head>
<body>
<h1>서버 내부 에러가 발생함(예를 들어, JSP에서 익셉션이 발생함)</h1>
에러메세지1: <%=exception.getMessage() %><br>
에러메세지2: <%=exception.toString() %><br>
</body>
</html>