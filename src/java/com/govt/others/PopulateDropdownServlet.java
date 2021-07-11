
package com.govt.others;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/PopulateDropdownServlet")
public class PopulateDropdownServlet extends HttpServlet{
    
    
    //Student Registration
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        PrintWriter out = resp.getWriter();
        int id=-1;
        try 
            {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/projectdb?autoReconnect=true&useSSL=false","root","root");
                PreparedStatement ps=con.prepareStatement("select * from committees where name="+"? and isverified=1");
                ps.setString(1, name);
                ResultSet rs=ps.executeQuery();
                if(rs.next())
                {
                    id = rs.getInt("id");
                }
                con.close();
            }
            catch (Exception e) 
            {
                System.out.println(e);
            }
        try 
            {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/projectdb?autoReconnect=true&useSSL=false","root","root");
                PreparedStatement ps=con.prepareStatement("select * from committees where parent_id="+"?");
                ps.setString(1, id+"");
                ResultSet rs=ps.executeQuery();
                out.write("<option disabled selected>Please Select Your College</option>");
                while(rs.next())
                {
                    out.write("<option value=\""+rs.getString("name")+"\">"+rs.getString("name")+"</option>");
                }
                con.close();
            }
            catch (Exception e) 
            {
                System.out.println(e);
            }
    }

    //Committee Registration
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String type = req.getParameter("type");
        PrintWriter out=resp.getWriter();
        if(type.equals("coll")){
            try 
            {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/projectdb?autoReconnect=true&useSSL=false","root","root");
                PreparedStatement ps=con.prepareStatement("select * from committees where type="+"?");
                ps.setString(1, "univ");
                ResultSet rs=ps.executeQuery();
                out.write("<option disabled selected>Please Select University First</option>");
                while(rs.next())
                {
                    out.write("<option value=\""+rs.getString("name")+"\">"+rs.getString("name")+"</option>");
                }
            }
            catch (Exception e) 
            {
                System.out.println(e);
            }
        }
        else{
            out.write("<option value=\"None\" selected>Not Needed</option>");
        }
    }
    
}
