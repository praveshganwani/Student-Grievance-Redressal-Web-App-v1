
package com.govt.controller;

import com.govt.model.GrievanceData;
import com.govt.model.User;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/GrievanceController")
@MultipartConfig(maxFileSize = 9000000000L)
public class GrievanceController extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        GrievanceData gd = new GrievanceData();
        HttpSession hs = req.getSession();
        User us = (User)hs.getAttribute("user");
        gd.setStudentId(us.getId());
        gd.setComplaintTitle(req.getParameter("title"));
        gd.setComplaintDetail(req.getParameter("description"));
        gd.setComplaintCategory(req.getParameter("category"));
        if(req.getParameter("check").equals("checked"))
        {
            gd.setIsAnonymous(1);
        }
        else
            gd.setIsAnonymous(0);
        Part part=req.getPart("attachment");
        InputStream is=part.getInputStream();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/projectdb?autoReconnect=true&useSSL=false","root","root");
            PreparedStatement ps=con.prepareStatement("select * from committees where name=?");
            ps.setString(1, req.getParameter("level"));
            ResultSet rs = ps.executeQuery();
            rs.next();
            gd.setCommitteeId(rs.getInt("id"));
        } 
        catch (Exception e) {
            System.out.println(e);
        }
        Date dt = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String finalDate = sdf.format(dt);
        gd.setComplaintDate(finalDate);
        gd.setIsSolved(0);
        try 
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/projectdb?autoReconnect=true&useSSL=false","root","root");
            PreparedStatement ps=con.prepareStatement("insert into grievances (complaint_title, complaint_detail, student_id, category, complaint_datetime, issolved, committee_id, attachment, isanonymous) values (?,?,?,?,?,?,?,?,?)");
            ps.setString(1, gd.getComplaintTitle());
            ps.setString(2, gd.getComplaintDetail());
            ps.setInt(3, gd.getStudentId());
            ps.setString(4, gd.getComplaintCategory());
            ps.setString(5, gd.getComplaintDate());
            ps.setInt(6, gd.getIsSolved());
            ps.setInt(7, gd.getCommitteeId());
            ps.setBlob(8, is);
            ps.setInt(9, gd.getIsAnonymous());
            ps.executeUpdate();
            resp.sendRedirect("dashboard.jsp");
        }
        catch (Exception e) 
        {
            System.out.println(e);
        }
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp); //To change body of generated methods, choose Tools | Templates.
    }
    
}
