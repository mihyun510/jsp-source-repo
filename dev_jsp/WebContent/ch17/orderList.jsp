<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문관리</title>
</head>
<body>
주문관리 페이지 입니다.<br>
<%
	List<Map<String,Object>> olist = (List<Map<String,Object>>)request.getAttribute("olist");
	out.print(olist); //for문을 사용하여 한개씩 잘라서 확인해보자.
	for(int i=0; i<olist.size(); i++){
		Map<String, Object> rmap = olist.get(i);
		out.print("<br>키명으로 한개씩 꺼내기: ");
		out.print(rmap.get("deptno"));
		out.print(", ");
		out.print(rmap.get("dname"));
		out.print(", ");
		out.print(rmap.get("loc"));
		
		Object keys[] = rmap.keySet().toArray();
		out.print("<br>키값으로 꺼냄: ");
		out.print(rmap.get(keys[0])+", "+rmap.get(keys[1])+", "+rmap.get(keys[2])); //map이라서 값은 랜덤이다.
	}
%>
</body>
</html>