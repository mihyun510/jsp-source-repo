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
	//글번호 채번하기
	public int getBmNo(Map<String, Object> pMap) {
		//insert here
		logger.info("getBmGroup호출성공");
		int bm_no = 0;
		bm_no = sqlSec.selectOne("getBmNo",pMap);
		logger.info("bm_no: "+bm_no);
		return bm_no;
	}
	//그룹번호 채번하기
	public int getBmGroup(Map<String, Object> pMap) {
		//insert here
		logger.info("getBmGroup호출성공");
		int bm_group = 0;
		bm_group = sqlSec.selectOne("getBmGroup",pMap);
		logger.info("bm_group: "+bm_group);
		return bm_group;
	}

	public int boardMINS(Map<String, Object> pMap) {
		//insert here
		logger.info("boardMINS호출성공");
		int result = 0;
		result = sqlSec.insert("boardMINS",pMap);
		return result;
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
