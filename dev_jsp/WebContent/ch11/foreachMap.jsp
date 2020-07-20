<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
	List<Map<String, Object>> mList = new ArrayList<>();
	Map<String,Object> rMap = new Hashtable<>();
	rMap.put("name", "이순신");
	rMap.put("age", 23);
	rMap.put("address", "서울시 관악구 삼성동");
	mList.add(rMap);
	
	rMap = new Hashtable<>();
	rMap.put("name", "김유신");
	rMap.put("age", 24);
	rMap.put("address", "서울시 관악구 신림동");
	mList.add(rMap);
	
	rMap = new Hashtable<>();
	rMap.put("name", "공효진");
	rMap.put("age", 25);
	rMap.put("address", "서울시 관악구 대학동");
	mList.add(rMap);
	request.setAttribute("mList", mList);
%>
<jsp:forward page="forEachMapView.jsp"/>
