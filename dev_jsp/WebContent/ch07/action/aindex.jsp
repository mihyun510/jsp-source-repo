<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%
    	String menu = null;
    	if(request.getParameter("menu")!=null){
    		menu = request.getParameter("menu");//intro or login or board
    	}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>온라인 시험 솔루션 개발 Ver1.0</title>
</head>
<body>
<table width="1000px" height="500px">
<!-- top.jsp 시작 -->
	<tr>
		<td width="1000px" height="50px">
		<jsp:include page="atop.jsp" flush="false"/>
		</td>
	</tr>
<!-- top.jsp끝 -->
<!-- main.jsp 시작  -->
	<tr>
		<td valign="top">
			<table border="1" borderColor="blue">
				<tr>
					<td width="250px" height="450px">
						<jsp:include page="amenu.jsp"/>
					</td>
					<td width="750px" height="450px">
<% 						if(menu == null || "intro".equals(menu)){ 
%>
							<jsp:include page="./aintro.jsp"/>
<%						} else if("login".equals(menu)){ 
%>	
							<jsp:include page="./alogin.jsp"/>
<%						} else if("board".equals(menu)){ 
%>
							<jsp:include page="./aboard.jsp"/>
<%						} 
%>
					</td>
				</tr>
			</table>
		</td>
	</tr>
<!-- main.jsp 끝 -->
</table>
</body>
</html>