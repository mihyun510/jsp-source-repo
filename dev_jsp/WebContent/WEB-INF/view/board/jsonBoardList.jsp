<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//ajax or dom에 넣을려면 사용하자.
	List<Map<String,Object>> list = (List<Map<String,Object>>)request.getAttribute("imsi");
	Gson g = new Gson();
	String temp = g.toJson(list);
	out.print(temp);
	//request.setAttribute("content", content);

%>