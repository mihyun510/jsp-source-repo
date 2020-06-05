package com.mvc3;

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
		List<Map<String, Object>> bList = null;
		bList = bmDao.boardList(pMap);
		return null;
	}
	
	//난이도 상
	public int boardINS(Map<String, Object> pMap) {
		logger.info("boardINS호출");
		int result = 0;
		//새글인가?
		//키가 없으면 새글
		if(!pMap.containsKey("bm_no")) {//containsKey: 키가 존재하는 체크
			//새글이면 그룹번호를 새로 채번해야 됩니다.
			
			pMap.put("bm_pos", 0);
			pMap.put("bm_step", 0);
		}
		//아님 댓글이야? 
		else {//키가 있으면 댓글
			if(pMap.get("bm_pos")!=null) {
				pMap.put("bm_pos"
						,Integer.parseInt(pMap.get("bm_pos").toString())+1);
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
		result = bmDao.boardMINS(pMap);
		//첨부파일이 있을때만 bsDao.boardSINS(pMap);
		return result;
	}

	public int boardUPD(Map<String, Object> pMap) {
		logger.info("boardUPD호출");
		int result = 0;
		result = bmDao.boardUPD(pMap);
		return result;
	}

	public int boardDEL(Map<String, Object> pMap) {
		logger.info("boardDEL호출");
		int result = 0;
		result = bmDao.boardDEL(pMap);
		return result;
	}
}
