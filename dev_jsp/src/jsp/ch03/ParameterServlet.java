package jsp.ch03;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.util.HashMapBinder;

public class ParameterServlet extends HttpServlet{
	Logger logger = Logger.getLogger(ParameterServlet.class);
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		logger.info("doGet 호출 성공");
		Map<String, Object> pMap = new HashMap<String, Object>();//1. r공통 코드를 사용하기 위한 인스턴스화
		HashMapBinder hmb = new HashMapBinder(req); //여기서 req객체 전달 - 요청을 계속 유지하기 위한 파라미터로 req객체를 넘김 이렇게 req를 넘기지 않으면 요청받은후 전달이 끝나면 요청의 연결을 끊어지기 때문에 req를 유지 시킬 수 없다. 그러니 req를 다른 클래스에서 처리하기 위해서는 생성자로 넘기면 req유지가 된다.
		hmb.binder(pMap); //위에서 req객체를 넘겼기 때문에 그 객체를 사용해서 요청을 받는다. 함수안에 req는 여기서 넘긴 req를 사용하는 것이다. 값을 비우고 새롭게 요청받은 값들로 채우자.
		Object keys[] = null;
		keys = pMap.keySet().toArray();
		for(int i = 0; i<keys.length; i++) {
			logger.info("key: "+keys[i]+", value: "+pMap.get(keys[i]));
		}
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException{
		logger.info("doPost호출 성공");
		Map<String, Object> pMap = new HashMap<String, Object>();
		HashMapBinder hmb = new HashMapBinder(req); 
		hmb.binder(pMap); 
		Object keys[] = null;
		keys = pMap.keySet().toArray();
		for(int i = 0; i<keys.length; i++) {
			logger.info("key: "+keys[i]+", value: "+pMap.get(keys[i]));
		}
	}
}
