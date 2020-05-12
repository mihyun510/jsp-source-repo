<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>a.jsp[include action태그]</title>
</head>
<body>
첫째<br>
둘째<br>
<jsp:include page="b.jsp"/>
넷째<br>
다섯째<br>
url정보를 보면 b.jsp을 경유 했지만 a.jsp로 나타나는 것으로 보아 include도 요청을 계속 유지하고 있는 것을 판단.<br>
<%
	String id = "test";
	String name = (String)request.getAttribute("mem_name");
	out.print("name: "+name);
	out.print("<br>");
	out.print("id: "+id);
%>
</body>
</html>