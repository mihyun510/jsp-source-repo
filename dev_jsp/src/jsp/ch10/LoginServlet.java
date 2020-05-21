package jsp.ch10;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import project.restaurant.RestaurantDao;

public class LoginServlet extends HttpServlet{
	Logger logger = Logger.getLogger(LoginServlet.class);
	
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		logger.info("doGet 호출 성공");
		HttpSession session = req.getSession(); //세션을 생성
		//로그인 성공했을때 담을 이름을 담을 것이다.
		String mem_id = req.getParameter("mem_id"); 
		String mem_pw = req.getParameter("mem_pw"); 
		RestaurantDao rdao = new RestaurantDao();
		String msg = null;
		msg = rdao.login(mem_id, mem_pw);
		session.setAttribute("s_name", msg);//부분처리 갱신 하므로 페이지 이동을 하지않아도 됨
		logger.info("msg: "+ msg);
		//res.sendRedirect("mapDesign3.jsp");//현재ch10을 바라보고 있으므로 또 쓸필요는 없다.
		res.sendRedirect("mapDesign3Account.jsp");
	}
	
}
