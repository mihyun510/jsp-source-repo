<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
/*     	Cookie cookie = new Cookie("hp", "아이폰11pro");
    	//cookie.setPath("/ch09"); //ch09 - 읽을 수있음, 불가
    	//cookie.setMaxAge(60);
    	response.addCookie(cookie);
    	cookie = new Cookie("coffee", "돌체라떼");
    	cookie.setPath("/");
    	cookie.setMaxAge(75);
    	response.addCookie(cookie);//읽을 수있음, 불가
    	cookie = new Cookie("notebook", "LG그램");
    	//cookie.setPath("/"); //아무것도 안주면 결국 자신이 속한 path을 바라본다.
    	cookie.setMaxAge(90);
    	response.addCookie(cookie);//읽을 수있음, 가능*/
    	
    	
    	Cookie notebook = new Cookie("notebook","삼성노트북");//띄어쓰기가 들어간 값은 컴퓨터가 인식을 못한다. 특수문자로 인식함
    	response.addCookie(notebook); //ch09 - 읽을수 있음, 불가, //ch09-1에서는 확인할 수 없는 쿠키 path을 지정해주지 않으면 현재 자신이 속한 패스에서만 공유가능 디폴트임
    	Cookie hp = new Cookie("hp","아이폰12");
    	hp.setMaxAge(60);
    	hp.setPath("/ch09"); //ch09-1에서는 확인할 수 없는 쿠키
    	response.addCookie(hp);//ch09 - 읽을수 있음,불가
    	Cookie coffee = new Cookie("coffee", "돌체라떼");
    	coffee.setMaxAge(75);
    	coffee.setPath("/"); //ch09-1에서도 확인가능한 공유가능한 쿠키임 그러니 다른 프로젝트에서도 확인할 수있고 쿠키의 상태를변경가능함.
    	response.addCookie(coffee);//ch09 - 읽을수 있음,가능
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>