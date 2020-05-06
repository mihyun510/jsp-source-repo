<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>a2.jsp</title>
</head>
<body>
<!-- html영역 로컬 PC의 브라우저가 처리 주체, 나중에 브라우저에서 처리되는 부분, 개인 컴에서 다운로드 받는 순간 처리된다. 그전에 리다이랙트함으로 처리될 시간이없다. 이것이 로딩되기 전에 바로 페이지 이동함.-->
<%
//스크립틀릿 - Tomcat이 처리 주체다.
//시점이 태그 영역보다 빠름. 15번만 눈에 보인다. 서버쪽에서 먼저 처리되는 부분 우선순위가 먼저 서버이기 때문에
	String name="이순신";
	out.print("이름:"+name); //결정된 정보인 이순신만 보임.
	//response.sendRedirect("b.jsp");
	request.setAttribute("name", name);//request저장소에 기록하기. 꺼낼때는 getAttribute로 꺼낸다.
	RequestDispatcher view = request.getRequestDispatcher("b2.jsp"); //url이 변경되지 않는다. 톰캣이 요청을 유지하고 있다. url은 /a2.jsp인데 화면에 나타는 것은 b2.jsp가 화면상에 나타남을 확인할 수 있음.
	view.forward(request, response);
%>
</body>
</html>