<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키삭제</title>
</head>
<body>
<%
	Cookie notebook = new Cookie("notebook","");
	notebook.setMaxAge(0);
	response.addCookie(notebook);
	
	Cookie coffee = new Cookie("coffee","");
	coffee.setMaxAge(0);
	coffee.setPath("/"); //해당쿠키를 수정하거나 삭제하고 싶다면 만들었던 쿠키의 속성을 똑같이 주어야된다.
	response.addCookie(coffee); 
	
	Cookie cs[] = request.getCookies();
	if(cs != null && cs.length>0){
		for(int i=0; i<cs.length; i++){
			out.print(cs[i].getName() +", "+cs[i].getValue()+"<br>");	
		}
	}else{
		out.print("쿠키정보없음.");
	}

%>
</body>
</html>