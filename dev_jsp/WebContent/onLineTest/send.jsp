<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String htest1 = request.getParameter("htest1");
	String htest2 = request.getParameter("htest2");
	String htest3 = request.getParameter("htest3");
	String htest4 = request.getParameter("htest4");
	out.print(htest1+", "+htest2+", "+htest3+", "+htest4);
	
	String h_no = request.getParameter("h_no");
	String h_name = request.getParameter("h_name");
	out.print("<br>");
	out.print(h_no+", "+h_name); //null, null 왜냐하면 스타트에서 시작을해서 send에 도착하는데 전단계가 test4이다. 바로 전단계에서 4가지의 값이 있으니 값이 찍힐 것이지만 그러나 그 4개의 값 중에서 h_no, h_name의 값을 가지고 있지 않으니 못 불러 올것이다. 즉, 이렇게값을 넘기면 안됨, 그러니 쿠키나 세션을 사용해서 값을 가져와야된다는 것이다. 요청이 유지가 안되기 때문이고 유지가 안되니 값도 유지가 안된다.
%>
<form method="get" action="account.jsp">
	<input type="hidden" name="htest1" value="<%= htest1 %>"> <!-- 답을 숨겨서 넘길 것이다. 유저가 답을 선택하면 여기에 넣어주자. -->
	<input type="hidden" name="htest2" value="<%= htest2 %>">
	<input type="hidden" name="htest3" value="<%= htest3 %>">
	<input type="hidden" name="htest4" value="<%= htest4 %>">
	<input type="submit" value="채점하기">
</form>