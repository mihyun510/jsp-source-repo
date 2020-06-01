package com.mvc3;
/*
 * 기존의 String과 다른점은 무엇인가
 * 1단계: 리턴타입은 void였다.
 * 2단계: 리턴타입을 String으로 바꾸어서 redirect와 forward를 분기
 * 3단계: 리턴타입을 ModelAndView로 바꾸어서 유지 내용에 대한 부분까지도 포함시켜본다.(request scope에 반영 필요)
 * 사용자 정의 클래스인 MOdelAndView의 scope를 request로 설계해 본다. - 유지
 * 화면에 대한 이름(결정)도 추가할 수 있도록 지원해 본다. - 화면처리
 * 
 * 내가 설계한 pojo 프레임 워크는 req와 res의 의존적이다|아니다
 * └> 
 */

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ModelAndView {
	
	//변수 선언
	HttpServletRequest req = null;
	HttpServletResponse res = null;
	private String viewName = null;
	
	//생성자 - 디폴트 생성자와 파라미터 생성자의 차이점에 대해 말할 수 있고
	//		  활용할 수 있다. (pojo framework에 반영해 보기)
	public ModelAndView() {}
	public ModelAndView(HttpServletRequest req, HttpServletResponse res) {
		this.req = req;
		this.res = res;
	}
	
	//web-inf밑의 jsp을 접근하기 위한 방법
	//member/memberList.jsp.jsp 이런일 이 일어나면 안되요 
	//응답을 담당함 - pageMove배열에 담길 내용을 가진다.
	public void setViewName(String viewName) {
		this.viewName = viewName; //web-inf 밑에 존재하는 jsp 파일명 확장자는 들어있으면 안됨. forward forward는 피해갈 수 있다.
		//값을 정하는 아이..
		//this.viewName = req.getContextPath()+"/WEB-INF/view/"+viewName+".jsp";
	}
	public String getViewName() {
		return viewName;
	}
	
	public void addObject(String name, Object obj) {
		req.setAttribute(name, obj); //값을 담는다 뭔 값을 담냐 .. ?
	}
	
}
