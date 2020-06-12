package com.mvc3;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import oracle.net.aso.s;
//트렌젝션 처리 로직에서 처리
public class BoardLogic {
	Logger logger = Logger.getLogger(BoardLogic.class);
	BoardMDao bmDao = null;
	BoardSDao bsDao = null;
	
	public BoardLogic() {
		bmDao = new BoardMDao();
		bsDao = new BoardSDao();
	}
	public List<Map<String, Object>> boardList(Map<String, Object> pMap) {
		logger.info("boardList호출");
		List<Map<String, Object>> bList = new ArrayList<Map<String,Object>>();
		bList = bmDao.boardList(pMap);
		return bList;
	}
	public List<Map<String, Object>> proc_boardList(Map<String, Object> pMap) {
		logger.info("proc_boardList호출");
		List<Map<String, Object>> bList = null;
		bList = bmDao.proc_boardList(pMap);
		logger.info("bList==>"+bList.size());
		return bList;
	}
	
	//난이도 상
	//트랜잭션처리에 대한 부분 - 프로시저로 해보면 좋겠다. -금융,보험,물류,회계
	//첨부파일 처리
	//위젯 API 구현해본다. - 스타트업, 1인기업, 소규모
	//공통코드 작성 - PL - 공통팀, 형상관리팀, 품질관리팀, 개발팀, 관리팀
	//
	public int boardINS(Map<String, Object> pMap) {
		logger.info("boardINS호출");
		int result = 0;
		int bm_group = 0;
		int bm_no = 0;
		bm_no = bmDao.getBmNo(pMap); //새로운 그룹번호를 생성해서 가져옴.
		//pMap.put("bm_no", bm_no);//새로운 글 번호 넣어주기
		//그룹번호가 있나요?
		//어디서 오셨죠? list.jsp이면 없다(새글), read.jsp 이면 있다.(댓글)
		bm_group = bmDao.getBmGroup(pMap); //새로운 그룹번호를 생성해서 가져옴.
		//예외처리 추가할것 - io사용시 꼭 필요 - 첨부파일
		int pbm_no = 0;
		if(pMap.get("bm_no")!=null) {
			pbm_no = Integer.parseInt(pMap.get("bm_no").toString());
		}
		try {
			//새글인가?
			//키가 없으면 새글
			//위에서 이미 bm_no을 넣었기 때문에 절대 이 if문 안으로 들어가지 않음 새글이든 댓글이든 무조건 새로 번호를 채번해야됨. 그래서 만약 if문안에 넣으면 else에서는 또 글번호가 채번되지 않음. 글번호는 새글이든 댓글이든 채번이 되어야된다.
			//if(!pMap.containsKey("bm_no")) {//containsKey: 키가 존재하는 체크
			if(pbm_no == 0) {//containsKey: 키가 존재하는 체크
				//새글이면 그룹번호를 새로 채번해야 됩니다.
				logger.info("새글인가? ==> "+pMap.get("bm_group")); //마이바티스는 대문자, 그냥 키값은 소문자임. 즉, 마이바티스를 갔다가 리턴받은 맵의 키는 대문자고 마이바티스를 갔다오기전의 맵의 키는 소문자임.
				pMap.put("bm_no",bm_no);
				pMap.put("bm_group", bm_group);//새로운 그룹번호를 넣어줌. 새글 쓰기 인경우이니 여기 올바른 위치
				pMap.put("bm_pos", 0);
				pMap.put("bm_step", 0);
			}
			//아님 댓글이야? 
			else {//키가 있으면 댓글
				logger.info("댓글인가? ==> "+pMap.get("bm_group"));
				bmDao.bmStepUpdate(pMap);
				if(pMap.get("bm_pos")!=null) {
					pMap.put("bm_pos"
							,Integer.parseInt(pMap.get("bm_pos").toString())+1);//+1를 해주는 이유는 최신글을 위로 올려준다.
				}
				if(pMap.get("bm_step")!=null) {
					pMap.put("bm_step"
							,Integer.parseInt(pMap.get("bm_step").toString())+1);
				}
			}
			//첨부파일이 있을까요? - bs_file
			if(pMap.get("bs_file")!=null) {
				logger.info("첨부파일이 있는 경우");
				int sresult = 0;
				sresult = bsDao.boardSINS(pMap);//첨부파일이 없을때는 
			}
			//데이터 유효성 체크 코드 추가
			//크루는 PL로 부터 소스를 받으면 제일 먼저 단위테스트를 수행
			//주의사항:테이블 컬럼을 사용자로 부터 입력받는 값과 개발자끼리만 공유하는 값
			logger.info("bs_file ==> "+pMap.get("bs_file"));
			logger.info("bs_size ==> "+pMap.get("bs_size"));
			logger.info("bm_no ==> "+pMap.get("bm_no"));
			logger.info("bm_group ==> "+pMap.get("bm_group"));//여기서 배달사고가 난것입니다. 댓글인 경우 새로운 그룹번호가 아닌 자신이 상세조회한 그룹번호를 가지고 와야됨.
			logger.info("bm_pos ==> "+pMap.get("bm_pos"));//여기서 배달사고가 난것입니다. 댓글인 경우 새로운 그룹번호가 아닌 자신이 상세조회한 그룹번호를 가지고 와야됨.
			logger.info("bm_step ==> "+pMap.get("bm_step"));//여기서 배달사고가 난것입니다. 댓글인 경우 새로운 그룹번호가 아닌 자신이 상세조회한 그룹번호를 가지고 와야됨.
			logger.info("bm_title ==> "+pMap.get("bm_title"));
			logger.info("bm_content ==> "+pMap.get("bm_content"));
			logger.info("bm_email ==> "+pMap.get("bm_email"));
			logger.info("bm_pw ==> "+pMap.get("bm_pw"));
			logger.info("bm_writer ==> "+pMap.get("bm_writer"));
			
			pMap.put("bm_no", bm_no);//새로운 글 번호 넣어주기
			result = bmDao.boardMINS(pMap);//여기서 다오를 갔다온다.
			//첨부파일이 있을때만 bsDao.boardSINS(pMap);
		} catch (Exception e) {
			//라인번호도 출력됨. -log4j
			e.printStackTrace();//stack메모리에 쌓여있는 로그 히스토리를 출력
		}
		return result;
	}

	public int boardUPD(Map<String, Object> pMap) {
		logger.info("boardUPD호출");
		int result = 0;
		result = bmDao.boardUPD(pMap);
		return result;
	}

	public int boardDEL(Map<String, Object> pMap) {
		logger.info("boardDEL호출"+pMap.get("bm_no"));
		int result = 0;
		result = bmDao.boardDEL(pMap);
		return result;
	}
}
