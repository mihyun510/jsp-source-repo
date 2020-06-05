package com.mvc3;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;

import com.mvc2.MyBatisCommonFactory;

public class BoardMDao {
	Logger logger = Logger.getLogger(BoardLogic.class);
	SqlSessionFactory sqlMapper = null;
	SqlSession sqlSec = null;
	public BoardMDao() {
		sqlMapper = new MyBatisCommonFactory().getSqlSessionFactory();
		sqlSec = sqlMapper.openSession();
	}
	public List<Map<String, Object>> boardList(Map<String, Object> pMap) {
		//insert here
		logger.info("boardList호출성공");
		List<Map<String, Object>> bList = null;
		bList = sqlSec.selectList("boardList",pMap);
		logger.info("bList: "+bList.size());//null이면 nullpointException이 뜰것이다.
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
