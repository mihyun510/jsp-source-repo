<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서목록</title>
<%@include file="../common/jEasyUICommon.jsp" %>
</head>
<body>
<table class="easyui-datagrid" title="부서 목록" url="./jsonDeptList.jsp"></table> <!--  Cannot read property 'total' of null ,토탈 레코드가 없으니 null처리 스크립트 오류 던짐.  -->

</body>
</html>