package com.yc.Test;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yc.bean.Admin;
import com.yc.biz.AdminBiz;





//junit启动时，就会自动地: ApplicationContext ac=new
//ClassPathXmlApplicationContext("classpath:beans.xml");
//创建容器自动经了.
@RunWith(SpringJUnit4ClassRunner.class) // 值: SpringJUnit4ClassRunner 表示使用spring
										// junit测试 -> 区别：自动地完成 ioc,di
										// JUnit 表示使用原生的 junit测试
@ContextConfiguration({"classpath:applicationContext.xml"}) // 告诉容器, spring配置文件位置
public class AppTest {
	@Resource(name="dataSource")
	private DriverManagerDataSource dataSource;
	@Resource(name="sqlSessionFactory")
	private SqlSessionFactory sqlSessionFactory;
	@Resource(name="sqlSession")
	private SqlSessionTemplate sqlSession;
	@Resource(name="adminBizImpl")
	private AdminBiz ab;
	
	
	@Test
	public void test1() throws Exception {
		Admin a=new Admin();
		a.setAid(1);
		a.setPwd("123");
		Admin ad=ab.login(a);
		System.out.println(ad);
	}
	
	
}