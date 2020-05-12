<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>b2.jsp[include 다이렉티브 - a2.jsp에 포함될 내용 초함]</title>
</head>
<body>
b2.jsp 시작<br>
첫째<br>
둘째<br>
셋째<br>
(내용만 포함될 것이라서 헤더정보가 있으나 마나 한 페이지입니다. - b2.jsp 끝)<br>
<%
	//out.print("id: "+id); //아이디라는 변수가 여기에 없어서 문법오류남. 그러나 a2.jsp에 변수가 선언되었으므로 변수사용이 가능하다. 왜냐하면 디렉티브는 하나의 파일로 합쳐지는 것으로 내안에 들어있는 것이나 마찬가지이기 떄문이다 . 즉, jsp파일은 두개이지만 java, class파일을 하나로 합쳐지는 것이나 마찬가지 이다.
	String id = request.getParameter("id");
	out.print("id: "+id);
%>
</body>
</html>