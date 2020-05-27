<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.invalidate();//세션을 모두 삭제해주세요.
	response.sendRedirect("mapDesign3.jsp");
%>