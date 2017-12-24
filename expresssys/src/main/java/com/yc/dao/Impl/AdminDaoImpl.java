package com.yc.dao.Impl;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.yc.bean.Admin;
import com.yc.dao.AdminDao;

@Repository
public class AdminDaoImpl implements AdminDao {

	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public Admin login(Admin admin) {
		return this.sqlSession.selectOne("com.yc.bean.AdminMapper.Login",admin);
	}

}
