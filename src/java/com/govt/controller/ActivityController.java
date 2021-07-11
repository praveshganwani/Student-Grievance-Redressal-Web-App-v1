
package com.govt.controller;

import com.govt.model.ActivityData;
import com.govt.model.User;
import com.govt.others.Email;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ActivityController")
public class ActivityController extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int complaintId = Integer.parseInt(req.getParameter("id"));
        ActivityData ad = new ActivityData();
        Email email;
        String type = req.getParameter("type");
        if(type.equals("view"))
        {
            ad.setActivityType(type);
            ad.setComplaintId(complaintId);
            HttpSession hs = req.getSession();
            User us = (User)hs.getAttribute("user");
            ad.setActivityFrom(us.getName());
            Date dt = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String finalDate = sdf.format(dt);
            ad.setActivityTime(finalDate);
            
            try 
            {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/projectdb?autoReconnect=true&useSSL=false","root","root");
                PreparedStatement ps=con.prepareStatement("select * from grievances where complaint_id=?");
                ps.setInt(1, complaintId);
                ResultSet rs = ps.executeQuery();
                rs.next();
                int studentId = rs.getInt("student_id");
                ps = con.prepareStatement("select email_id from students where student_id=?");
                ps.setInt(1, studentId);
                rs = ps.executeQuery();
                rs.next();
                String subject = "Complaint Viewed";
                String text = "Your Complaint with Complaint ID:"+complaintId+"has been viewed by "+us.getName()+" on "+ad.getActivityTime();
                email = new Email(rs.getString("email_id"), subject, text);
                email.sendEmail();
                resp.sendRedirect("solvegrievance.jsp?id="+complaintId);
            } 
            catch (Exception e) 
            {
                System.out.println(e);
            }
        }
        
    }
    
}
