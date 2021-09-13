package com.company.UserLogin;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/rebackServlet")
public class RebackServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        //转换字符串
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        //调用UserDao、UserDaoImpl类及方法
        UserDao ud = new UserDaoImpl();

        //处理结果跳转相应页面
        boolean flag = false;
        try {
            flag = ud.reback(username, password);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        if(flag){
            //登录成功后跳转
            response.sendRedirect("login.jsp");
        }else{
            response.setHeader("Content-type", "text/html;charset=UTF-8");
            PrintWriter out=response.getWriter();
            out.print("<script>alert('用户名不存在!');window.location='reback.jsp';</script>");
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
