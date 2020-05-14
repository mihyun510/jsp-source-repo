package jsp.dept;

import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.log4j.Logger;

public class DeptDao {
	Logger logger = Logger.getLogger(DeptDao.class);
	String resource = "orm/mybatis/Configuration.xml"; //java.io.IOException: Could not find resource orm/mybatis/Configuration5.xml 파일이름 틀리면 에러 발생
	//Connection - 연결통로 확보 - resource에서 정보를 받아온다.
	SqlSessionFactory sqlMapper = null; //마이바티스가 제공하는 맵핑을 위한 클래스 - 어풀리케이션을 실행하는 동안 종재해야된다. 자원을 사용한 후 반납을 해야하는 것이 맞다. 다시 빌드하면 다른 클래스들도 빌드가 일어나고 이 상황에서 잘 돌아가던 다른 클래스파일에서도 익셉션이 일어나 피해를 볼 수 있다. try에 걸릴수 있다
	public List<Map<String, Object>> deptList(){
		logger.info("deptList 호출 성공");
		List<Map<String, Object>> deptList = null;
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader); //프로펄타이즈는 configuration안에 넣어놈 그래서 필요가 없어요. SqlSessionFactoryBuilder()는 인스턴스화되어 사용되거 던져질 수 있다. 팩토리를 생성후 유지할 필요가 없다. 연결됬으면 끝.
			SqlSession sqlSec = sqlMapper.openSession();//세션 인증을 받아야된다. 접속하는 자원이 인증받았다는 것을..?
			logger.info("커넥션 얻기 성공==>"+sqlSec);
			deptList = sqlSec.selectList("deptList");
			logger.info("deptList.size: "+ deptList.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return deptList;
	}
	
	public static void main(String[] args) {
		DeptDao dd = new DeptDao();
		dd.deptList();
	}
}
