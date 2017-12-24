package com.yc.bean;

public class Admin {
   
	private Integer aid;

    private String aname;

    private String pwd;

    public Integer getAid() {
        return aid;
    }

    public void setAid(Integer aid) {
        this.aid = aid;
    }

    public String getAname() {
        return aname;
    }

    public void setAname(String aname) {
        this.aname = aname == null ? null : aname.trim();
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd == null ? null : pwd.trim();
    }
    @Override
   	public String toString() {
   		return "Admin [aid=" + aid + ", aname=" + aname + ", pwd=" + pwd + "]";
   	}

	public Admin(Integer aid, String aname, String pwd) {
		super();
		this.aid = aid;
		this.aname = aname;
		this.pwd = pwd;
	}

	public Admin() {
		super();
		// TODO Auto-generated constructor stub
	}

}