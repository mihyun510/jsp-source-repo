<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.List, java.util.Map" %>  
<%@ page import="java.util.HashMap" %>     
<%@include file ="../common/jEasyUICommon.jsp" %>  
<%
	List<Map<String, Object>> boardList = 
		(List<Map<String, Object>>)request.getAttribute("updateView");
	int size = 0;
	Map<String, Object> rMap = new HashMap<String,Object>();
	if(boardList!=null){
		size = boardList.size();
		rMap = boardList.get(0);
	}
	out.print("size:"+size);//1이면 성공 0이면 실패
	String rbm_title = request.getParameter("bm_title");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>글수정</title>
</head>
<body>
<script type="text/javascript">
	$("#document").ready(function(){
		
	});
</script>

</body>
</html>