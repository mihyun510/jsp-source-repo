package com.mvc3;

import java.io.FileNotFoundException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
//마이바티스 연동 코드의 반복을 줄이기 위해서 만든 클래스
public class MyBatisCommonFactory {
	public static SqlSessionFactory sqlSessionFactory = null;
	public void init() {
		try {
			String resource = "orm/mybatis/Configuration.xml";
			Reader reader = Resources.getResourceAsReader(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader, "development"); //오라클의 정보를 담고 있다. development/ <environment id="development"> configulation에서 확인할 수 있음.
			
		} catch (FileNotFoundException fe) {
			System.out.println(fe.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public SqlSessionFactory getSqlSessionFactory() {
		init();
		return sqlSessionFactory;
	}
}
