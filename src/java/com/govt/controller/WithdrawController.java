
package com.govt.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/WithdrawController")
public class WithdrawController extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int complaintId = Integer.parseInt(req.getParameter("id"));
        try 
        {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/projectdb?autoReconnect=true&useSSL=false","root","root");
                    PreparedStatement ps=con.prepareStatement("update grievances set issolved=1 where complaint_id=?");
                    ps.setInt(1, complaintId);
                    ps.executeUpdate();
                    resp.sendRedirect("viewgrievances.jsp");
        } 
        catch (Exception e) {
            System.out.println(e);
        }
    }
    
}
