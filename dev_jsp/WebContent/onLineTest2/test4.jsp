<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String htest3 = request.getParameter("htest3");
	    Cookie chtest3 = new Cookie("chtest3", htest3);
		chtest3.setMaxAge(60*60);
		response.addCookie(chtest3);
    %>
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
	function prev(){
		//이렇게 이동하기는 redirect임 주소가 바뀜 - 데이터 유지가 안됨, 주소가 바뀜, get방식
		location.href="test3.jsp";
	}
	//담음 문제로 넘길때
	function next(){
		//수험자가 입력한 답안 저장하기
		var temp = 1;
		for(var i=0; i<document.getElementById("f_test1").cb.length; i++){
			if(document.getElementById("f_test1").cb[i].checked==1){
				document.getElementById("f_test1").htest4.value = temp; /* getElementById이거 아이디 값을 가져오는 건가 아니면 name값도 id값으로 가져오는 것인가. */
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
<form id="f_test1" method="get" action="send.jsp">
<input type="hidden" name="htest4" value="0">
문제4. Bean의 scope에 대한 설명으로 틀린 것은?<br>
<input type="checkbox" name="cb" onChange="test(0)">
ⓐ page: 기본값이며 그 페이지 내에서만 접근 가능<br>
<input type="checkbox" name="cb" onChange="test(1)">
ⓑ request : forward, include에서 사용가능<br>
<input type="checkbox" name="cb" onChange="test(2)">
ⓒ session: 사용자가 로그인하면 시간에 제약없이 무한히 유지된다.<br>
<input type="checkbox" name="cb" onChange="test(3)">
ⓓ application: 서버를 재기동하기 전까지는 시간에 제약없이 무한히 유진된다.<br>
</form>
<!-- </pre> -->
<br>
<button onclick="prev()">이전문제</button>
<button onclick="next()">다음문제</button>
</body>
</html>