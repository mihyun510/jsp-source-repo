<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	List<Map<String, Object>> memList = (List<Map<String, Object>>) request.getAttribute("memList");
	    if(memList==null){
	    	memList = new ArrayList<>();
	    }
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
<%@include file="../common/jEasyUICommon.jsp" %>

</head>
<body>
회원관리 > 회원목록
<table id="dg_member" class="easyui-datagrid" data-options="toolbar:toolbar">
    <thead>
        <tr>
            <th data-options="field:'mem_id', width:120">아이디</th>
            <th data-options="field:'mem_pw', width:120">비밀번호</th>
            <th data-options="field:'mem_name', width:120">이름</th>
        </tr>
    </thead>
    <tbody>
    <%
    	if(memList.size() > 0){	//검색 결과가 있을때
    		for(int i =0; i<memList.size(); i++){
    			Map<String, Object> rmap = memList.get(i);
    %>
	    <tr>
	        <td><%=rmap.get("MEM_ID") %></td>
	        <td><%=rmap.get("MEM_PW") %></td>
	        <td><%=rmap.get("MEM_NAME") %></td>
	    </tr>
	<%
    		}
    	}else{	//검색 결과가 없을때
	%>
		<tr>
	        <td colspan="2">목록이 없습니다.</td><!-- colspan="2":옆 칸과 합친다. -->
	    </tr>
	<%
    	}
	%>
	</tbody>
</table>
<div id="dl_add"><!-- 여기다가 div를 설정해놔서 memList.jsp안에서 함수가 호출이 안되요 팝업으로..?처리? -->
 <script type="text/javascript">
       var toolbar = [{
           text:'Add',
           iconCls:'icon-add',
           handler:function(){
        	   cmm_window_popup('memberAddForm.jsp','350','500','memberAddForm');
   /*      	   $('#dl_add').dialog({ //페이지 이동을 위해서 - memberList의 페이지가 여기 모달안으로 들어옴.
   			    title: '회원가입',
   			    width: 400,
   			    height: 400,
   			    closed: false,
   			    cache: false,
   			    href: 'memberAddForm.jsp', //모달안에 jsp 페이지을 넣는 역할을 하는 아이. - href 
   			    modal: true
   			   });///////////////end of dl_add */
        	}
       },{
           text:'Cut',
           iconCls:'icon-cut',
           handler:function(){alert('cut')}
       },'-',{
           text:'Edit',
           iconCls:'icon-edit',
           handler:function(){alert('edit')}
       },'-',{
           text:'Search',
           iconCls:'icon-search',
           handler:function(){
        	   alert('search');
        	   $('#dl_memList').dialog({ //페이지 이동을 위해서 - memberList의 페이지가 여기 모달안으로 들어옴.
   			    title: '회원목록',
   			    width: 400,
   			    height: 400,
   			    closed: false,
   			    cache: false,
   			    href: './memberList.mvc2?crud=memberList', //모달안에 jsp 페이지을 넣는 역할을 하는 아이. - href 
   			    modal: true
   			});}
       }];
    </script>
</div>
</body>
</html>