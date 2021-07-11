
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
import javax.servlet.http.HttpSession;

@WebServlet("/VerifyController")
public class VerifyController extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String userType = req.getParameter("type");
        String level = req.getParameter("level");
        HttpSession hs = req.getSession();
        if(userType.equals("admin"))
        {
            try 
            {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/projectdb?autoReconnect=true&useSSL=false","root","root");
                PreparedStatement ps=con.prepareStatement("update committees set isverified=1 where id=?");
                ps.setInt(1, id);
                ps.executeUpdate();
                hs.setAttribute("msg", "Verified Successfully");
                hs.setAttribute("pagename", "dashboard.jsp");
                hs.setAttribute("popupType", "success");
                resp.sendRedirect("popup.jsp");
            } 
            catch (Exception e) {
                System.out.println(e);
            }
        }
        if(userType.equals("committee") && level.equals("colleges"))
        {
            try 
            {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/projectdb?autoReconnect=true&useSSL=false","root","root");
                PreparedStatement ps=con.prepareStatement("update committees set isverified=1 where id=?");
                ps.setInt(1, id);
                ps.executeUpdate();
                hs.setAttribute("msg", "Verified Successfully");
                hs.setAttribute("pagename", "home.jsp");
                hs.setAttribute("popupType", "success");
                resp.sendRedirect("popup.jsp");
            } 
            catch (Exception e) {
                System.out.println(e);
            }
        }
        else
        {
            try 
            {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/projectdb?autoReconnect=true&useSSL=false","root","root");
                PreparedStatement ps=con.prepareStatement("update students set isverified=1 where student_id=?");
                ps.setInt(1, id);
                ps.executeUpdate();
                hs.setAttribute("msg", "Verified Successfully");
                hs.setAttribute("pagename", "home.jsp");
                hs.setAttribute("popupType", "success");
                resp.sendRedirect("popup.jsp");
            } 
            catch (Exception e) {
                System.out.println(e);
            }
        }
    }
    
}
