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
<title>jsp > jsp [include을 활용]:온라인 시험 솔루션 개발 Ver1.0</title>
<link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/default/easyui.css"><!-- css사용 -->
<link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/icon.css"><!-- 아이콘 사용 -->
<link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/color.css"> <!-- 색 사용 -->
<link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/demo/demo.css"> <!-- 데모버전 사용 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.9.1.min.js"></script> <!-- jquery사용 api에서 제공하는 안정화된 버전 사용-->
<script type="text/javascript" src="https://www.jeasyui.com/easyui/jquery.easyui.min.js"></script> <!-- eaayui사용 -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/jax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script><!-- jquery 쿠기 사용 -->
</head>
<body>
 	<div id="mainDiv" class="easyui-layout" style="width: 1000px; height: 500px">
		<div id="topDiv" data-options="region:'north'" style="width: 1000px; height: 70px;">
			<%-- <jsp:include page="./top.jsp"></jsp:include> --%>
			 <%@include file="./top.jsp" %> 
		</div>
		<div id="menuDiv" data-options="region:'west',collapsed:false" style="width: 250px; height: 450px;">
			<%-- <jsp:include page="./menu.jsp"></jsp:include> --%>
			 <%@include file="./menu.jsp" %> 
		</div>
		<div id="bodyDiv"  data-options="region:'center'" style="width: 750px; height: 450px;">
			<%-- <jsp:include page="./body.jsp"></jsp:include> --%>
<%						if(menu == null || "intro".equals(menu)){ 
%>
							<%@ include file="./intro.jsp" %>
<%						} else if("login".equals(menu)){ 
%>	
							<%@ include file="./login.jsp" %>
<%						} else if("board".equals(menu)){ 
%>
							<%@ include file="./board.jsp" %>
<%						} 
%>

		</div>	
	</div> 
</body>
</html>












<%-- 	jeasyui 사용하지 않고 div로 공간 나누기
		<div id="mainDiv"style="width: 1000px; height: 500px; ">
		<div id="topDiv" style="width: 1000px; height: 50px; border: 1px solid pink;">
			<jsp:include page="./top.jsp"></jsp:include>
		</div>
		<div id="menuDiv" style="width: 250px; height: 450px; float:left; border: 1px solid red;">
			<jsp:include page="./menu.jsp"></jsp:include>
		</div>
		<div id="bodyDiv" style="width: 750px; height: 450px; float:left; border: 1px solid green;">
			<jsp:include page="./body.jsp"></jsp:include>
		</div>	
	</div> --%>