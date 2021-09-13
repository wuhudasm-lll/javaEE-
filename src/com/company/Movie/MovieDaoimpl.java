package com.company.Movie;

import com.company.Mysql.DButil;
import com.mysql.jdbc.PreparedStatement;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class MovieDaoimpl implements MovieDao{

    @Override
    public boolean savemovie(String moviename, String time, String price, String country, String style, String effect,String on) {
        boolean flag = false;
        Connection conn = null;
        PreparedStatement pst = null;

        /*
        创建连接Connection对象和Statement对象
        调用插入数据到数据库的方法
        */
        conn = DButil.getConnection();
        String sql = "insert into getmovie(moviename, time,price,country,style,effect,onto) values(?,?,?,?,?,?,?)";
        try {
            pst = (PreparedStatement) conn.prepareStatement(sql);
            pst.setString(1,moviename);
            pst.setString(2, time);
            pst.setString(3, price);
            pst.setString(4, country);
            pst.setString(5, style);
            pst.setString(6, effect);
            pst.setString(7, on);
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
    public boolean delmovie(String moviename) throws SQLException {
        boolean flag = false;
        Connection conn = null;
        Statement st = null;
        /*
        创建Connnection, Statement, ResultSet对象
        调用验证登录的方法
        */
        String sql = "delete from getmovie where moviename = '" + moviename + "'";
        conn = DButil.getConnection();
        st = conn.createStatement();
        st.executeUpdate(sql);
        try {
                if (!moviename.isEmpty()) {
                    flag = true;
            }
        } finally {
            DButil.close(st, conn);
        }
        return flag;
    }

    @Override
    public boolean clearseat(String seatname) throws SQLException {
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
        String sql =  "select * from "+seatname+"";
        conn = DButil.getConnection();
        st = conn.createStatement();
        name = st.executeQuery(sql);
        try {
            while (name.next()){
                if (name.getInt("free") == 1) {
                    String sql1 = "UPDATE " + seatname + " SET  free =0 where free =" + name.getInt("free") + "";
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
    public boolean updatemovie(String moviename, String time, String price, String country, String style, String effect,String moviename1,String on) throws SQLException {

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
        String sql =  "select * from getmovie where moviename = '" + moviename + "'";
        conn = DButil.getConnection();
        st = conn.createStatement();
        name = st.executeQuery(sql);
        try {
            while (name.next()){
                if (name.getString("moviename").equals(moviename)) {
                    String sql1 =  "UPDATE getmovie SET  onto='" + on + "',moviename='" + moviename1 + "',time= '" + time + "',price= '" + price + "',country= '" + country + "',style= '" + style + "',effect= '" + effect + "'WHERE moviename = '" + moviename + "'";
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
}
