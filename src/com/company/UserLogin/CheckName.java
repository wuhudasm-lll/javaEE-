package com.company.UserLogin;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/servletJqAjax")
public class CheckName extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      //获取传过来的参数值
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String username = request.getParameter("username");
        System.out.println("username"+ username);
        //存储两个信息1.是否存在的状态，ture存在，反之不在2.提示信息
        UserDaoImpl userDao = new UserDaoImpl();
        User user = userDao.selectUserByName(username);
        if (user == null){
            //用户名不存在
            response.getWriter().print(true);
        }else {
            response.getWriter().print(false);
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
