<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../common/jEasyUICommon.jsp" %>
	<script type="text/javascript">
		function memAdd(){
			//alert("memAdd호출 성공");
			//$(opener.location).attr("href","javascript:fun()");
			//opener.location.href="javascript:fun()";
			$("#f_ins").attr("method", "get");
			$("#f_ins").attr("action", "./member.mvc2");
			$("#f_ins").submit();
			
			self.close();
		}
	</script>
</head>
<body>
회원가입 페이지
<div id="dlg_ins" class="easyui-dialog"  data-options="closed:false,title:'회원정보 등록', modal: true, footer: '#d_ins'" style="width: 100%; max-width: 480px; padding: 30px 60px"><!-- 반응형 웹을 위한 속성들.. -->
	<form id="f_ins">
		<input type = "hidden" name="crud" value="memberAdd">
		<div style="margin-bottom: 10px"><!-- 반응형웹으로 발전하면서 table태그보다 div를 사용하여 여백을 주는 방식을 많이 사용 -->
			<input class="easyui-textbox" id="mem_id" name="mem_id" label="회원아이디" labelPosition="top" data-options="prompt: 'Enter a ID'" style="width: 150px;">
		</div>
		<div style="margin-bottom: 10px"><!-- 반응형웹으로 발전하면서 table태그보다 div를 사용하여 여백을 주는 방식을 많이 사용 -->
			<input class="easyui-textbox" id="mem_pw" name="mem_pw" label="회원 비밀번호" labelPosition="top" data-options="prompt: 'Enter a PW'" style="width: 200px;">
		</div>
		<div style="margin-bottom: 10px"><!-- 반응형웹으로 발전하면서 table태그보다 div를 사용하여 여백을 주는 방식을 많이 사용 -->
			<input class="easyui-textbox" id="mem_name" name="mem_name" label="회원 이름" labelPosition="top" data-options="prompt: 'Enter a NAME'" style="width: 200px;">
		</div>
	</form>
	<div id="d_ins" style="margin-bottom: 10px" align="center">
		<a id="btn_save" href="javascript:memAdd()" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" style="width: 120px;">저장</a>
		<a id="btn_close" href="javascript:self.close()" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" style="width: 120px;">닫기</a>
	</div>
</div>
</body>
</html>