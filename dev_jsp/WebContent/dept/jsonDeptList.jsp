<%@page import="jsp.dept.DeptDao"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//forward이므로 꼭 db를 경유해야 된다. 서블릿이니까.
	List<Map<String, Object>> deptList = (List<Map<String, Object>>) request.getAttribute("deptList"); 
	Gson g = new Gson();/* json이 자동으로 토탈레코드를 계산해서 구해준다. */
	String imsi = g.toJson(deptList);
	out.print(imsi);//json 포맷
%>