<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	String user = request.getParameter("user");
	String key = request.getParameter("key");

	String clientId = "NEzgA8FpF7thgoIuuLtp"; //애플리케이션 클라이언트 아이디값
	String clientSecret = "jpVUpv3RhC"; //애플리케이션 클라이언트 시크릿값

	try{
		String code = "1"; //키발급시 0, 캡차이미지 비교시 1로 셋팅
	    String apiUrl = "https://openapi.naver.com/v1/captcha/nkey?code="+code+"&key="+key+"&value="+user; /* 키값을 가져오는 url 참고사항을 보면됨. */

	    URL url = new URL(apiUrl);
	    HttpURLConnection con = (HttpURLConnection)url.openConnection(); //return은 객체를 선언하는 부분
	    //헤더정보에 네이버에서필요로 하는 정보를 전해주자.
	    con.setRequestMethod("GET"); 
	    con.setRequestProperty("X-Naver-Client-Id", clientId); //Property속성값을 설정
	    con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
	    ////////////////////여기까지가 네이버 서버에 나의 요청을 전달하기 끝
	    //응답상태 코드 받기
	    int responseCode = con.getResponseCode(); //200,204,302,404,405,...
	    //네이버 서버에서 요총에 대한 응답을 성공처리 해줬다면?
	    BufferedReader br = null; //버퍼드리더를 사용해야 한줄씩 읽어온다.
	    if(responseCode == 200){ //나의 요청을 네이버가 듣고 처리해주었음
	    	 br = new BufferedReader(new InputStreamReader(con.getInputStream())); //응답을 출력해주자. 
	     } else {
	    	 br = new BufferedReader(new InputStreamReader(con.getErrorStream())); 
	     }
	     String line = null; //읽어온 것을 담기
	     //StringBuffer sb_line = new StringBuffer(); //읽어온 것을 버퍼에 담기 - 응답에 대한 객체를 위해서 사용
	     StringBuilder sb_line = new StringBuilder(); //읽어온 것을 버퍼에 담기 - 응답에 대한 객체를 위해서 사용
	     //				┌>버퍼에 들어있는 내용를 한줄씩 읽겠다.
	     while((line=br.readLine())!=null){ 
	    	 sb_line.append(line); 
	     }
	     br.close();
		 out.print(sb_line.toString());
	} catch(Exception e){
		out.print(e.toString());
	}
%>
