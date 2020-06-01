package com.mvc3;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

public class ActionSupport extends HttpServlet{
	
	Logger logger = Logger.getLogger(ActionSupport.class);
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		logger.info("FrontMVC2 doGet호출 성공");
		doService(req,resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		logger.info("FrontMVC2 doPost호출 성공");
		doService(req,resp);
		
	}
	
	public void doService(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		logger.info("doService 호출성공");
		//insert here
		// ==> dev_jsp/member/memberList.mvc2
		String requestURI = req.getRequestURI(); //URI를 얻어온다. contextpath/요청페이지이름 = requesturi 쿼리스트링 부분은 나오지 않음.
		logger.info("requestURI: "+requestURI);
		// ==> dev_jsp
		String contextPath = req.getContextPath();//컨텍스트패스을 얻어온다. - 프로젝트 이름이 컨텍스트 패스이름 느낌
		// ==> /member/memberList.mvc2
		logger.info("contextPath: "+contextPath);
		// ==> member/memberList.mvc2, 여기서는 컨택스트 패스를 자르기 위해서 한 코드, +1를 한 이유는 /도 자르기 위해서임.
		String command = requestURI.substring(contextPath.length()+1); //?뒤에 명령어만 얻기 위해서 자르기
		logger.info("before command: "+command);//member/member.mvc3
		
		//crud을 사용하지 않고 명령어 요청받자. 즉, memberList.jsp을 활용한다. 페이지의 이름을 업무이름으로 사용한다.
		int end = command.lastIndexOf("."); //member/memberList.jsp에서 .jsp를 자른다.
		String requestName = null;
		requestName = command.substring(0, end); //member/memberList 만 남음
		Controller2020 controller = null;
		logger.info("after rcommand: "+requestName);
		logger.info("after command: "+command);
//		crud대신 페이지 이름으로 업무이름으로 사용한다.
//		String crud = null;
//		crud= req.getParameter("crud");
//		logger.info("crud===>"+crud); //입력받은 crud의 값이 담김. 
		//insert here - 인스턴스화 and process call
		try {//여기서 들어온 uri를 가공하여 업무/업무이름과 같이 넘어온 데이터 값 받아서 넘겨주기, uri에서 컨텍스트 패스를 제외한 값을 넘기는 것이고, requestURI에는 쿼리스트링 값이 담기지 않으니 따로 getparameter을 통해서 crud의 입력값을 받아서 그 값을 구현체클래스와 이어주는 mapper클래스로 넘김.
			//어떤 컨트롤러를 탈지는 폴더이름으로 결정한다. 그리고 업무이름은 요청이 들어온 페이지 이름으로 결정한다.
//			controller = controllerMapper3.getController(command, crud); //인터페이스하고 여러가지의 구현체클래스를 이어주는 맵퍼클래스를 생성하여 사용. 인터페이스로 선언하고 해당 경우에 따라서 적절한 구현체 클래스로 인스턴스화함.
														//┌>여기서 command를 넘기는게 맞아? 내 생각엔 requestName을 넘기는 게 아니라 .jsp를 자른 requestName을 넘겨야 된다고 생각한다.
			controller = controllerMapper3.getController(command); //인터페이스하고 여러가지의 구현체클래스를 이어주는 맵퍼클래스를 생성하여 사용. 인터페이스로 선언하고 해당 경우에 따라서 적절한 구현체 클래스로 인스턴스화함.
		} catch (Exception e) {
			e.printStackTrace();
		}
		//시점문제 조심하기 잘못하면 NullPointException 발생할 수 있다. 
		//값을 꺼내는 시점에서 Null인지을 확인하기
		if(controller!=null) {
			String pageMove[] = null;
			try {
				//여기서 process는 ModelAndView 여기로 가는 것임
				Object robj = controller.process(requestName, req, resp);
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
}
