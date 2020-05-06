<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>b2.jsp</title>
</head>
<body>
<%
	//String name = null; //이 코드를 적음으로써 아래코드가 오류가 나는 것을 임지적 문법오류 해결 그러나 여기서 지정해준 null값이 찍힌다. 즉, a.jsp에서의 요청은 끝킨것이고 a.jsp에서의 값이 b.jsp까지 유지가 되지 않은것, 값을 재사용 불가능. 요청이 끈어진것이다.
	String name = (String)request.getAttribute("name"); //이것으로 인해서 a2.jsp에서 값이 넘어와서 출력한 것을 확인함.
	out.print("이름: "+name); //문법오류 실행 조차않됨. 500번 떨어짐, java -> servlet -> 컴파일이 안됨.
%>
</body>
</html>