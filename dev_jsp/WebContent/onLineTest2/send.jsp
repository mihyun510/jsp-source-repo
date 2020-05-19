<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	//서버로 값을 넘길려면 페이지 이동이 일어나야 된다. 그러니 send 페이지가 존재하는 이유이다. 
    	//그리고 값을 넘길때 forward가 안되고 sendRedirect을 해야 생성된 쿠키의 값을 확인할 수 있는 이유이다.
    	String htest4 = request.getParameter("htest4");
	    Cookie chtest4 = new Cookie("chtest4", htest4);
		chtest4.setMaxAge(60*60);
		response.addCookie(chtest4);
    %>
<form method="get" action="./account.jsp">
	<input type="hidden" name="htest4" value="<%= htest4 %>">
	<input type="submit" value="채점하기">
</form>