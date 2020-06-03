package com.mvc3;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

public class BoardMDao {
	Logger logger = Logger.getLogger(BoardLogic.class);
	public List<Map<String, Object>> boardList(Map<String, Object> pMap) {
		//insert here
		logger.info("boardList호출성공");
		return null;
	}

	public int boardMINS(Map<String, Object> pMap) {
		//insert here
		logger.info("boardMINS호출성공");
		return 0;
	}

	public int boardUPD(Map<String, Object> pMap) {
		//insert here
		logger.info("boardUPD호출성공");
		return 0;
	}

	public int boardDEL(Map<String, Object> pMap) {
		//insert here
		logger.info("boardDEL호출성공");
		return 0;
	}

}
