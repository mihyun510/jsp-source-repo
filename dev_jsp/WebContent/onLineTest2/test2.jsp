<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String htest1 = request.getParameter("htest1");
    	Cookie chtest1 = new Cookie("chtest1", htest1);
    	chtest1.setMaxAge(60*60);
    	response.addCookie(chtest1);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../common/jEasyUICommon.jsp" %>
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
	//이전 문제 로 이동하기
	function prev(){
		//이렇게 이동하기는 redirect임 주소가 바뀜 - 데이터 유지가 안됨, 주소가 바뀜, get방식
		location.href="test1.jsp";
	}
	//다음 문제로 넘길때
	function next(){
		//수험자가 입력한 답안 저장하기
		var temp = 1;
		for(var i=0; i<document.getElementById("f_test1").cb.length; i++){
			if(document.getElementById("f_test1").cb[i].checked==1){
				document.getElementById("f_test1").htest2.value = temp; /* getElementById이거 아이디 값을 가져오는 건가 아니면 name값도 id값으로 가져오는 것인가. */
			} else{
				temp = temp + 1;
			}
		}
		alert("temp:"+temp);
		document.getElementById("f_test1").submit();
		//$("#f_test1")
	}
	
</script>

</head>
<body>
<!-- <pre>시집같은 곳에 적용하는 태그 띄어쓰기 줄바꿈 단락띄기 등 작성한 데로 보여주는 태그임. -->
<form id="f_test1" method="get" action="test3.jsp">
<input type="hidden" name="htest2" value="0"> <!-- 답을 숨겨서 넘길 것이다. 유저가 답을 선택하면 여기에 넣어주자. -->
문제2. 조회한 결과를 DB서버에서 가져온 후 결과를 List에 담았다. 이것을 화면단에 출력하고자 할 때 사용할 메소드 이름은무엇인지 고르시오.<br>
<input type="checkbox" name="cb" onChange="test(0)">
ⓐ forward(request,response)<br>
<input type="checkbox" name="cb" onChange="test(1)">
ⓑ sendRedirect(“페이지 이름”)<br>
<input type="checkbox" name="cb" onChange="test(2)">
ⓒ toString()<br>
<input type="checkbox" name="cb" onChange="test(3)">
ⓓ print()<br>
</form>
<!-- </pre> -->
<br>
<button onclick="prev()">이전문제</button>
<button onclick="next()">다음문제</button>
</body>
</html>