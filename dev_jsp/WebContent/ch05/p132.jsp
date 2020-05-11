<%@page import="jsp.ch05.Sonata"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>객체의 영역[SCOPE에 관해서]</title>
</head>
<body>
인스턴스화하는 부분에서 만약에 클래스 중에 어떤 임의클래스 추가<br>
스코프라는 속성을 사용할 수 있는 곳은 jsp:useBean안에서 사용가능하다. 페이지는 생략가능하고 appilcation은 사용안한다.<br>
<jsp:useBean id="himCar" scope="request" class="jsp.ch05.Sonata"/>
<%-- <%	
	//여기 안에서는 scope을 가질 수 없다?
	Sonata myCar = new Sonata();
	out.print(myCar.carColor); //default = 검정색 그러므로 검정색 출력
%> --%>
<%
	out.print(himCar.carColor);
	request.setAttribute("carColor", himCar.carColor);
	request.setAttribute("wheelNum", himCar.wheelNum); //값을 여러가지 넘길 수가 있음.
	//									┌> - forward는 url주소가 변하지 않음 그러니 요청이 계속 유지되는 것으로 톰캣이 인지함. 그래서 값도 유지가됨.
	RequestDispatcher view = request.getRequestDispatcher("p132_1.jsp"); //"url"로 이동함. = > carColor가 이 url로 이동했을때 값이 유지되나? - 값이 유지가 안됨 null값이 찍힘. 뭐야..? 이것이 아니라 url은 p132.jsp을 나타내지만 내용은 p132_1의 내용을 보여주고 있음 소스보기를 보면 확인할 수 있음.
	view.forward(request, response); //내장객체가 오므로 전체 풀네임이 와야된다. 
	//response.sendRedirect("p132_1.jsp"); //-url주소가 바뀌니 바뀌는 순간 요청은 끈기고 새로운 url주소로 요청을 시도 그러니 값도 유지가 안됨.

%>
</body>
</html>