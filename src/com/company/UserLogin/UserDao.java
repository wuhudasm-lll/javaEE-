package com.company.UserLogin;

import java.sql.SQLException;

public interface UserDao {
	//定义两个待解决的方法
	public boolean save(User user);
	public boolean checkLogin(String username, String password);
	public boolean reback(String username, String password) throws SQLException;
	public boolean checkLogin1(String username, String password);
	public boolean checkName(String username);
}
