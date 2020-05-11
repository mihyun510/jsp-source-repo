<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%><!-- xml과 타입이 맞지않아서 오류가 발생함. This page contains the following errors: -->
<%@ page trimDirectiveWhitespaces="true" %><!-- 페이지 소스보기를 할 경우 1~3번라인까지 띄어져 있는 것을 볼 수 있다. 그러나 이 코드로 인해서 뜨어씌기 없어짐을 확인하였다. -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>현재시간</title>
</head>
<body>
현재시간: <%=new Date() %>
</body>
</html>