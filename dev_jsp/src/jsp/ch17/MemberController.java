package jsp.ch17;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

public class MemberController {
	Logger logger = Logger.getLogger(MemberController.class);
	MemberDao mDao = new MemberDao(); //클래스 사이의 결합도가 높은 코드, 의존성 객체 주입적으로 생성한 코드가 결합도가 낮다.
	//서블릿을 상속받지 않았지만 req, res를 가지게 되었고 사용할 수 있게 되었다.
	public void execute(HttpServletRequest req, HttpServletResponse res) {
		logger.info("execute 호출");
		//너 회원가입 할거야?
		if(1==1) {
			
		}
		//너 회원조회 할거야?
		else if(1==1) {
			
		}
		//너 회원탈퇴 할거야?
		else if(1==1) {
			
		}
		//너 이사갔다며...? 뭔소리..?
		else if(1==1) {
			
		}
	}

}
