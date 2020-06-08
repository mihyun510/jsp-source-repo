<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	//list.jsp는 n건이지만 read.jsp는 상세보기 이므로 1건이다.
	//1건이라는 것은 size()가 한개이다.
    List<Map<String,Object>> boardList = (List<Map<String,Object>>)request.getAttribute("boardList");
    int size = 0;
    Map<String, Object> rmap = boardList.get(0);
    if(boardList != null){
	    size = boardList.size();
    }
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
<!-- 공통코드 영역(화면공통코드, 인증처리 -->
<%@include file ="../common/jEasyUICommon.jsp" %>
</head>
<body>
 	
</body>
</html>