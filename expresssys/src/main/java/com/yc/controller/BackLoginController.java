package com.yc.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yc.bean.Admin;
import com.yc.bean.JsonModel;
import com.yc.biz.AdminBiz;

@Controller
@Scope(value="prototype")
public class BackLoginController {
	@Resource(name="adminBizImpl")
	private AdminBiz ad;
	
	@RequestMapping(value="/login.action",method=RequestMethod.POST)
	public @ResponseBody JsonModel Login(Admin admin,String code,HttpServletRequest request,HttpServletResponse resp,HttpSession session){
		//从application中取出所有tag 
		JsonModel jm=new JsonModel();
		Admin c=this.ad.login(admin);
		
		String codes=String.valueOf(session.getAttribute("rand"));
		if(!code.equals(codes)){
			jm.setCode(1);//验证码错误
		}
		else{
			try{
				jm.setCode(3);
				jm.setObj(c);	
			} catch (Exception e) {
				jm.setCode(2);
				jm.setMsg(e.getMessage());
			}
		}
		return jm;
	}


}
