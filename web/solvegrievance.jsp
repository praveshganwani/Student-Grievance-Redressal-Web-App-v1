<%-- 
    Document   : solvegrievance
    Created on : 17 Jan, 2020, 2:26:22 PM
    Author     : Pravesh Ganwani
--%>

<%@page import="java.sql.Blob"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/tables.css" rel="stylesheet" type="text/css"/>
        <title>Solve Grievance Page</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <sql:setDataSource driver="com.mysql.jdbc.Driver" 
                                       url="jdbc:mysql://localhost:3306/projectdb?autoReconnect=true&useSSL=false"
                                       user="root"
                                       password="root"
                                       var="con"
                                       />
        <div class="container" id="secondary-div">
        <div class="row">
        <div class="col-xs-12">
      <div class="table-responsive">
        <table class="table table-bordered table-hover">
          <h1 class="text-center">Grievance Details</h1>
          <thead>
            <tr>
              <th>Grievance ID</th>
              <th>Grievance Title</th>
              <th>Grievance Description</th>
              <th>Grievance Category</th>
              <th>Complaint Date</th>
              <th>Attachment Provided</th>
              <th>Forward</th>
              <th>Send Comments</th>
            </tr>
          </thead>
          <tbody>
        <sql:query dataSource="${con}" var="data">
            select * from grievances where complaint_id=?
            <sql:param>${param.id}</sql:param>
        </sql:query>
            <c:forEach items="${data.rows}" var="row">
              <tr>
              <td>${row.complaint_id}</td>
              <td>${row.complaint_title}</td>
              <td>${row.complaint_detail}</td>
              <td>${row.category}</td>
              <td>${row.complaint_datetime}</td>
              <td><button><a href="ImageServlet?id=${param.id}" target="_blank">Click Here View Attachment</a></button></td>
              <td><a href="?id=${param.id}" target="_blank">Forward To</a>
                <sql:query dataSource="${con}" var="data1">
                    select * from committees where id=?
                <sql:param>${user.id}</sql:param>
                </sql:query>
                <c:forEach items="${data1.rows}" var="row1">
                    <c:if test="${row1.type=='coll'}">
                        <sql:query dataSource="${con}" var="data2">
                        select * from committees where id=?
                    <sql:param>${row1.parent_id}</sql:param>
                    </sql:query>
                    <c:forEach items="${data2.rows}" var="row2">
                    <select name="sublevel" id="college">
                        <option selected="selected" value="$(row2.name}">${row2.name}</option>
                    </select>
                    </c:forEach>
                    </c:if>
                    <c:if test="${row1.type=='univ'}">
                        <sql:query dataSource="${con}" var="data2">
                        select * from committees where parent_id=?
                    <sql:param>${row1.id}</sql:param>
                    </sql:query>
                    <c:forEach items="${data2.rows}" var="row2">
                    <select name="sublevel" id="college">
                        <option selected="selected" value="$(row2.name}">${row2.name}</option>
                    </select>
                    </c:forEach>
                    </c:if>
                </c:forEach>
                  </td>
                  <td>
                      <button><a href="addcomments.jsp?id=${param.id}">Add Comments</a></button>
                  </td>
            </tr>
            </c:forEach>
            </tbody>
          <tfoot>
            <tr>
              <td colspan="8" class="text-center">Data retrieved from Complaint Database.</td>
            </tr>
          </tfoot>
        </table>
      </div>
    </div>
  </div>
</div>
    </body>
</html>
