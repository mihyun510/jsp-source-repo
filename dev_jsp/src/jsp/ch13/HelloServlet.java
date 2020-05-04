package jsp.ch13;

import java.io.IOException;
import java.io.PrintWriter;
import java.rmi.ServerException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet {
	@Override         //반드시 요청객체와 응답객체가 필요하다. - http프로토콜을 사용하여 서블릿에서 통신하기 위한 메소드 doGet을 사용.
	
	public void doGet(HttpServletRequest req, HttpServletResponse res)throws IOException, ServerException {
		//응답객체로 마인타입을 결정해줄수 있다.
		res.setContentType("text/html; charset=UTF-8"); 
		//사용자가 입력한 값 받아오기 <input type="text" id="mem_id" name="mem_id"> name으로 서버에서 값을 가져온다.
		//										  └> $("#mem_id").val() => id값으로는 html에서의 input값을 가져와서 사용한다.
		String mem_id = req.getParameter("mem_id");
		PrintWriter out = res.getWriter(); //API보는 법 => 리턴타입 - 소유주
		out.print(mem_id); //out에 대한 타입을 결정해야 된다.
		
		
	}
}
