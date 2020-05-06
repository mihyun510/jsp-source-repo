package jsp.ch17;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

//xml 맵핑하기 대신 @로 매핑하기			┌>여기의 이름과 xml의 메핑 url패턴 이름이 같으면 오류가 난다. <url-pattern>/ch17/shopping2.do</url-pattern> 이와같이 달라야됨.
@WebServlet(urlPatterns = "/ch17/shopping.do") //이것은 안먹은 것인가? url이 shopping2.do가 나오는 것으로 보아 xml로 매핑한 것으로 이 서블릿 클래스를 찾아오는 것같은데 그럼 @이것으로 매핑한 것은 의미가 없어지는 것인가?
public class FrontServlet extends HttpServlet{
	Logger logger = Logger.getLogger(FrontServlet.class);
	public void doService(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		//사용자의 어떤 요청을 파라미터로 받기 ex.쿼리스트링 사용하여 받기
		//url pattern -> shopping.do?mode=order ---> shopping.do 자바에서 controller느낌인건가..?
		String mode = req.getParameter("mode"); 
		//주문관리인지?
		if("order".equals(mode)) {
			System.out.println("주문관리");
			logger.info("주문관리");
			res.sendRedirect("./orderList.jsp"); //새로운 페이지로 이동가능 -> url이 변경되는 것임. 이것은 src 안에 있고 orderList.jsp는 webcontent아래 있는 ./이런식으로 접근이 가능한 이유는 같은 ch17폴더안에 위치시켰기 때문임.
		}
		//회원관리 인지?
		else if("member".equals(mode)) {
			System.out.println("회원관리");
			logger.info("회원관리");
		}
	}
	
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		doService(req,res);
	}
	
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		doService(req,res);
		
	}
}
