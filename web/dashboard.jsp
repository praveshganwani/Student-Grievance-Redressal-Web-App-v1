<%-- 
    Document   : dashboard
    Created on : 16 Jan, 2020, 9:06:30 PM
    Author     : Pravesh Ganwani
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/home.css" rel="stylesheet" type="text/css"/>
        <title>DashBoard | SGRC</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <c:if test="${user.type=='admin'}">
        <div class="container-boxes">
            <div class="box box--pink">
<!--              <div class="profile"></div>-->
              <div class="content">
                  <h1><a href="verify.jsp?type=${user.type}">Verify Universities</a></h1>
              </div>
            </div>
            <div class="box box--pink">
<!--              <div class="profile"></div>-->
              <div class="content">
                  <h1><a href="loading.html">Click To Generate Report On Grievances</a></h1>
              </div>
            </div>
        </div>
        </c:if>
        <c:if test="${user.type=='committee'}">
        <sql:setDataSource driver="com.mysql.jdbc.Driver" 
                                       url="jdbc:mysql://localhost:3306/projectdb?autoReconnect=true&useSSL=false"
                                       user="root"
                                       password="root"
                                       var="con"
                                       />
        <sql:query dataSource="${con}" var="data">
            select * from committees where name=?
            <sql:param>${user.name}</sql:param>
        </sql:query>
            <c:forEach items="${data.rows}" var="row">
                <c:if test="${row.type=='univ'}">
                    <div class="container-boxes">
            <div class="box box--pink">
<!--              <div class="profile"></div>-->
              <div class="content">
                  <h1><a href="verify.jsp?type=${user.type}&check=coll">Verify Colleges</a></h1>
              </div>
            </div>
              <div class="box box--pink">
<!--              <div class="profile"></div>-->
              <div class="content">
                  <h1><a href="solvegrievances.jsp?id=${user.id}">Solve Grievances</a></h1>
              </div>
            </div>
        </div>
                </c:if>
                <c:if test="${row.type=='coll'}">
                    <div class="container-boxes">
            <div class="box box--pink">
<!--              <div class="profile"></div>-->
              <div class="content">
                  <h1><a href="verify.jsp?type=${user.type}&check=students">Verify Students</a></h1>
              </div>
            </div>
              <div class="box box--pink">
<!--              <div class="profile"></div>-->
              <div class="content">
                  <h1><a href="solvegrievances.jsp?id=${user.id}">Solve Grievances</a></h1>
              </div>
            </div>
        </div>
                </c:if>
            </c:forEach>
        </c:if>
        <c:if test="${user.type=='student'}">
        <div class="container-boxes">
            <div class="box box--pink">
<!--              <div class="profile"></div>-->
              <div class="content">
                  <h1><a href="lodgegrievance.jsp?id=${user.id}">Lodge Your Grievance</a></h1>
              </div>
            </div>
            <div class="box box--pink">
<!--              <div class="profile"></div>-->
              <div class="content">
                  <h1><a href="viewgrievances.jsp">View Your Grievances</a></h1>
              </div>
            </div>
              <div class="box box--pink">
<!--              <div class="profile"></div>-->
              <div class="content">
                  <h1><a href="withdrawgrievances.jsp">Withdraw Grievance</a></h1>
              </div>
            </div>
        </div>
        </c:if>    
    </body>
</html>
