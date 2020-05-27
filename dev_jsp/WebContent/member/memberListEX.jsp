<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	List<Map<String, Object>> memList = new ArrayList<>();
    	memList = (List<Map<String, Object>>) request.getAttribute("memList");
    	Map<String, Object> rmap = new HashMap<>();
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
<%@include file="../common/jEasyUICommon.jsp" %>
</head>
<body>
<h2>회원 관리</h2>
    <p>회원 관리 > 회원 목록 </p>
    <div style="margin:20px 0;"></div>
    <table id="tb_member"> 
     <!--    <thead>
            <tr>
                <th data-options="field:'MEM_ID',width:100,align:'center'">회원 아이디</th>
                <th data-options="field:'MEM_PW',width:100,align:'center'">회원 비밀번호</th>
                <th data-options="field:'MEM_NAME',width:100,align:'center'">회원 이름</th>
                <th>회원 아이디</th>
                <th>회원 비밀번호</th>
                <th>회원 이름</th>
            </tr>
        </thead> -->
        <tbody> 
            <%
            if(memList.size() > 0){
            	for(int i=0; i<memList.size(); i++){
					rmap = memList.get(i);
            %>
            <tr>
            <%
           		for(i=0; i<rmap.size(); i++){
           			Set set = rmap.keySet();
                    Iterator iterator = set.iterator();
                    String key = null;
                    while(iterator.hasNext()){
                        key = (String) iterator.next();
                        System.out.println("KEY : " + key); // Key2 , Key1, Key5, Key4, Key3
                    }
					if("MEM_ID".equals(key)){
			%>
						<td id="MEM_ID"><%=rmap.get(key) %></td>
			<%
					}else if("MEM_PW".equals(key)){
			%>
						<td id="MEM_PW"><%=rmap.get(key) %></td>
			<%	
					}else if("MEM_NAME".equals(key)){
			%>
						<td id="MEM_NAME"><%=rmap.get(key) %></td>
			<%
	           			}
	           		}
            %>
            </tr>
            <%
            	}
            }else{
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
    <script type="text/javascript">
    	$(document).ready(function(){
    		$("#tb_member").datagrid({
    			title:"MEMBER TABLE"
    			,width:500 ,height:250
    			,singleSelect:true
    			,collapsible:true
    			,fitColumns: true
    			,align:'center'
    			//,url:"./jsonMemberList.jsp"
    			,columns:[[
    		        {field:'MEM_ID',title:'회원 아이디',width:100,align:'center'},
    		        {field:'MEM_PW',title:'회원 비밀번호',width:100,align:'center'},
    		        {field:'MEM_NAME',title:'회원 이름',width:100,align:'center'}
    		    ]]
    		});
    	});
    </script>
</body>
</html>