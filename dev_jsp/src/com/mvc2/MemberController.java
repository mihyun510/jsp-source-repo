package com.mvc2;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

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
		
		//select건이면 당연히  forward입니다. 
		return "forward:memberList.jsp";//:로 자를 것이니 값을 두개로 전달받은 것이나 다름없는것이다. 페이지 이동 방식과 이동한 페이지 경로(이름)
	}
}
