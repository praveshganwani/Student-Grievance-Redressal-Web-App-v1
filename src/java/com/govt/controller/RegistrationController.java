
package com.govt.controller;

import com.govt.model.CommitteeData;
import com.govt.model.StudentData;
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
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@WebServlet("/RegistrationController")
public class RegistrationController extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String type = req.getParameter("type");
        HttpSession hs = req.getSession();
        if(type.equals("committee"))
        {
            CommitteeData cd = new CommitteeData();
            cd.setCommitteeName(req.getParameter("username"));
            cd.setCommitteeEmail(req.getParameter("emailid"));
            BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
            cd.setCommitteePassword(bCryptPasswordEncoder.encode(req.getParameter("password")));
            cd.setCommitteeType(req.getParameter("level"));
            if(req.getParameter("sublevel")==null)
            {
                hs.setAttribute("msg", "University Not Yet Registered");
                hs.setAttribute("pagename", "home.jsp");
                hs.setAttribute("popupType", "info");
                resp.sendRedirect("popup.jsp");
            }
            if(req.getParameter("sublevel").equals("None"))
                cd.setParentId(0);
            else
            {
                try {
                    String sublevel = req.getParameter("sublevel");
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con=DriverManager.getConnection("jdbc:mysql://sihmydb.mysql.database.azure.com:3306/{sih_db}?useSSL=true&requireSSL=false","utkarsh@sihmydb","sih@1234");
                    PreparedStatement ps=con.prepareStatement("select * from committees where name=?");
                    ps.setString(1, sublevel);
                    ResultSet rs = ps.executeQuery();
                    rs.next();
                    cd.setParentId(rs.getInt("id"));    
                    con.close();
                } 
                catch (Exception e) {
                    System.out.println(e);
                }
            }
            Date dt = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String finalDate = sdf.format(dt);
            cd.setCommitteeRegistrationDate(finalDate);
            cd.setIsVerified(0);
            cd.setIsActive(1);
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://sihmydb.mysql.database.azure.com:3306/{sih_db}?useSSL=true&requireSSL=false","utkarsh@sihmydb","sih@1234");
                PreparedStatement ps=con.prepareStatement("insert into committees (committee_name, committee_type, committee_email_id, committee_password, reg_datetime, isverified, isactive, parent_id) values(?,?,?,?,?,?,?,?)");
                ps.setString(1, cd.getCommitteeName());
                ps.setString(2, cd.getCommitteeType());
                ps.setString(3, cd.getCommitteeEmail());
                ps.setString(4, cd.getCommitteePassword());
                ps.setString(5, cd.getCommitteeRegistrationDate());
                ps.setInt(6, cd.getIsVerified());
                ps.setInt(7, cd.getIsActive());
                ps.setInt(8, cd.getParentId());
                ps.executeUpdate();
                con.close();
                hs.setAttribute("msg", "Registered SuccessFully. Please wait for your account to be verified.");
                hs.setAttribute("pagename", "home.jsp");
                hs.setAttribute("popupType", "success");
                resp.sendRedirect("popup.jsp");
            }
            catch(Exception e)
            {
                System.out.println(e);
            }
        }
        else if(type.equals("student"))
        {
            StudentData sd = new StudentData();
            sd.setFirstName(req.getParameter("firstname"));
            sd.setMiddleName(req.getParameter("middlename"));
            sd.setLastName(req.getParameter("lastname"));
            sd.setCourseName(req.getParameter("coursename"));
            sd.setStudentUID(req.getParameter("enrollment"));
            sd.setStudentEmail(req.getParameter("emailid"));
            BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
            sd.setStudentPassword(bCryptPasswordEncoder.encode(req.getParameter("password")));
            String collegeName = req.getParameter("sublevel");
            if(collegeName==null){
                hs.setAttribute("msg", "Your College Is Not Yet Registered");
                hs.setAttribute("popupType", "info");
                hs.setAttribute("pagename", "home.jsp");
                resp.sendRedirect("popup.jsp");
            }
            try 
            {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/projectdb?autoReconnect=true&useSSL=false","root","root");
                PreparedStatement ps = con.prepareStatement("select * from committees where name=?");
                ps.setString(1, collegeName);
                ResultSet rs = ps.executeQuery();
                rs.next();
                sd.setCollegeId(rs.getInt("id"));
            } 
            catch (Exception e) {
                System.out.println(e);
            }
            Date dt = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String finalDate = sdf.format(dt);
            sd.setStudentRegistrationDate(finalDate);
            sd.setIsVerified(0);
            sd.setIsActive(1);
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/projectdb?autoReconnect=true&useSSL=false","root","root");
                PreparedStatement ps=con.prepareStatement("insert into students (first_name, middle_name, last_name, email_id, password, student_uid, course_name, reg_datetime, isverified, isactive, college_id) values(?,?,?,?,?,?,?,?,?,?,?)");
                ps.setString(1, sd.getFirstName());
                ps.setString(2, sd.getMiddleName());
                ps.setString(3, sd.getLastName());
                ps.setString(4, sd.getStudentEmail());
                ps.setString(5, sd.getStudentPassword());
                ps.setString(6, sd.getStudentUID());
                ps.setString(7, sd.getCourseName());
                ps.setString(8, sd.getStudentRegistrationDate());
                ps.setInt(9, sd.getIsVerified());
                ps.setInt(10, sd.getIsActive());
                ps.setInt(11, sd.getCollegeId());
                ps.executeUpdate();
                con.close();
                hs.setAttribute("msg", "Registered SuccessFully!!! Please wait for your account to be verified.");
                hs.setAttribute("pagename", "home.jsp");
                resp.sendRedirect("popup.jsp");
            }
            catch(Exception e)
            {
                System.out.println(e);
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp); //To change body of generated methods, choose Tools | Templates.
    }
    
}
