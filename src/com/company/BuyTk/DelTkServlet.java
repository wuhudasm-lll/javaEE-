package com.company.BuyTk;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/DelTkServlet")
public class DelTkServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String moviename1 = request.getParameter("moviename");
        String username = request.getParameter("username");
        String where = request.getParameter("seats");
        String getseats1 = request.getParameter("getseats");
        String moviename = moviename1.substring(moviename1.indexOf(':')+1);
        String getseats = getseats1.substring(getseats1.indexOf(':')+1);
        BuyTkDao buyTkDao =new BuyTkDaoimpl();
        System.out.println(getseats);
        try {
            buyTkDao.DelTk(moviename,username,getseats);
            buyTkDao.delSeat(getseats,where);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
