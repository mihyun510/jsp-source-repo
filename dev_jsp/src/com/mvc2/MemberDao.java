package com.mvc2;

import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.log4j.Logger;

import jsp.ch17.A;

public class MemberDao {

	Logger logger = Logger.getLogger(MemberDao.class);
	SqlSessionFactory sqlMapper = null;
	String resource = "orm/mybatis/Configuration.xml";
	public String login(Map<String, Object> pMap) {
		logger.info("MemberDao의 login호출 성공, 파라메터: "+pMap.get("MEM_ID")+", "+pMap.get("MEM_PW"));
		String s_name = null;
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			SqlSession sqlSec = sqlMapper.openSession();
			s_name  = sqlSec.selectOne("login",pMap);
			logger.info("조회된 이름:"+s_name);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return s_name;
	}
	//회원 조회 메소드 
	public List<Map<String, Object>> memberList() {
		logger.info("MemberDao의 memberList호출 성공");
		List<Map<String, Object>> memList = null;
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			SqlSession sqlSec = sqlMapper.openSession();
			memList  = sqlSec.selectList("memberList");
			logger.info("조회된 결과 크기:"+memList.size());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return memList;
	}
}
