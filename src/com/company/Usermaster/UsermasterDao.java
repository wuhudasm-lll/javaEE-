package com.company.Usermaster;

import java.sql.SQLException;

public interface UsermasterDao {
    public boolean saveuser(String username,String password);
    public boolean deluser(String username) throws SQLException;
    public boolean updateuser(String username,String password,String username1) throws SQLException;
}
