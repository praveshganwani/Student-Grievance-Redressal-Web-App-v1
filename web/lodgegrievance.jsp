
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lodge Grievance | SGRC</title>
    </head>
    <body>
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
         <jsp:include page="header.jsp"/>
         <sql:setDataSource driver="com.mysql.jdbc.Driver" 
                                       url="jdbc:mysql://localhost:3306/projectdb?autoReconnect=true&useSSL=false"
                                       user="root"
                                       password="root"
                                       var="con"
                                       />
         <sql:query dataSource="${con}" var="data">
                select * from students where student_id=?
            <sql:param>${user.id}</sql:param>
         </sql:query>
         <div class="container-form">
            <h1>Grievance Form</h1>
            <form class="form" action="GrievanceController" method="post" enctype="multipart/form-data">
            <fieldset class="form-fieldset ui-input __zero  ">
                <br>
                <c:forEach items="${data.rows}" var="row">
                <sql:query dataSource="${con}" var="data">
                select * from committees where id=?
                    <sql:param>${row.college_id}</sql:param>
                </sql:query>
                </c:forEach>
                <select name="level">
                    <c:forEach items="${data.rows}" var="row">
                        <option value="${row.name}">${row.name}</option>
                        <sql:query dataSource="${con}" var="data1">
                            select * from committees where id=?
                        <sql:param>${row.parent_id}</sql:param>
                        </sql:query>
                    </c:forEach>
                    <c:forEach items="${data1.rows}" var="row">
                        <option value="${row.name}">${row.name}</option>
                    </c:forEach>
                </select>
            </fieldset>
                <br>
                <fieldset class="form-fieldset ui-input __zero  ">
                    <select name="category">
                        <option value="finance">Finance</option>
                        <option value="admission">Admission</option>
                        <option value="timetable">Time Table</option>
                        <option value="examination">Examination</option>
                        <option value="paper reevaluation">Paper Re-evaluation</option>
                        <option value="other">Others</option>
                    </select>
                </fieldset>
            <fieldset class="form-fieldset ui-input __first">
                <input type="text" name="title" id="Title" tabindex="0" />
                <label for="Title">
                    <span data-text="Title">Title</span>
                </label>
            </fieldset>
                
            <fieldset class="form-fieldset ui-input __second">
                <input type="text" name="description" id="Description" tabindex="0" />
                <label for="Description">
                    <span data-text="Description">Description</span>
                </label>
            </fieldset>
            <fieldset class="form-fieldset ui-input __second">
                 <input type="file" accept="image/*,video/*,.pdf/*"  name="attachment"/>
                <label for="Description">
                    <span data-text="Attachments (if any)">Attachments</span>
                </label>
            </fieldset>
                <br>
                <fieldset class="form-fieldset ui-input __second">
                    <input type="checkbox" value="checked" name="check"/>
                <label for="Description">
                    <span data-text="Go Anonymous">Anonymous</span>
                </label>
            </fieldset>
                <div class="form-footer">
                    
                <button class="btn" type="submit">Lodge Grievance</button>
                &nbsp;&nbsp;&nbsp;  
                <button class="btn" type="reset">Reset</button>
            </div>
          </form>
        </div>
    </body>
</html>
