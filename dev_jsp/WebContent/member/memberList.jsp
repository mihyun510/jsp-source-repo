<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	List<Map<String, Object>> memList = (List<Map<String, Object>>) request.getAttribute("memList");
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
<%@include file="../common/jEasyUICommon.jsp" %>
</head>
<body>
회원목록 보기
<table class="easyui-datagrid">
    <thead>
        <tr>
            <th>아이디</th>
            <th>비밀번호</th>
            <th>이름</th>
        </tr>
    </thead>
    <tbody>
    <%
    	if(memList.size() > 0){	//검색 결과가 있을때
    %>
	    <tr>
	        <td>&nbsp;</td><td>&nbsp;</td>
	    </tr>
	<%
    	}else{	//검색 결과가 없을때
	%>
		<tr>
	    	<!-- colspan="2" = > 옆 칸과 합친다. -->
	        <td colspan="2">목록이 없습니다.</td>
	    </tr>
	<%
    	}
	%>
	</tbody>
</table>
</body>
</html>