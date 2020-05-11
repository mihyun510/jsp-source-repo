<%@page import="jsp.ch05.Sonata"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>객체의 영역[SCOPE에 관해서-p132_1.jsp]</title>
</head>
<body>
인스턴스화하는 부분에서 만약에 클래스 중에 어떤 임의클래스 추가<br>
스코프라는 속성을 사용할 수 있는 곳은 jsp:useBean안에서 사용가능하다. 페이지는 생략가능하고 appilcation은 사용안한다.<br>
<jsp:useBean id="himCar" scope="request" class="jsp.ch05.Sonata"/>
<%
	String imsi = (String) request.getAttribute("carColor"); //request.setAttribute("carColor", himCar.carColor); 이것의 name부분을 보고 값을 가져온다.
	out.print("carColor: "+imsi);
	out.print("<hr>");
	out.print("wheelNum: "+request.getAttribute("wheelNum"));
%>
</body>
</html>