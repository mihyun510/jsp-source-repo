<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 새글 일때[list.jsp -> 글쓰기 버튼을 누르면] 
	새글과 댓글은 어떻게 구분하나요?
-->
		<form id="f_ins">
			<div style="margin-bottom: 20px"><!-- 반응형웹으로 발전하면서 table태그보다 div를 사용하여 여백을 주는 방식을 많이 사용 -->
				<input class="easyui-textbox" id="bm_title" name="bm_title" label="글제목" labelPosition="top" data-options="prompt: 'Enter a title'" style="width: 200px;"/>
			</div>
			<div style="margin-bottom: 10px"><!-- 반응형웹으로 발전하면서 table태그보다 div를 사용하여 여백을 주는 방식을 많이 사용 -->
				<input class="easyui-textbox" id="bm_writer" name="bm_writer" label="작성자" labelPosition="top" data-options="prompt: 'Enter a writer'" style="width: 200px;">
			</div>
			<div style="margin-bottom: 10px"><!-- 반응형웹으로 발전하면서 table태그보다 div를 사용하여 여백을 주는 방식을 많이 사용 -->
				<input class="easyui-textbox" id="bm_email" name="bm_email" label="이메일" labelPosition="top" data-options="prompt: 'Enter a email'" style="width: 200px;">
			</div>
			<div style="margin-bottom: 10px"><!-- 반응형웹으로 발전하면서 table태그보다 div를 사용하여 여백을 주는 방식을 많이 사용 -->
				<input class="easyui-textbox" id="bm_content" name="bm_content" label="내용" labelPosition="top" data-options="prompt: 'Enter a Content'" style="width: 200px;">
			</div>
			<div style="margin-bottom: 10px"><!-- 반응형웹으로 발전하면서 table태그보다 div를 사용하여 여백을 주는 방식을 많이 사용 -->
				<input class="easyui-textbox" id="bm_pw" name="bm_pw" label="비밀번호" labelPosition="top" data-options="prompt: 'Enter a PW'" style="width: 250px;">
			</div>
			<div id="d_ins" style="margin-bottom: 10px" align="center">
				<a id="btn_save" href="javascript:emp_ins()" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" style="width: 120px;">저장</a>
				<a id="btn_close" href="javascript:$('#dlg_ins').dialog('close')" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" style="width: 120px;">닫기</a>
			</div>
		</form>
<form id="f_write">
<!-- 팝업으로 처리하기 -->

</form>

<!-- 댓글 일때 [read.jsp]-->
<form id="f_reple">
	<input type="hidden" name="bm_no" value="<%=5 %>"/>
	<input type="hidden" name="bm_group" value="<%=2 %>"/>
	<input type="hidden" name="bm_pos" value="<%=0 %>"/><!-- 원글이면 0 -->
	<input type="hidden" name="bm_step" value="<%=0 %>"/><!-- 원글이면 0-->
</form>
</body>
</html>