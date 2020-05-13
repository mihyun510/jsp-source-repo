package orm.dao;

import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.log4j.Logger;

public class SqlMapDeptDao {
	Logger loger = Logger.getLogger(SqlMapDeptDao.class);
	SqlSessionFactory sqlMapper = null;
	String resource = "orm/mybatis/Configuration.xml";
	
	//dept에서 사용
	public List<Map<String, Object>> deptList(Map<String, Object> pmap){
		List<Map<String, Object>> dlist = null;
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			SqlSession sqlSec = sqlMapper.openSession();
			dlist = sqlSec.selectList("deptList", pmap);
			loger.info("조회수:"+dlist.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dlist;
	}
	
	public List<Map<String, Object>> deptList2(int deptno){
		List<Map<String, Object>> dlist = null;
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			SqlSession sqlSec = sqlMapper.openSession();
			dlist = sqlSec.selectList("deptList2", deptno);
			loger.info("조회수:"+dlist.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dlist;
	}
	
	public static void main(String[] args) {
		SqlMapDeptDao smd = new SqlMapDeptDao();
		smd.deptList(null);
	}
}
