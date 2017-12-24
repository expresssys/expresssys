package com.yc.biz.Impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yc.bean.Admin;
import com.yc.biz.AdminBiz;
import com.yc.dao.AdminDao;

@Service
@Transactional
public class AdminBizImpl implements AdminBiz {
	private AdminDao adminDao;
	
	@Resource(name="adminDaoImpl")
	public void setAdminDao(AdminDao adminDao) {
		this.adminDao = adminDao;
	}


	@Override
	public Admin login(Admin admin) {
		
		return this.adminDao.login(admin);
	}

}
