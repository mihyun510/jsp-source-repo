package com.mvc3;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

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

	public int boardINS(Map<String, Object> pMap) {
		logger.info("boardINS호출");
		int result = 0;
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
