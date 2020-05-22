package com.mvc2;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

public class MemberController implements Controller{
	Logger logger = Logger.getLogger(MemberController.class);
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException {
		logger.info("MemberController의 process호출 성공");
		return null;
	}
}
