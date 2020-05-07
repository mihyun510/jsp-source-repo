<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Driver"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	Connection con = null;
    	Statement stmt = null;
    	ResultSet rs = null;
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>XML정보 읽어오기</title>
</head>
<body>
<table border="1" width="600">
	<tr><th>번호</th><th>아이디</th><th>비번</th><th>이름</th></tr>
	<%
		StringBuilder sql = new StringBuilder();
		sql.append("select mem_no, mem_id, mem_pw, mem_name from member_t");
		try{
			String jdbcDriver = "jdbc:apache:commons:dbcp:chap14";
			con = DriverManager.getConnection(jdbcDriver);
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql.toString());
			for(;rs.next();){
	%>
		<tr>
			<th><%out.print(rs.getString("mem_no")); %></th>
			<th><%out.print(rs.getString("mem_id")); %></th>
			<th><%out.print(rs.getString("mem_pw")); %></th>
			<th><%out.print(rs.getString("mem_name")); %></th>
		</tr>
	<%
			}//////end of for
		}catch(Exception e){
			out.print("exception: "+e.getMessage());
		} finally{
			if(rs!=null) try{rs.close();} catch(SQLException ex){}
			if(stmt!=null) try{rs.close();} catch(SQLException ex){}
			if(con!=null) try{rs.close();} catch(SQLException ex){}
		}/////end of try...catch..finally
	%>
</table> 
</body>
</html>