<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ page trimDirectiveWhitespaces="false" %> --%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>a3.jsp</title>
</head>
<body>
<!-- xml형식으로 보여지기 위해서 아래 코드가 꼭 필요함. -->
<!-- <?xml version="1.0" encoding="UTF-8"?>  -->
<%
/*
	This page contains the following errors:
	error on line 7 at column 8: Opening and ending tag mismatch: meta line 0 and head
	Below is a rendering of the page up to the first error.
	===> xml형식과 맞지 않음... 에러
*/
	//response.setContentType("application/json; charset=UTF-8"); //mineType을 html로 설정 
	response.setContentType("text/xml; charset=UTF-8"); //마인타입에 따라서 다른 결과를 가져옴을 확인함.
//				┌>request는 내장객체로 따로 선언하지 않아도 사용이 가능하다.
	String id = request.getParameter("mem_id");
	out.print("<?xml version='1.0' encoding='utf-8'?>");
	out.print("<records>");
	out.print("<record>");
	out.print("테스트");
	out.print("</record>");
	out.print("<record>");
	out.print("JAVA");
	out.print("</record>");
	out.print("<record>");
	out.print("JSP");
	out.print("</record>");
	out.print("</records>");
	
%>
</body>
</html>