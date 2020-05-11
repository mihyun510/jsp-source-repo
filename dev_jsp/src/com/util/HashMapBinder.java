package com.util;

import java.util.Enumeration;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public class HashMapBinder {
	//공통코드를 줄여보자. 책 p76~p77 코드를 model2방식으로 작성해보기.
	//요청 객체는 사용자가 요청했을때 요청을 받아주는 서블릿에서 주소번지를 받아오야 한다. 그래야 그 사람에 대한 요청 정보를 확인할 수 있는 것이다.
	//이 말을 이해하고 설명할 있는지 확인해 볼것. -이유:왜냐하면 그 주소번지를 받아와야지 나중에 다른 사람이 들어와서 객체를 다시 생성했을때 그 전에 들어온 사람의 객체가 유지되어 확인이 가능한가? 그리고 그 주소번지의 세션이나 요청을 받을 수 있다?  
	HttpServletRequest req = null; //req요청 객체를 외부에서 받아오기 위해서 
	public HashMapBinder() {}
	public HashMapBinder(HttpServletRequest req) { //생성자로 req요청 객체를 받아오기
		this.req = req;
	}
	public void binder(Map<String, Object> pMap) { //이 함수의 기능은 pMap안에 기존에 있던 키와 값들을 모두 지우고 다시 새롭게 요청받은 값으로 채우는 함수
		//기존에 들어 있던 값이 있다면 모두 비운다.
		pMap.clear();
		Enumeration<String> en = req.getParameterNames(); //요청받은 name값을 목록으로 받아온다. 20번의 req와 24의 req가 같은 객체이므로 요청이 유지된다.
		//enumeration에 값이 들어있는지 체크해 줌
		while(en.hasMoreElements()) { //name값이 존재하는지 확인
			String key = en.nextElement();//name, address, pet 키값을 가져다가
			//				┌>한글처리를 위한 클래스를 직접 만들어서 사용한 코드.
			pMap.put(key, HangulConversion.toUTF(req.getParameter(key))); //키값에 해당하는 요청받은 name값에 해당하는 요청값을 받아온다. 반복된 코드 줄임.
		}
	}
}
