<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String htest2 = request.getParameter("htest2");
	    Cookie chtest2 = new Cookie("chtest2", htest2);
		chtest2.setMaxAge(60*60);
		response.addCookie(chtest2);
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
	//이전 문제 로 이동하기
	function prev(){
		//이렇게 이동하기는 redirect임 주소가 바뀜 - 데이터 유지가 안됨, 주소가 바뀜, get방식
		location.href="test2.jsp";
	}
	//담음 문제로 넘길때
	function next(){
		//수험자가 입력한 답안 저장하기
		var temp = 1;
		for(var i=0; i<document.getElementById("f_test1").cb.length; i++){
			if(document.getElementById("f_test1").cb[i].checked==1){
				document.getElementById("f_test1").htest3.value = temp; /* getElementById이거 아이디 값을 가져오는 건가 아니면 name값도 id값으로 가져오는 것인가. */
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
<form id="f_test1" method="get" action="test4.jsp"><!-- form전송은 form안에 있는 name이 모두 전송된다. get방식일때나 post방식 일때나.  -->
<input type="hidden" name="htest3" value="0">
문제3 자바를이용하여 오라클과 강은 DB서버에 접속하여 조회, 입력, 수정, 삭제와 같은 업무처리를 하고 싶다.<br> 
이때 오라클에서 제공하는 드라이버 클래스를 가지고 있는 odbc6.jar를 참조해야 하는데 이 파일의 배포 위치로 맞는 것을 고르시오.<br>
<input type="checkbox" name="cb" onChange="test(0)">
ⓐ WEB-INF\classes<br>
<input type="checkbox" name="cb" onChange="test(1)">
ⓑ WEB-INF\lib<br>
<input type="checkbox" name="cb" onChange="test(2)">
ⓒ WEB-INF\jspBean<br>
<input type="checkbox" name="cb" onChange="test(3)">
ⓓ WEB-INF\jsp<br>
</form>
<!-- </pre> -->
<br>
<button onclick="prev()">이전문제</button>
<button onclick="next()">다음문제</button>
</body>
</html>