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

public class MemberDao {

	Logger logger = Logger.getLogger(MemberDao.class);
	String resource = "orm/mybatis/Configuration.xml";
	SqlSessionFactory sqlMapper = null;
	public MemberDao() {
		//마이바티스와 연동을 위해서 sqlSessionFactory를 거쳐서 sqlSession를 거쳐야 마이바티스가 연동이 된다.
		sqlMapper = new MyBatisCommonFactory().getSqlSessionFactory(); //마이바티스 공통코드 사용
	}
	public String login(Map<String, Object> pMap) {
		logger.info("MemberDao의 login호출 성공, 파라메터: "+pMap.get("MEM_ID")+", "+pMap.get("MEM_PW"));
		String s_name = null;
		try {
			//Reader reader = Resources.getResourceAsReader(resource);
			//sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			SqlSession sqlSec = sqlMapper.openSession();
			s_name  = sqlSec.selectOne("login",pMap);
			logger.info("조회된 이름:"+s_name);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return s_name;
	}
	//회원 조회 메소드 
	public List<Map<String, Object>> memberList(Map<String, Object> pMap) {
		logger.info("MemberDao의 memberList호출 성공");
		List<Map<String, Object>> memList = null;
		try {
			//Reader reader = Resources.getResourceAsReader(resource);
			//sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			SqlSession sqlSec = sqlMapper.openSession();
			memList  = sqlSec.selectList("memberList", pMap); //memberListEX의 결과를 가져올 mapper id는 memberListEX
			logger.info("조회된 결과 크기:"+memList.size());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return memList;
	}
	public int memberAdd(Map<String, Object> pMap) {
			logger.info("MemberDao의 memberAdd호출 성공");
			int result = 0;
			try {
				//Reader reader = Resources.getResourceAsReader(resource);
				//sqlMapper = new SqlSessionFactoryBuilder().build(reader);
				SqlSession sqlSec = sqlMapper.openSession();
				result  = sqlSec.insert("memberAdd", pMap); //memberListEX의 결과를 가져올 mapper id는 memberListEX
				logger.info("인서트된 결과:"+result);
				sqlSec.commit();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		return result;
	}
}
