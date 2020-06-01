<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>a.jsp[WEB-INF] 밑의 jsp파일</title>
</head>
<body>
a.jsp호출
WEB_INF아래의 jsp는 url로 접근이 불가능하다.
location.href로 접근이 불가능하다 - 사용을 중지
res.sendRedirect도 사용하면 안된다.
easyui의 url, ajax의 url에도 jsp를 쓰면 안됨 
reactd의 fetch도 사용할 수 없다.
jsp가 web-inf밑에 있을때는 위의 것들을 사용하면 안된다.
but
include와 forward가 된다.
</body>
</html>