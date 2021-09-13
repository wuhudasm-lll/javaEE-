package com.company.Mysql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ResourceBundle;

public class BaseDao {
    private static String url = null;
    private static String user = null;
    private static String password = null;
    static {
        try {
            //获取资源配置文件
            ResourceBundle bundle = ResourceBundle.getBundle("config");
            String driver = bundle.getString("DRIVER");
            //获取配置文件的参数
            url = bundle.getString("URL");
            user = bundle.getString("user");
            password = bundle.getString("PASSWORD");
            //加载驱动
            Class.forName(driver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
    //获取数据库连接的方法
    protected Connection getConn() throws Exception{
        return new Inner().getConn();
    }
    protected void close(ResultSet res, Statement stm,Connection conn){
        new Inner().close(res, stm, conn);
    }
    private class Inner implements Dao{
        public Connection getConn() throws Exception{
            return DriverManager.getConnection(url, user, password);
        }
        public void close(ResultSet res,Statement stm, Connection conn){
            if (res!=null){
                try{
                    res.close();
                    res = null;
                }catch (Exception e) {
                    e.printStackTrace();
                }
            }
            if (stm != null){
                try {
                    stm.close();
                    stm = null;
                }catch (Exception e){
                    e.printStackTrace();
                }
            }
            if (conn!=null){
                try {
                    conn.close();
                    conn = null;
                }catch (Exception e){
                    e.printStackTrace();
                }
            }
        }
    }
}
