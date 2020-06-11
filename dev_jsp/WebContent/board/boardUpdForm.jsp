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
<form id="uf_board" method="post" enctype="multipart/form-data">
<input type="hidden" id="bm_no" name="bm_no" value="<%=rMap.get("BM_NO") %>">
<input type="hidden" id="bm_seq" name="bm_seq" value="<%=rMap.get("BM_SEQ") %>">
<input type="hidden" id="old_file" name="old_file" value="<%=rMap.get("BS_FILE") %>">
<table align="center" width="650px" height="280px">
	<tr>
		<td width="120px">글제목</td>
		<td width="580px">
			<input id="ubm_title" value="<%=rbm_title%>" name="bm_title" class="easyui-textbox">
		</td>
	</tr>
	<tr>
		<td width="120px">작성자</td>
		<td width="580px">
			<input id="ubm_writer" name="bm_writer" class="easyui-textbox">
		</td>
	</tr>	
	<tr>
		<td width="120px">내용</td>
		<td width="580px">
			<input id="ubm_content" name="bm_content" class="easyui-textbox" style="width:100%;height:100px">
		</td>
	</tr>	
	<tr>
		<td width="120px">첨부파일</td>
		<td width="580px">
			<input id="bs_file" name="bs_file" class="easyui-filebox" style="width:100%">
		</td>
	</tr>	
	<tr>
		<td width="120px">비번</td>
		<td width="580px">
			<input id="ubm_pw" name="bm_pw" class="easyui-textbox" style="width:100px">
		</td>
	</tr>	
</table>
</form>
</body>
</html>