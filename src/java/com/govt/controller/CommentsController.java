
package com.govt.controller;

import com.govt.model.User;
import com.govt.others.Email;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/CommentsController")
public class CommentsController extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int complaintId = Integer.parseInt(req.getParameter("id"));
        String comments = req.getParameter("comments");
        HttpSession hs = req.getSession();
        User us = (User)hs.getAttribute("user");
        Email email;
        try 
        {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/projectdb?autoReconnect=true&useSSL=false","root","root");
                    PreparedStatement ps=con.prepareStatement("select * from grievances where complaint_id=?");
                    ps.setInt(1, complaintId);
                    ResultSet rs = ps.executeQuery();
                    rs.next();
                    ps = con.prepareStatement("select * from students where student_id=?");
                    ps.setString(1, rs.getInt("student_id")+"");
                    rs = ps.executeQuery();
                    rs.next();
                    String subject = "Comment From "+us.getName();
                    String text = "Comments on complaint with Complaint ID: "+complaintId+" by "+us.getName()+"Comments: "+comments;
                    email = new Email(rs.getString("email_id"), subject, text);
                    email.sendEmail();
                    resp.sendRedirect("solvegrievance.jsp?id="+complaintId);
        } 
        catch (Exception e) {
            System.out.println(e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp); //To change body of generated methods, choose Tools | Templates.
    }
    
}
