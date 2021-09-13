package com.company.Movie;

import java.sql.SQLException;
import java.util.ArrayList;

public interface MovieDao {
    public boolean savemovie(String moviename,String time,String price,String country,String style,String effect,String on);
    public boolean delmovie(String moviename) throws SQLException;
    public boolean clearseat(String seatname) throws SQLException;
    public boolean updatemovie(String moviename,String time,String price,String country,String style,String effect,String moviename1,String on) throws SQLException;
}
