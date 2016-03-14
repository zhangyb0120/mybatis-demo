package com.zyb.entity;

import java.io.Serializable;

public class User implements Serializable
{
    private static final long serialVersionUID = 1L;
    
    private int id;
    
    private String username;
    
    private String realname;
    
    private String password;
    
    private String mobileNumber;
    
    private String smsCode;
    
    private int locked;
    
    private String createTime;
    
    public int getId()
    {
        return id;
    }
    
    public void setId(int id)
    {
        this.id = id;
    }
    
    public String getUsername()
    {
        return username;
    }
    
    public void setUsername(String username)
    {
        this.username = username;
    }
    
    public String getRealname()
    {
        return realname;
    }
    
    public void setRealname(String realname)
    {
        this.realname = realname;
    }
    
    public String getPassword()
    {
        return password;
    }
    
    public void setPassword(String password)
    {
        this.password = password;
    }
    
    public String getMobileNumber()
    {
        return mobileNumber;
    }
    
    public void setMobileNumber(String mobileNumber)
    {
        this.mobileNumber = mobileNumber;
    }
    
    public String getSmsCode()
    {
        return smsCode;
    }
    
    public void setSmsCode(String smsCode)
    {
        this.smsCode = smsCode;
    }
    
    public int getLocked()
    {
        return locked;
    }
    
    public void setLocked(int locked)
    {
        this.locked = locked;
    }
    
    public String getCreateTime()
    {
        return createTime;
    }
    
    public void setCreateTime(String createTime)
    {
        this.createTime = createTime;
    }
}
