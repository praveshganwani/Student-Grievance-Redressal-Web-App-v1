
package com.govt.controller;

import com.govt.model.User;
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
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@WebServlet("/LoginController")
public class LoginController extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = new User();
        user.setType(req.getParameter("type"));
        user.setUserName(req.getParameter("email"));
        user.setPassword(req.getParameter("password"));
        HttpSession hs = req.getSession();
        if(user.getType().equals("admin"))
        {
            try 
            {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/projectdb?autoReconnect=true&useSSL=false","root","root");
                PreparedStatement ps = con.prepareStatement("select * from "+user.getType()+"s where email_id=?");
                ps.setString(1, user.getUserName());
                ResultSet rs = ps.executeQuery();
                if(rs.next())
                {
                    if(rs.getString("password").equals(req.getParameter("password")))
                    {
                        user.setName(rs.getString("name"));
                        user.setId(rs.getInt("admin_id"));
                        hs.setAttribute("user", user);
                        con.close();
                        hs.setAttribute("msg", "Login Successful");
                        hs.setAttribute("pagename", "dashboard.jsp?type="+user.getType());
                        hs.setAttribute("popupType", "success");
                        resp.sendRedirect("popup.jsp");
                    }
                }
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
            PreparedStatement ps = con.prepareStatement("select * from "+user.getType()+"s where email_id=?");
            ps.setString(1, user.getUserName());
            ResultSet rs = ps.executeQuery();
            BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
            if(rs.next()){
                if(rs.getInt("isverified")==1)
                {
                    if(bCryptPasswordEncoder.matches(user.getPassword(), rs.getString("password")))
                    {
                        if(user.getType().equals("committee")){
                            user.setName(rs.getString("name"));
                            user.setId(rs.getInt("id"));
                        }
                        else{
                            user.setName(rs.getString("first_name"));
                            user.setId(rs.getInt("student_id"));
                        }
                        hs.setAttribute("user", user);
                        con.close();
                        hs.setAttribute("msg", "Login Successful");
                        hs.setAttribute("pagename", "dashboard.jsp?type="+user.getType());
                        hs.setAttribute("popupType", "success");
                        resp.sendRedirect("popup.jsp");
                    }
                    else
                    {
                        hs.setAttribute("msg", "Password Incorrect");
                        hs.setAttribute("pagename", "login.jsp?type="+user.getType());
                        hs.setAttribute("popupType", "error");
                        resp.sendRedirect("popup.jsp");
                    }
                }
                else
                {
                    hs.setAttribute("msg", "User Not Verified");
                    hs.setAttribute("pagename", "home.jsp");
                    hs.setAttribute("popupType", "info");
                    resp.sendRedirect("popup.jsp");
                }
            }
            else
            {
                    hs.setAttribute("msg", "User Not Registered. Please Register First");
                    hs.setAttribute("pagename", user.getType()+"registration.jsp?type="+user.getType());
                    hs.setAttribute("popupType", "error");
                    resp.sendRedirect("popup.jsp");
            }
        } 
        catch (Exception e) {
            System.out.println(e);
        }
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
    }
    
}
