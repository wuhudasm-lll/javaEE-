package com.company.BuyTk;

import com.company.Mysql.DButil;

import java.sql.*;

public class BuyTkDaoimpl implements BuyTkDao{
    @Override
    public boolean saveTk(String moviename, String seat, String num, String totle,String username) throws SQLException {
        boolean flag = false;
        Connection conn = null;
        Connection conn1 = null;
        Statement st = null;
        ResultSet tableRS = null;
        com.mysql.jdbc.PreparedStatement pst = null;
        com.mysql.jdbc.PreparedStatement pst1 = null;

        conn = DButil.getConnection();
        DatabaseMetaData dbmd=conn.getMetaData();
        tableRS = dbmd.getTables(null, null,  username, null );
        if (tableRS.next()){
            String sql = "insert into "+username+"(moviename, seat,num,totle) values(?,?,?,?)";
            try {
                pst = (com.mysql.jdbc.PreparedStatement) conn.prepareStatement(sql);
                pst.setString(1, moviename);
                pst.setString(2, seat);
                pst.setString(3, num);
                pst.setString(4, totle);
                int row = pst.executeUpdate();
                if (row > 0) {
                    flag = true;
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                DButil.close(pst, conn);
            }
        }else {
            String creatsql = "CREATE TABLE "+username+"("
                    + "moviename varchar(100) not null,"
                    + "seat varchar(100),"
                    + "num varchar(255),"
                    + "totle varchar(100)"
                    + ")charset=utf8;";
            st = conn.createStatement();
            st.executeUpdate(creatsql);

            conn1 = DButil.getConnection();
            String sql = "insert into "+username+"(moviename, seat,num,totle) values(?,?,?,?)";
            try {
                pst1 = (com.mysql.jdbc.PreparedStatement) conn.prepareStatement(sql);
                pst1.setString(1, moviename);
                pst1.setString(2, seat);
                pst1.setString(3, num);
                pst1.setString(4, totle);
                int row = pst1.executeUpdate();
                if (row > 0) {
                    flag = true;
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                DButil.close(st, conn);
                DButil.close(pst1, conn1);
            }
        }
        return flag;
    }

    @Override
    public boolean DelTk(String moviename,String username,String getseats) throws SQLException {
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
        String sql =  "select * from "+username+"";
        conn = DButil.getConnection();
        st = conn.createStatement();
        name = st.executeQuery(sql);
        try {
            while (name.next()){
                if (name.getString("moviename").equals(moviename)) {
                    String sql1 = "delete from "+username+" where seat = '" + getseats + "'";
                    conn1 = DButil.getConnection();
                    st1 = conn.createStatement();
                    st1.executeUpdate(sql1);
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
    public boolean ChangeSeat(String seats, String where) throws SQLException {
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
        String[] result = seats.split(",");
        for (int x=0; x<result.length; x++) {
            String sql1 = "UPDATE " + where + " SET  free= 1 WHERE seats = '" + result[x] + "'";
            conn1 = DButil.getConnection();
            st1 = conn1.createStatement();
            st1.execute(sql1);
            try {
                flag = true;
            } finally {
                DButil.close(name, st, conn);
            }
        }
        return flag;
    }

    @Override
    public boolean delSeat(String seats, String where) throws SQLException {
        boolean flag = false;
        Connection conn = null;
        Statement st = null;
        Connection conn1 = null;
        Statement st1 = null;
        ResultSet name = null;
        /*
        创建Connnection, Statement, ResultSet对象
        调用验证登录的方法
        */
        String[] result = seats.split(",");
        for (int x = 0; x < result.length; x++) {
            String sql1 = "UPDATE " + where + " SET  free= 0 WHERE seats = '" + result[x] + "'";
            conn1 = DButil.getConnection();
            st1 = conn1.createStatement();
            st1.execute(sql1);
            try {
                flag = true;
            } finally {
                DButil.close(name, st, conn);
            }
        }
        return flag;
    }
}
