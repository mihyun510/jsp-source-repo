package com.mvc2;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/*
 * 설계에서 추상클래스는 배제하고 인터페이스로 구현하자.
 * 인터페이스로 여러가지 구현체클래스를 경우에 맞게 인스턴스화 하기
 */
public interface Controller {
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException;
	//public ModelAndView process(String work, HttpServletRequest req, HttpServletResponse res) throws ServletException;
}
