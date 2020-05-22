package com.mvc2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

public class FrontMVC2 extends HttpServlet{
	
	Logger logger = Logger.getLogger(FrontMVC2.class);
	MemberController mc = new MemberController();
	
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
		String requestURI = req.getRequestURI(); //URI를 얻어온다.
		logger.info("requestURI: "+requestURI);
		String contextPath = req.getContextPath();//컨텍스트패스을 얻어온다.
		logger.info("contextPath: "+contextPath);
		String command = requestURI.substring(contextPath.length()+1); //?뒤에 명령어만 얻기 위해서 자르기
		logger.info("command: "+command);
		Controller controller = null;
		//insert here - 인스턴스화 and process call
		if("회원관리".equals(command)) {
			mc.process(req, resp);
		}
	}
}
