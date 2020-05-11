<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page errorPage="/error/viewErrorMessage.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파라미터 출력</title>
</head>
<body>
파라미터 값: <%= request.getParameter("name").toUpperCase() %> <!-- .toUpperCase()가 없으면 name값이 전달되지 않았음으로 null이 들어간다. 그리고 있으면 값이 존재하지 않고 대문자로 변경할 문자열이 null이기 때문에 500번 에러가 나타난다 .값을 넘겨주면 된다. get방식  활용. -->
</body>
</html>