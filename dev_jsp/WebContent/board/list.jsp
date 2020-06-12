<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	//자바영역 - 서버에서 처리된 결과과 html코드에 합쳐져서 클라이언트 측으로
    	//다운로드 되는 것임
    	//이미 모든 값이 결정된 상태임 - 변경불가함 - 정적임
    	List<Map<String,Object>> boardList = (List<Map<String,Object>>)request.getAttribute("boardList");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
	<script type="text/javascript">
		function boardList(){//조회버튼
			alert("글조회버튼 호출성공");
			location.href="/board/boardList.mvc3?cud=SEL"; //string으로 타야지 여기 jsp로 올것이다.
			/* $.ajax({
				url:"/board/boardList.mvc3?cud=SEL"
			}) 아작스로 이동하기 json 사용*/
		}
		function writeForm(){
			alert("글쓰기 버튼 호출성공");
			$('#dlg_write').dialog({
			    title: '글쓰기 화면',
			    width: 600,
			    height: 400,
			    closed: false,
			    cache: false,
			    href: 'writeForm.jsp',//div로 안하고 부모창안으로 불러온것은 jsp파일을 불러와서 합쳐진것임으로 결국 jsp파일을 가져온것임
			    modal: true
			});
		}
		function board_ins(){
			alert("저장호출 성공");
			$("#f_write").attr("method","post");
			$("#f_write").attr("action","./boardINS.mvc3");
			$("#f_write").submit();
		}
	</script>
<!-- 공통코드 영역(화면공통코드, 인증처리 -->
<%@include file ="../common/jEasyUICommon.jsp" %>
</head>
<body>
<h1>계층형 게시판 구현</h1><hr>
 	<table id="dg" title="My Users" class="easyui-datagrid" style="width:750px;height:250px"
            toolbar="#toolbar" pagination="true"
            rownumbers="true" fitColumns="true" singleSelect="true">
        <thead>
            <tr>
                <th field="bm_no" width="50">번호</th><!-- 글번호 -->
                <th field="bm_title" width="250">글제목</th><!-- 제목 -->
                <th field="bm_writer" width="100">작성자</th>
                <th field="bs_file" width="120">첨부파일</th>
                <th field="bm_hit" width="90">조회수</th>
            </tr>
        </thead>
        <%
        	if(boardList!=null){
        %>
      	<tbody>
      	<%
        		for(int i=0; i<boardList.size(); i++){
        			Map<String,Object> rmap = boardList.get(i);
        %>
        		<tr>
        			<td><%=rmap.get("BM_NO")%></td>
        			<td>
        			<!-- 너 댓글이니? -->
       			<%
       				String imgPath = "\\board\\";
       			if(Integer.parseInt(rmap.get("BM_POS").toString())>0){
       				for(int j=0; j<Integer.parseInt(rmap.get("BM_POS").toString()); j++){
       					out.print("&nbsp;&nbsp;");//들여쓰기 부분(댓글이 달릴경우 , 차수가 증가할때마다)
       				}/////////end of for
       			%>
        			<img src="<%=imgPath%>image.gif" border="0">
        		<%
        		}
        		%>
        			<a href="./boardDetail.mvc3?cud=DEL&bm_no=<%=rmap.get("BM_NO")%>">
        			<%= rmap.get("BM_TITLE") %></a>
        			</td>
        			<td><%= rmap.get("BM_WRITER") %></td>
        			<td><%= rmap.get("BS_FILE") %></td>
        			<td><%= rmap.get("BM_HIT") %></td>
        		</tr>
        <%
        		}///////////////end of for
      	%>
       	</tbody>
       	<%
        	}//////////////end of if
        %>
    </table>
    <div id="toolbar">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="writeForm()">글쓰기</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="boardList()">조회</a>
    </div>
    <!-- list.jsp: A학생, writeForm.jsp: B학생 -->
    <!--=============================[[ 글쓰기 화면 처리 시작]]================================== -->
	<div id="dlg_write" class="easyui-dialog" data-options="closed:true">
		<!-- B학생이 머지해야되는 공간, 개발할때 업무를 나누어서 할때 훨신 효과적으로 개발가능 -->
		아무말대잔치
	</div>
    <!--=============================[[ 글쓰기 화면 처리 끝]]====================================  -->
</body>
</html>