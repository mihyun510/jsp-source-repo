<%@page import="jsp.ch08.Sonata"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	Sonata myCar = new Sonata();
    	request.setAttribute("myCar", myCar);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function moveB(){
		location.href="b.jsp";
	}
</script>
</head>
<body>
자동차의 바퀴색은 4개이고 자주색 입니다. 출력하기<br>
<%
	out.print(myCar.carColor+", "+myCar.wheelNum);
	//b.jsp에서도 myCar을 쓸수 있나? 스코프를 생각해보자
	//request에 담아도 안되는 것인가? 이 객체를 주소번지를 받아서 사용할 수없는건가? - 답은 안된다. 왜??
	//객체가 이동이 안된다. 유지가 안됨. null이 뜸. 왜? 데이터가 유지되는 것은 forward이다,
	
%>
<button onClick="moveB()">b로 이동</button>
</body>
</html>