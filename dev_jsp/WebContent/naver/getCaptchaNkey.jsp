<%@page import="sun.rmi.server.Dispatcher"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.*,java.net.*" %>
<%
	String clientId = "NEzgA8FpF7thgoIuuLtp"; //애플리케이션 클라이언트 아이디값";
	String clientSecret = "jpVUpv3RhC"; //애플리케이션 클라이언트 시크릿값";
	
	try{
	     String code = "0"; // 키 발급시 0,  캡차 이미지 비교시 1로 세팅
	     String apiUrl = "https://openapi.naver.com/v1/captcha/nkey?code=" + code; /* https: 톰캣서버에 대한 인증을 받음. 보안 ,허가 */
	     URL url = new URL(apiUrl);
	     HttpURLConnection con = (HttpURLConnection)url.openConnection();
	     //p82 get방식인지 post방식인 구별해주는 것은 헤더에서 결정한다. 그러니 헤더에 넣어주자.
	     con.setRequestMethod("GET"); 
	     con.setRequestProperty("X-Naver-Client-Id", clientId);
	     con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
	     int responseCode = con.getResponseCode(); //응답 코드를 받아옴.
	     BufferedReader br = null; //키값을 읽어올 버퍼
	     if(responseCode == 200){//상태코드값을 여기서 비교하자. - 200번 정상 호출이 되었다면 키값을 읽어서 버퍼에 넣기
	    	 br = new BufferedReader(new InputStreamReader(con.getInputStream())); //InputStreamReader는 필터같은것 단독사용x 객체주입 필수임.
	     } else {
	    	 br = new BufferedReader(new InputStreamReader(con.getErrorStream())); //정상호출이 안되었다면 에러를 읽자
	     }
	     String line = null;
	     StringBuffer sb_line = new StringBuffer();//문자열을 담을 수 있는 곳을 생성 , 스트링 빌더랑 똑같은데 멀티스레드에서 안전하다. 스트링 빌더는 싱글스레드에서 안전.
	     while((line=br.readLine())!=null){ //br에 키값이 들어있는데 이것을 line으로 넘겨줬을때 null이 아니면
	    	 sb_line.append(line); //line값을 StringBuffer안에 넣어주자.
	     }
	     //사용한 자원 반납하기
	     br.close();
	     out.println(sb_line.toString()); //키값을 잘 받아왔는지 페이지에 출력하도록 해보자. {"Key":""} 이와같은 형태로 들어옴.
	} catch(Exception e){
		out.print(e.toString());
	}
	//키값을 넘겨서 이미지를 받아오자.
%>