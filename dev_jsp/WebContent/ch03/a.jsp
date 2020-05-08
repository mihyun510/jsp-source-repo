<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>a.jsp</title>
</head>
<body>
<%
	//마인타입은 위쪽보다 안쪽에 있는 것을 우선으로 한다.
	response.setContentType("application/json; charset=UTF-8"); //mineType을 json으로 설정함 - 그래서 브라우저가 인터프리터를 해주지 않아서 그대로 코드를 보여준다.
//				┌>request는 내장객체로 따로 선언하지 않아도 사용이 가능하다.
	String id = request.getParameter("mem_id");
	out.print("테스트");
%>
</body>
</html>