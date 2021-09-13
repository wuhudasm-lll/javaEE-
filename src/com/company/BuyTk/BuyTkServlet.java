package com.company.BuyTk;



import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;


@WebServlet("/buyTkServlet")
public class BuyTkServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        //转换字符串
        String moviename = request.getParameter("moviename");
        String seat = request.getParameter("seat");
        String num = request.getParameter("num");
        String totle = request.getParameter("totle");
        String username = request.getParameter("username");

        BuyTkDao buyTkDao = new BuyTkDaoimpl();
        try {
            buyTkDao.saveTk(moviename,seat,num,totle,username);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
