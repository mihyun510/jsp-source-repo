<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
</head>
<body>
if문과 tableTag와 혼합해서 사용이 가능하다.
<c:forEach var="map" items="${mList}" varStatus="x">
	[${x.index }]:${mList[x.index]}
	${map.name }, ${map.age }, ${map.address }
	<c:if test="${map.age > 0 }">
		0보다 큰값입니다.
	</c:if>
</c:forEach>
</body>
</html>