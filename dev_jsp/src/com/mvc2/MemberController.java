package com.mvc2;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
/*
 *  처음에 mapper에서 controller을 잘 매핑했다면 그 Controller에서 
 * 적절한 로직으로 처리해주어야된다.
 * Controller 인터페이스의 구현체 클래스
 */
public class MemberController implements Controller{
	Logger logger = Logger.getLogger(MemberController.class);
	String crud = null;
	public MemberController(String crud) {
		this.crud = crud;
	}
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException {
		//페이지이동을 위해서 응답처리방식을 구현해서 처리해보자.
		logger.info("MemberController의 process호출 성공");
		//업무가 여러가지로 나눠질 수 있음
		//어떤 로직을 탈것인가...
		if("login".equals(crud)) { //여기서 crud는 ControllerMapper에서 memberController로 생성해줄때 FrontMVC2에서 controllerMapper에 getController를 호출할때 commend와 crud를 넘겼고 거기서 생성자로 MemberController에 crud를 넘김
			
		}else if("memberInsert".equals(crud)) {
			
		}
		//select건이면 당연히  forward입니다. - 여기서 페이지 이동과 이동한 페이지를 결정한다.
		return "forward:memberList.jsp";//:로 자를 것이니 값을 두개로 전달받은 것이나 다름없는것이다. 페이지 이동 방식과 이동한 페이지 경로(이름)
	}
}
