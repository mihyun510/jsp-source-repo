package com.mvc2;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
/*
 * 단위테스트 시나리오
 * member/memberList.mvc2
 *requestURI: /member/memberList.mvc
 *contextPath:
 *command: member/memberList.mvc2
 *
 * member/memberList.jsp
 * 페이지를 찾을 수 없습니다 . 현재 만들어진 jsp가 없음
 * 
 * member/member.mvc2?  sel
 * 
 * member/member.mvc2?crud=ins
 * 
 * member/member.mvc2?crud=update
 * 
 * member/member.mvc2?crud=del
 * 
 * member/member.mvc2?crud=detail
 * 
 */
public class FrontMVC2 extends HttpServlet{
	
	Logger logger = Logger.getLogger(FrontMVC2.class);
	
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
		Controller controller = null;
		logger.info("command: "+command);
		String crud = null;
		crud= req.getParameter("crud");
		logger.info("crud===>"+crud); //입력받은 crud의 값이 담김. 
		//insert here - 인스턴스화 and process call
		try {//여기서 들어온 uri를 가공하여 업무/업무이름과 같이 넘어온 데이터 값 받아서 넘겨주기, uri에서 컨텍스트 패스를 제외한 값을 넘기는 것이고, requestURI에는 쿼리스트링 값이 담기지 않으니 따로 getparameter을 통해서 crud의 입력값을 받아서 그 값을 구현체클래스와 이어주는 mapper클래스로 넘김.
			//어떤 컨트롤러를 탈지는 폴더이름으로 결정한다. 그리고 업무이름은 요청이 들어온 페이지 이름으로 결정한다.
			controller = controllerMapper.getController(command, crud); //인터페이스하고 여러가지의 구현체클래스를 이어주는 맵퍼클래스를 생성하여 사용. 인터페이스로 선언하고 해당 경우에 따라서 적절한 구현체 클래스로 인스턴스화함.
		} catch (Exception e) {
			e.printStackTrace();
		}
		//memberController로 인스턴스화가 잘 됬는지 로그로 찍어보는 테스트용 코드 -return "forward:memberList.jsp";
		//controller객체가 MemberController의 타입임? 인스턴스임? - 확인용 코드
		if(controller instanceof MemberController) { //instanceof: 어떤 타입의 대한 instanceof 연산의 결과가 true라는 것은 검사한 타입으로 형변환이 가능하다는 것을 뜻한다. MemberComtroller가 Controller로 형변환이 가능하다.
			logger.info("MemberController 타입이면..회원관리 업무임.");
			//여기서 path는 memberController가 뱃은 페이지 이동과 이동페이지를 담음
			String path = controller.process(req, resp); //doService(HttpServletRequest req, HttpServletResponse resp) 여기서 doservice에서 받아온 req,resp를 process로 넘김 그러므로 memberController의 process는 원본의 req,resp를 가지고 있고 유지가됨.
														 //그리고 리턴 값으로 페이지이동방식과 이동페이지를 내뱃음..
			String pageMove[] = null; //이동해야되는 페이지의 정보르 담고 있고 이동하는 방법 결정
			pageMove = path.split(":"); //:로 잘라서 처음에 잘린 것으로페이지 이동방식을 결정할 것이다. => memberController가 내뱃은 페이지이동방식과 이동페이지를 :로 구분해서 내뱃엇으니 :로 잘라서 배열에 담아야 된다.
			for(int i = 0; i<pageMove.length; i++) {
				logger.info("pageMove["+i+"]: "+ pageMove[i]); //안에 배열의 값을 확인한다.
			}
			String path2 = pageMove[1];
			if(pageMove != null) {
				logger.info("pageMove != null if문 실행함."); //안에 배열의 값을 확인한다.
				//여기서 path2는 path에서 가져온 값 중에서 이동페이지를 자른 값을 담고 있음
				//여기서는 페이지이동 방법을 구별해서 그 방법으로 해당 페이지를 이동함.
				if("redirect".equals(pageMove[0])) {//페이지 이동 결정하는 구간.
					logger.info("redirect실행함."); //안에 배열의 값을 확인한다.
					resp.sendRedirect(pageMove[1]);
				}else if("forward".equals(pageMove[0])) {
					logger.info("forward실행함."); //안에 배열의 값을 확인한다.
					RequestDispatcher view = req.getRequestDispatcher(path2);
					view.forward(req, resp);
				}
			}
		}
	}
}
