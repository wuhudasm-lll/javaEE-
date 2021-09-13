package com.company.Movie;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/movieServlet")
public class MovieServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setHeader("Content-type", "text/html;charset=UTF-8");
        String moviename = request.getParameter("moviename");
        String time = request.getParameter("time");
        String price = request.getParameter("price");
        String country = request.getParameter("country");
        String style = request.getParameter("style");
        String effect = request.getParameter("effect");
        String on = request.getParameter("on");
        MovieDao movieDao = new MovieDaoimpl();
        boolean flag = movieDao.savemovie(moviename,time,price,country,style,effect,on);
        if (flag == true){
            response.sendRedirect("index.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
