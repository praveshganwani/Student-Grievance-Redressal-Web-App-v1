
package com.govt.others;

import com.govt.model.GrievanceData;
import java.io.IOException;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ImageServlet")
public class ImageServlet extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int grievanceId = Integer.parseInt(req.getParameter("id"));

        try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/projectdb?autoReconnect=true&useSSL=false","root","root");
                PreparedStatement ps=con.prepareStatement("select attachment from grievances where complaint_id=?");
                ps.setInt(1, grievanceId);
                ResultSet rs = ps.executeQuery();
                rs.next();
                if(rs.getBlob("attachment")==null)
                {
                    resp.getWriter().write("No attachment provided");
                }
                else{
                    Blob blob=rs.getBlob("attachment");
                    byte arr[]=blob.getBytes(1, (int)blob.length());
                    con.close();
                    resp.getOutputStream().write(arr);
                }
                
        } 
        catch (Exception e) 
        {
            System.out.println(e);
        }
    }
    
}
