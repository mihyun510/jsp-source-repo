<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>b.jsp</title>
</head>
<body>
내용1 include 아직 실행전<br>
<jsp:include page="b2.jsp" flush="true"/>
내용2 include 실행 후
</body>
</html>