<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="member" scope="request" class="jsp.ch08.MemberInfo"/>
<%
	member.setId("madivirus");
	member.setName("최범균");
%>
<jsp:forward page="./useObject.jsp"/>