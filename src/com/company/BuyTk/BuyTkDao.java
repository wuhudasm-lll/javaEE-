package com.company.BuyTk;

import java.sql.SQLException;

public interface BuyTkDao {
    public boolean saveTk(String moviename,String seat,String num,String totle,String username) throws SQLException;
    public boolean DelTk(String moviename,String username,String getseats) throws SQLException;
    public boolean ChangeSeat(String seats,String where) throws SQLException;
    public boolean delSeat(String seats,String where) throws SQLException;
}
