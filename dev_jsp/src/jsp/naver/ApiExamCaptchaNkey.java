package jsp.naver;

//네이버 캡차 API 예제 - 키발급
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

//네이버 캡차 API 예제 - 키발급
public class ApiExamCaptchaNkey {
//클라이언트ID: NEzgA8FpF7thgoIuuLtp
//클라이언트 시크릿값 :jpVUpv3RhC
//{"key":"xxxxxx"} - 발급받은 키값
 public static void main(String[] args) {
     String clientId = "NEzgA8FpF7thgoIuuLtp"; //애플리케이션 클라이언트 아이디값";
     String clientSecret = "jpVUpv3RhC"; //애플리케이션 클라이언트 시크릿값";

     String code = "0"; // 키 발급시 0,  캡차 이미지 비교시 1로 세팅
     String apiURL = "https://openapi.naver.com/v1/captcha/nkey?code=" + code;

     Map<String, String> requestHeaders = new HashMap<>(); //map에 id와 시크릿값을 넣고 있다. 기억한다. - 지역변수이다. 
     requestHeaders.put("X-Naver-Client-Id", clientId); //헤더에 아이디와 get,post방식 을 지정한다. 헤더에 정보전달할 map에 값 담기
     requestHeaders.put("X-Naver-Client-Secret", clientSecret);
     String responseBody = get(apiURL, requestHeaders); //지변이니 파라미터에 넘긴다.
     String result = responseBody.substring(8, 24);
     new ApiExamCaptchaImage(result);
    // System.out.println(responseBody);
     System.out.println(result);
 }
/*
 * 가장 먼저 호출되는 메소드 - 넘김받음/아이디,시크릿값
 * Map에 요청에 필요한 속성값들을 설정함
 * connect가 호출이 됨 - 연결통로가 확보됨
 * 연결이 되었다면 요청에  필요한 정보를 만들어서 전송보냄. -get
 * 응답 메세지가(200,204,302) 올 때 까지 기다림
 * readBody호출(파라미터로 서버와 연결된 후에 연결정보를 가진 커넥션에서 inputStream 생성함.)
 * 이것을 활용하여 네이버에서 전송해주는 키값을 청취할 수 있다. 
 * 여기에 관련된 것만 뽑아서 jsp에 넣어주면 된다. 
 */
 private static String get(String apiUrl, Map<String, String> requestHeaders){
     HttpURLConnection con = connect(apiUrl); //여기서 불러요 connect호출하기, apiUrl를 유지하겠다
     try {
         con.setRequestMethod("GET");
         for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
             con.setRequestProperty(header.getKey(), header.getValue());
         }

         int responseCode = con.getResponseCode();
         if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출 - 200
             return readBody(con.getInputStream());
         } else { // 에러 발생
             return readBody(con.getErrorStream());
         }
     } catch (IOException e) {
         throw new RuntimeException("API 요청과 응답 실패", e);
     } finally {
         con.disconnect();
     }
 }

 private static HttpURLConnection connect(String apiUrl){
     try {
         URL url = new URL(apiUrl); //커넥션에서 받은 url입니다. url 주소로 연결해줍니다.
         return (HttpURLConnection)url.openConnection();
     } catch (MalformedURLException e) {
         throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
     } catch (IOException e) {
         throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
     }
 }
//여기서 데이터를 받아오는 구간이다
 private static String readBody(InputStream body){ //캡쳐이미지를 읽어야 됩니다. , String안에는 id, key, 시크릿값 중 뭐가 들어있나요? 1번 클래스가 키발급 클래스이다 키값이 들어있을 것이다.
     InputStreamReader streamReader = new InputStreamReader(body);

     try (BufferedReader lineReader = new BufferedReader(streamReader)) {//이것이 에러일때 나누어서 따로 처리해야됨.
         StringBuilder responseBody = new StringBuilder(); //서버에서 읽어온 것

         String line;
         while ((line = lineReader.readLine()) != null) {
             responseBody.append(line); //읽어온 정보를 여기에 담아요, responseBody: StringBuilder
         }

         return responseBody.toString();
     } catch (IOException e) {
         throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
     }
 }
}
