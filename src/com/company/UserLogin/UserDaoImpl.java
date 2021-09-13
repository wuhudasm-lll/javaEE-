package com.company.UserLogin;

import com.company.Mysql.DButil;
import com.mchange.v2.c3p0.ComboPooledDataSource;
import com.mysql.jdbc.PreparedStatement;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class UserDaoImpl implements UserDao {
    private QueryRunner qr = new QueryRunner(new ComboPooledDataSource());
    public boolean save(User user) {
        boolean flag = false;
        Connection conn = null;
        PreparedStatement pst = null;

        /*
        创建连接Connection对象和Statement对象
        调用插入数据到数据库的方法
        */
        conn = DButil.getConnection();
        String sql = "insert into user(username, password) values(?,?)";
        try {
            pst = (PreparedStatement) conn.prepareStatement(sql);
            pst.setString(1, user.getUsername());
            pst.setString(2, user.getPassword());
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

    public boolean checkLogin(String username, String password) {
        boolean flag = false;
        Connection conn = null;
        Statement st = null;
        ResultSet rs = null;
        /*
        创建Connnection, Statement, ResultSet对象
        调用验证登录的方法
        */
        String sql = "select * from user where username = '" + username + "'";
        conn = DButil.getConnection();
        try {
            st = conn.createStatement();
            rs = st.executeQuery(sql);
            while (rs.next()) {
                if (rs.getString("password").equals(password)) {
                    flag = true;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DButil.close(rs, st, conn);
        }
        return flag;
    }

    public boolean reback(String username, String password) throws SQLException {
        boolean flag = false;
        Connection conn = null;
        Statement st = null;
        Connection conn1 = null;
        Statement st1 = null;
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
                    String sql1 =  "UPDATE user SET  password= '" + password + "' WHERE username = '" + username + "'";
                    conn1 = DButil.getConnection();
                    st1 = conn1.createStatement();
                    st1.execute(sql1);
                    flag = true;
                }
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            DButil.close(name,st, conn);
            DButil.close(name,st1, conn1);
        }
        return flag;
    }

    @Override
    public boolean checkLogin1(String username, String password) {
        boolean flag = false;
        Connection conn = null;
        Statement st = null;
        ResultSet rs = null;
        /*
        创建Connnection, Statement, ResultSet对象
        调用验证登录的方法
        */
        String sql = "select * from master where username = '" + username + "'";
        conn = DButil.getConnection();
        try {
            st = conn.createStatement();
            rs = st.executeQuery(sql);
            while (rs.next()) {
                if (rs.getString("password").equals(password)) {
                    flag = true;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DButil.close(rs, st, conn);
        }
        return flag;
    }

    public boolean checkName(String username) {
        boolean flag = false;
        Connection conn = null;
        Statement st = null;
        ResultSet rs = null;
        /*
        创建Connnection, Statement, ResultSet对象
        调用验证登录的方法
        */
        String sql = "select * from user where username = '" + username + "'";
        conn = DButil.getConnection();
        try {
            st = conn.createStatement();
            rs = st.executeQuery(sql);
            while (rs.next()) {
                if (rs.getString("username").equals(username)) {
                    flag = true;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DButil.close(rs, st, conn);
        }
        return flag;
    }
    public User selectUserByName(String username){
        String sql = "select * from user where username = ?";
        try {
            return qr.query(sql,new BeanHandler<User>(User.class),username);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

}

