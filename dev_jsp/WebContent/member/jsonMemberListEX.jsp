<%@page import="java.util.HashMap"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.mvc2.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Map<String, Object>> memberList = new ArrayList<>();
	MemberDao mDao = new MemberDao();
	Map<String, Object> pMap = new HashMap<>();
	memberList = mDao.memberList(pMap);
	Gson g = new Gson();
	String memList = g.toJson(memberList);
	out.print(memList);
%>