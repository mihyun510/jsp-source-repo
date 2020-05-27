package com.mvc2;

import org.apache.log4j.Logger;
/*
 * Controller와 Controller의 구현체 클래스 사이에서 연결을 해주는 클래스
 * FrontMVC2에서 받은 URI와 crud를 가지고 CRI의 값은 배열에 각각의 방에 담고
 * 그 방에 담은 것을 가지고 업무와 업무이름을 나누어 사용한다.
 * 그리고 crud는 해당 업무 구현체클래스의 생성자를 통해서 전달한다.
 * 
 * 여기서 FrontMVC2에서 가공한 URL를 가지고 업무이름에 해당하는 Controller를 여기서 인스턴스화 해준다. 그리고 생성할때 FrontMVC2에서 얻은 crud를 넘기며 생성한다.
 */
public class controllerMapper {
	//controller인터페이스의 구현체 클래스와 Controller와 연결하기위한 클래스이다. 그리고 그것을 이어줄 메소드 ? 모두가 사용할 것이다. static으로 선언했으니 클래스로 메소드 접근가능
	public static Controller getController(String command, String crud) {//crud: 삭제, 수정, 입력, 조회를 나누자. 
		Logger logger = Logger.getLogger(controllerMapper.class);
		logger.info("command: "+command+", crud:"+crud);
		Controller controller =null;
//		Controller controller = new Controller() 는 인터페이스라서 불가능
		String commands[] = command.split("/"); //가저온 명령을 자르자. 배열안에 url속의 업무와 업무이름을 나누자.
		for (String str: commands) { //commands배열안에는 업무와 업무이름이 담겨있음. 컨텍스트 패스는 잘린 uri값이 담기는 것이다.
			logger.info("str: "+str);
		}
		if(commands.length==2) {
			String work = commands[0]; //첫번째방은 업무 이름
			String requestName = commands[1]; //두번째 방은 요청이름 - 필요가 없음,., 메소드이름과 똑같이 매칭이 불가능 @이 클래스에만 제공? 스프링에선 가능.,.
			if("member".equals(work)) {
				//생성자를 통해서 crud의 값을 넘김.			┌>컨트롤러에 전달.
				controller = new MemberController(crud); // 해당 업무가 member이면 그에 맞는 구현제클래스로 인스턴스화 해줌
			}
		}
		return controller;
	}//end of Controller
}
