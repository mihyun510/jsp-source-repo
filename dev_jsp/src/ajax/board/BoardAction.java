package ajax.board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

public class BoardAction extends HttpServlet{
	Logger logger = Logger.getLogger(BoardAction.class);
	
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		logger.info("doGet호출성공");
		String mem_id = getInitParameter("mem_id"); //xml에 미리 맵핑해놓은 값을 가져다가 사용
		logger.info("mem_id: "+ mem_id);
		ServletContext ctx = this.getServletContext(); //xml에 <context-param>에 맵핑해놓은 값을 가져온다.
		String driver = ctx.getInitParameter("driver");
		logger.info("driver: "+ driver);
//		String user = ctx.getInitParameter("user");
//		logger.info("user: "+ user);
		res.setContentType("text/html; charset=UTF-8"); //한글처리하기
		PrintWriter out = res.getWriter(); //p500참고
		out.print("서블릿에서 전송한 정보");
	}
	
}
