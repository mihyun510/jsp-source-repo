package jsp.ch17;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

//xml 맵핑하기 대신 @로 매핑하기			┌>여기의 이름과 xml의 메핑 url패턴 이름이 같으면 오류가 난다. <url-pattern>/ch17/shopping2.do</url-pattern> 이와같이 달라야됨.
@WebServlet(urlPatterns = "/ch17/order.nhn") //이것은 안먹은 것인가? url이 shopping2.do가 나오는 것으로 보아 xml로 매핑한 것으로 이 서블릿 클래스를 찾아오는 것같은데 그럼 @이것으로 매핑한 것은 의미가 없어지는 것인가?
public class OrderServlet extends HttpServlet{
	Logger logger = Logger.getLogger(OrderServlet.class);
	ServletConfig config = null;
	public void init(ServletConfig config) throws ServletException{
		//init메소드는 실행하면 자동으로 실행하는 콜백메소드?? 서블릿 생명주기의 생서하는 메소드로 처음에 한번은 꼭 실행되는 메소드..?
		//초기화하는 메소드로 서버가 구동될때 자동으로 실행됨.
		logger.info("init 호출 성공");
		this.config = config;
		this.init();
	}
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		logger.info("doGet 호출성공");//한글처리가 되어있음
		String mem_name = req.getParameter("mem_name");
		logger.info("입력한 사람은 "+mem_name);
		//res.sendRedirect(""); //값이 유지가 안된다.
		//RequestDispatcher view = req.getRequestDispatcher("");
		List<Map<String, Object>> olist = new ArrayList<>();
		Map<String, Object> rmap = new HashMap<String, Object>();
		rmap.put("deptno", 10);
		rmap.put("dname", "총무");
		rmap.put("loc", "인천");
		olist.add(rmap);
		req.setAttribute("olist", olist);
		RequestDispatcher view = req.getRequestDispatcher("./orderList.jsp"); //java와 servlet과 만나는 부분을 알아보기
		view.forward(req, res); //값이 유지가 된다.
	}
	
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		logger.info("doPost 호출성공"); //한글처리가 안되어있음
		String mem_name = req.getParameter("mem_name");
		logger.info("입력한 사람은 "+mem_name);
	}
}
