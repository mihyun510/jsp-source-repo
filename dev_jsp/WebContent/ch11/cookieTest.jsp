<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    //5초 이후에 자동 세로고침된다.
    response.setIntHeader("Refresh",5);
	//자바당 - 실행주체가 톰캣(java.api, jsp.api, servlet.api) 이것들이 백엔드 이다.
	//여기에서 쿠키를 사용할 것이다.
	Cookie c_id = new Cookie("mem_id", "apple");
    c_id.setPath("/"); //여기서 dev_jsp - 404
    c_id.setMaxAge(60*1);
    //req을 선언하지 않았는데 response을  사용할 수 있는 이유는 내장객체이기 때문이다.
    response.addCookie(c_id);//쿠키를 저장할 땐 reponse 내장객체가 필요하고..
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
세션을 사용하기에 제약조건이 있다. 
세션을 저장하는 쿠키메모리는 용량이 작다

쿠키를 사용하여 웹소켓의 연속성을 유지하자

body안에는 html땅입니다.
브라우저가 언제? 요청했을때 무엇으로? url로 전송방식:get or post
 <%
 	//쿠키에 담긴 정보 꺼내오기
 	//(클라이언트에서 서버로 꺼낸다음 다시 내려보낸다.[화면:EL,JSTL을 사용하여 응답페이지에 사용할 수 있다.])
 	Cookie cooks[] = request.getCookies();
	if(cooks != null){
		for(int i=0; i<cooks.length; i++){
			if(cooks[i].getName().equals("mem_id")){ //키로 키값을 비교한다.
				out.print(cooks[i].getValue()+"<br>");
				//consol.log(cooks[i].getValue()+"<br>");
			}
		}
	}
 
 %>
쿠키이름: ${cookie.mem_id.name} <br><!-- mem_id -->
쿠키값: ${cookie.mem_id.value} <br><!-- apple  -->
</body>
</html>