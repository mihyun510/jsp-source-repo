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
		MemberController memCtrl = new MemberController();
		memCtrl.execute(req,res);
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
