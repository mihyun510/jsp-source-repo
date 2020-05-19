<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	    Cookie[] cookies = request.getCookies();
		String h_no = null;
		if(cookies!=null&&cookies.length>0){
			for(int i = 0; i<cookies.length; i++){
				if("c_hno".equals(cookies[i].getName())){
					h_no = cookies[i].getValue();
				}
			}
		}
		out.print("h_no:"+h_no);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>onLineTest(쿠키활용처리)</title>
<script type="text/javascript">
	function start(){
		location.href="test1.jsp";
	}
	function cdelete(){
		location.href = "deleteCookie.jsp" 
	}
</script>
</head>
<body>
<button onClick="cdelete()">쿠키삭제</button>
<form method="get" action="test1.jsp">
	<input type="hidden" name="h_no" value="20200515001"/>
	<input type="hidden" name="h_name" value="이순신"/>
	<input type="submit" value="submit_시험시작"/><!-- 전송방식2: submit방식 - form전송과 함께 사용 그러니 form안에 있어야됨.-->
</form>
<!-- <button onclick="start()">버튼 시험시작</button>전송방식1: 버튼으로 인해 함수를 통해서 전송  -->
</body>
</html>