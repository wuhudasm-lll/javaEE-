package com.company.Usermaster;

import com.company.Movie.MovieDao;
import com.company.Movie.MovieDaoimpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/updateUserServlet")
public class UpdateUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String username1 = request.getParameter("username1");
        String password = request.getParameter("password");
        String username = request.getParameter("username");

        UsermasterDao usermasterDao = new UsermasterDaoimpl();
        try {
            if (username!=null) {
                usermasterDao.updateuser(username, password,username1);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
