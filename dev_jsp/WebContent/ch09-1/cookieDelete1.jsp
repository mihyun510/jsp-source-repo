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
	Cookie coffee = new Cookie("coffee","");
	coffee.setMaxAge(0);
	coffee.setPath("/");
	response.addCookie(coffee); 
	Cookie notebook = new Cookie("notebook","");
	notebook.setMaxAge(0);
	response.addCookie(notebook); 
	
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