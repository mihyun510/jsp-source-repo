<%@page import="java.util.HashMap"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="orm.dao.SqlMapEmpDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%--SqlMapEmpDao의 테스트 파일 -> json파일로 사원정보가 화면에 열리는 것을 테스트. --%>
	<%-- html 주석은 사용불가함 -소스보기 했을때 주석이 보이므로 json포맷에 맞지 않음 --%>
<%
	String empno = request.getParameter("empno");
	int iempno = 0;
	if(request.getParameter("empno")!=null){
		iempno = Integer.parseInt(empno);
	}
	SqlMapEmpDao edao = new SqlMapEmpDao();
	Map<String, Object> pmap = new HashMap<>();
	pmap.put("empno", iempno);
	List<Map<String, Object>> elist = edao.empList(pmap); //파라미터는 사원번호를 받아서 넘겨야되니 null이 되면안된다. 파라미터로 넘길 값이 없으면 즉, where절을 사용하는 쿼리문이 아니면 , 사용자로부터 값을 받아서 넘길것이 없으면 null로 넘겨서 테스트가 가능하다.
	Gson g = new Gson();
	String imsi = g.toJson(elist);
	out.print(imsi);
%>
<%-- 자바주석 코드가 그냥 출력이 안됨. //이건 자바 주석이라서 사용가능하다. html주석은 사용불가함 소스보기에서 주석이 보인다. 그래서 사용불가능 마인타입이 json이라서 hmtl사용 불가능
반드시 jsp주석으로 처리할 것 소스보시에 코드가 나타나지 않는다.--%>