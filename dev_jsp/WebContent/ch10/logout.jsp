<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//세션값 삭제하기
	session.invalidate();
	response.sendRedirect("mapDesign3.jsp");
%>