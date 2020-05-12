<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>a2.jsp[include 다이렉티브]</title>
</head>
<body>
<%
	String id = "test"; //디렉티브에서 변수를 공유하여  사용하고 싶다면 디렉티브코드보다 위에서 변수를 선언해야지만 변수를 공유하여 사용이 가능하다. 문법적으로 당연히 먼저 변수을 선언해야 사용이 가능하다고 생각하면됨.
%>
첫째<br>
둘째<br>
<%@ include file="b2.jsp"%>
넷째<br>
다섯째<br>
b2.jsp파일이 a2.jsp파일로 합쳐짐 그래서 url을 확인해보면 a2.jsp에 요청이 유지되고 있음을 확인.
</body>
</html>