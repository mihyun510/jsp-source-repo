<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 포스트방식이라서 한글은 깨지고 다른건 처리가 잘됨..? , 유알엘이 바꼈다 요청이 유지되지 않는다는 것을 알 수 있다. post방식으로 테스트 해보기 -->
	<form method="post" action="/ch17/order.nhn"><!-- 다른 방법으로 스크립트로 처리하는 방법이 있다. -->
		<input type="text" name="mem_name">
		<input type="submit" value="전송">
	</form>
</body>
</html>