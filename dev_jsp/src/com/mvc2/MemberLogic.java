package com.mvc2;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

public class MemberLogic {
	Logger logger = Logger.getLogger(MemberLogic.class);
	MemberDao mDao = new MemberDao();
	
	public MemberLogic() {
		// TODO Auto-generated constructor stub
	}
	
	public String login(Map<String, Object> pmap) {
		logger.info("MemberLogic의 login호출 성공, 파라메터: "+pmap.get("MEM_ID")+", "+pmap.get("MEM_PW"));
		String s_name = mDao.login(pmap);
		return s_name;
	}

	public List<Map<String, Object>> memberList(Map<String, Object> pMap) {
		logger.info("MemberLogic의 memberList호출 성공");
		List<Map<String, Object>> memList = null;
		memList = mDao.memberList(pMap);
		return memList;
	}

	public int memberAdd(Map<String, Object> pMap) {
		logger.info("MemberLogic의 memberAdd호출 성공");
		int result = mDao.memberAdd(pMap);
		return result;
	}
	
	
}
