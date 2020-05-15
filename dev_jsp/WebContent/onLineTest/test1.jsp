<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	//수험자가 선택한 답안을 
	function test(dap){
		//alert("당신이 선택한 답안은 "+dap+"입니다.");
		for(var i=0; i<document.getElementById("f_test1").cb.length; i++){
			if(dap == i){
				document.getElementById("f_test1").cb[i].checked = 1;
			}else{
				document.getElementById("f_test1").cb[i].checked = 0;
			}
		}
	}
	//담음 문제로 넘길때
	function next(){
		//수험자가 입력한 답안 저장하기
		var temp = 1;
		for(var i=0; i<document.getElementById("f_test1").cb.length; i++){
			if(document.getElementById("f_test1").cb[i].checked==1){
				document.getElementById("f_test1").htest1.value = temp; /* getElementById이거 아이디 값을 가져오는 건가 아니면 name값도 id값으로 가져오는 것인가. */
			} else{
				temp = temp + 1;
			}
		}
		alert("temp:"+temp);
		document.getElementById("f_test1").submit();
		//$("#f_test1")
	}
	
</script>
<%@include file="../common/jEasyUICommon.jsp" %>
</head>
<body>
<!-- <pre>시집같은 곳에 적용하는 태그 띄어쓰기 줄바꿈 단락띄기 등 작성한 데로 보여주는 태그임. -->
<form id="f_test1" method="get" action="test2.jsp">
<input type="hidden" name="htest1" value="0"> <!-- 답을 숨겨서 넘길 것이다. 유저가 답을 선택하면 여기에 넣어주자. -->
문제1. 서블릿 메소드의 호출 순서로 맞는 것은?<br>
<input type="checkbox" name="cb" onChange="test(0)"><!-- 폼태그안에있는 것은 우리가 안넘겨도 모두 넘어가므로 cb의 값도 넘어간다. -->
ⓐ init() - service() - destroy()<br>
<input type="checkbox" name="cb" onChange="test(1)">
ⓑ service() -destroy() - init()<br>
<input type="checkbox" name="cb" onChange="test(2)">
ⓒ destroy() - init() - service()<br>
<input type="checkbox" name="cb" onChange="test(3)">
ⓓ doGet() - destroy() - init() - service()<br>
</form>
<!-- </pre> -->
<br>
<button onclick="next()">다음문제</button>
</body>
</html>