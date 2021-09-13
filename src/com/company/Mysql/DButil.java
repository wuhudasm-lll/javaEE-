package com.company.Mysql;
import java.sql.*;
public class DButil {
        private static String driver = "com.mysql.jdbc.Driver";
        private static String url = "jdbc:mysql://localhost:3306/movie?useSSL=false";
        private static String user = "root";
        private static String pwd = "";

        //加载驱动
        static{
            try {
                Class.forName(driver);
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
        }

        //连接对象
        public static Connection getConnection(){
            Connection conn = null;
            try {
                conn = DriverManager.getConnection(url, user, pwd);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return conn;
        }

        //关闭流
        public static void close(ResultSet rs, Statement st, Connection conn){
            try {
                if(rs != null){
                    rs.close();
                }
                if(st != null){
                    st.close();
                }
                if(conn != null){
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    public static void close(Statement st, Connection conn){
        try {

            if(st != null){
                st.close();
            }
            if(conn != null){
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

        public static void close(PreparedStatement pst, Connection conn){
            close(null, pst, conn);
        }

}
