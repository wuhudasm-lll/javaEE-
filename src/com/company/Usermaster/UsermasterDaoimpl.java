package com.company.Usermaster;

import com.company.Mysql.DButil;
import com.mysql.jdbc.PreparedStatement;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class UsermasterDaoimpl implements UsermasterDao{
    @Override
    public boolean saveuser(String username, String password) {
        boolean flag = false;
        Connection conn = null;
        PreparedStatement pst = null;

        /*
        创建连接Connection对象和Statement对象
        调用插入数据到数据库的方法
        */
        conn = DButil.getConnection();
        String sql = "insert into user (username, password) values(?,?)";
        try {
            pst = (PreparedStatement) conn.prepareStatement(sql);
            pst.setString(1,username);
            pst.setString(2, password);
            int row = pst.executeUpdate();
            if (row > 0) {
                flag = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DButil.close(pst, conn);
        }
        return flag;
    }

    @Override
    public boolean deluser(String username) throws SQLException {
        boolean flag = false;
        Connection conn = null;
        Statement st = null;
        /*
        创建Connnection, Statement, ResultSet对象
        调用验证登录的方法
        */
        String sql = "delete from user where username = '" + username + "'";
        conn = DButil.getConnection();
        st = conn.createStatement();
        st.executeUpdate(sql);
        try {
            if (!username.isEmpty()) {
                flag = true;
            }
        } finally {
            DButil.close(st, conn);
        }
        return flag;
    }

    @Override
    public boolean updateuser(String username, String password,String username1) throws SQLException {
        boolean flag = false;
        Connection conn = null;
        Statement st = null;
        Connection conn1 = null;
        Connection conn2 = null;
        Statement st1 = null;
        Statement st2 = null;
        ResultSet name =null;
        /*
        创建Connnection, Statement, ResultSet对象
        调用验证登录的方法
        */
        String sql =  "select * from user where username = '" + username + "'";
        conn = DButil.getConnection();
        st = conn.createStatement();
        name = st.executeQuery(sql);
        try {
            while (name.next()){
                if (name.getString("username").equals(username)) {
                    String sql1 =  "UPDATE user SET  password= '" + password + "'WHERE username = '" + username + "'";
                    String sql2 =  "UPDATE user SET  username= '" + username1 + "'WHERE username = '" + username + "'";
                    conn1 = DButil.getConnection();
                    conn2 = DButil.getConnection();
                    st1 = conn1.createStatement();
                    st2 = conn1.createStatement();
                    st1.execute(sql1);
                    st2.execute(sql2);
                    flag = true;
                }
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            DButil.close(name,st, conn);
            DButil.close(name,st1, conn1);
            DButil.close(name,st2, conn2);
        }
        return flag;
    }
}
