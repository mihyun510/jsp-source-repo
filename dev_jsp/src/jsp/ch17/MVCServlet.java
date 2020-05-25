package jsp.ch17;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

public class MVCServlet extends HttpServlet{
	Logger logger = Logger.getLogger(MVCServlet.class);
	ServletConfig config = null;
	public void init(ServletConfig config) throws ServletException{
		this.config = config;
		this.init();
	}
	public void doService(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		logger.info("doService 호출 성공");
		String uri = req.getRequestURI();//member/memberList.kosmo , getRequestURI()는 contextpath부터 나옴
		String context = req.getContextPath();//server.xml의 context path = /,  getRequestURI()에서 해당 페이지 이름의 앞부분까지의 범위 컨텍스트 패스가 프로젝트 이름을 뜻하는 건가,,? 여기서 /이것만 나오는것을 보아 맞는듯.,.
		logger.info("uri: "+uri);
		logger.info("context: "+context); // 0 , /dev_jsp 근데 여기서는 컨텍스트 이름을 지웠으므로 0 아무것도 출력안됨. 
		String command = uri.substring(context.length()+1); // order/goods/goodsInsert.kosmo , 여기서 /를 지우기 위해서 컨텍스트 패스 길이에서 1를 더해서 처리
		logger.info("command: "+ command); // 그럼 여기서는 슬래쉬가 잘린 uri가 나옴.
		int end = command.lastIndexOf('.'); //.을 기준으로 뒤에서 부터 .의 인덱스를 구함
		logger.info("end: "+end); //end: 23
		command = command.substring(0, end);
		logger.info("command: "+ command); // order/goods/goodsInsert
		String imsi[] = null;
		imsi = command.split("/"); // /이거 기준으로 쪼개기
		for(String val : imsi) {
			logger.info("val: "+ val); //memberList가 들어있움
		}
		MemberController memCtrl = new MemberController();
		OrderController orderCtrl = new OrderController();
		GoodsController goodCtrl = new GoodsController();
		//매번 이렇게 처리할 필요가 없다. 해당하는 경우만 이것들이 각각 실행되면 된다.
		//insert here
		String p_choice = req.getParameter("choice");
		if(imsi[0].equals("member")) {
			memCtrl.execute(req,res);
		}
		//insert here
		else if(imsi[0].equals("order")) {
			orderCtrl.execute(req,res);
		}
		else if(imsi[0].equals("goods")) {
			goodCtrl.execute(req,res);
		}
	}
	
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{ //req,res을 최초로 생성하는 메소드 doget, dopost
		doService(req,res);//여기서 req,res를 전달하므로써 파라미터 객체 결합이 일어난다.
	}
	
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		doService(req,res);
		
	}
}
