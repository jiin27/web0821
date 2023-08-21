package org.sp.mybatisApp.mybatis;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

//xml 설정파일을 읽어들여, SqlSessionFactory를 보유할 객체
//이 객체의 인스턴스는 여러 개일 필요가 없으므로, 싱글턴패턴으로 정의하자
public class MybatisConfig {
	private static MybatisConfig instance;
	SqlSessionFactory sqlSessionFactory;
	
	//생성자를 막았으므로, 누군가가 이객체의 자료형을 new하지 않고도 가져갈 수 있도록
	//getter를 제공해주자
	private MybatisConfig() {
		String resource = "org/sp/mybatisApp/mybatis/config.xml";
		
		try {
			InputStream inputStream = Resources.getResourceAsStream(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static MybatisConfig getInstance() {
		if(instance==null) {
			instance = new MybatisConfig();
		}
		return instance;
	}
	
	//팩토리로부터 SqlSession을 얻어갈 수 있는 메서드
	public SqlSession getSqlSession() {
		SqlSession sqlSession=null;
		sqlSession = sqlSessionFactory.openSession();
		return sqlSession;
	}
	
	
	//SqlSession 사용 후 닫는 메서드
	public void release(SqlSession sqlSession) {
		sqlSession.close();
	}

}
