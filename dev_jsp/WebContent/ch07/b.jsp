<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>b.jsp[include action태그 - a.jsp에 포함될 내용 초함]</title>
</head>
<body>
b.jsp 시작<br>
첫째<br>
둘째<br>
<%
	//out.print("id: "+id); 선언이 안된 변수는 사용불가능.
	request.setAttribute("mem_name", "이순신");
%>
셋째<br>
(내용만 포함될 것이라서 헤더정보가 있으나 마나 한 페이지입니다. - b.jsp 끝)<br>
</body>
</html>