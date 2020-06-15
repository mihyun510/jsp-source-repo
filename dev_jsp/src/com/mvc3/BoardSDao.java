package com.mvc3;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;

import com.mvc2.MyBatisCommonFactory;

public class BoardSDao {
	Logger logger = Logger.getLogger(BoardSDao.class);
	SqlSessionFactory sqlMapper = null;
	SqlSession sqlSec = null;
	
	public BoardSDao() {
		sqlMapper = new MyBatisCommonFactory().getSqlSessionFactory();
		sqlSec = sqlMapper.openSession();
	}
	
	public int boardSINS(Map<String, Object> pMap) {
		//insert here
		logger.info("boardSINS호출성공");
		int result = 0;
		//bm_no, bs_seq - 상수, bs_file - 화면 , bs_size - 로직
		result = sqlSec.insert("boardSINS",pMap);
		logger.info("result: "+result);
		sqlSec.commit(true);
		return result;
	}
}
