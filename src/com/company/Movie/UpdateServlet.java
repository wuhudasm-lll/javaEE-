package com.company.Movie;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/updateServlet")
public class UpdateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String moviename = request.getParameter("moviename");
        String time = request.getParameter("time");
        String price = request.getParameter("price");
        String country = request.getParameter("country");
        String style = request.getParameter("style");
        String effect = request.getParameter("effect");
        String moviename1 = request.getParameter("moviename1");
        String on = request.getParameter("on");
        MovieDao movieDao = new MovieDaoimpl();
        try {
            if (moviename!=null) {
                movieDao.updatemovie(moviename, time, price, country, style, effect,moviename1,on);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
