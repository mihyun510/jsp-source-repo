<%@page import="project.restaurant.RestaurantDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//mapDesign.html문서에서 사용자가 화면에 입력한 아이디 가져오기.
	String mem_id = request.getParameter("mem_id"); //쿼리스트링의 값을 넣어줘야된다. 주소에서 [?mem_id=입력한 값]?뒤에 오는 값.
//mapDesign.html문서에서 사용자가 화면에 입력한 비번 가져오기.
	String mem_pw = request.getParameter("mem_pw"); 
	//out.print("사용자가 입력한 아이디는 "+mem_id);
	RestaurantDao rdao = new RestaurantDao();
	String msg = null;
	msg = rdao.login(mem_id, mem_pw);
//여기서 쿠키를 생성해야된다. 왜냐하면 쿠키는 서버를 타야되니 페이지가 이동이 되어야된다.
//여기서 주의해야 할 거은 로그인 한 사람을 쇼핑도 하고 안에 다른 모든 일을 처리한다. 경로를 주지 말자 "/"
	Cookie c_name = new Cookie("c_name", msg); //객체이름은 상관이없다. 쿠키의이름을 주의해야된다. 수정, 삭제 등등 쿠키의 이름만 동일하면 되기 때문이다.
	c_name.setMaxAge(60*5);
	c_name.setPath("/"); //뉴스, 쇼핑, 게임 여러가지 콘텐츠 접근을 위해서 경로를 /로 설정하자.
	//response.addCookie(c_name);
 	out.print(msg); //이것은 이제 필요가 없음 쿠키에 저장을 해놓음. 근데 일단 살려놓는다. 왜냐하면 현제 구조가 이것이 없으면 에러가 발생하는 ㄱ\상황.
%>
