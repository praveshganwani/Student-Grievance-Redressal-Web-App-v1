<%-- 
    Document   : verify
    Created on : 17 Jan, 2020, 8:50:29 AM
    Author     : Pravesh Ganwani
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/home.css" rel="stylesheet" type="text/css"/>
        <link href="css/tables.css" rel="stylesheet" type="text/css"/>
        <title>Verifications | SGRC</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <sql:setDataSource driver="com.mysql.jdbc.Driver" 
                                       url="jdbc:mysql://localhost:3306/projectdb?autoReconnect=true&useSSL=false"
                                       user="root"
                                       password="root"
                                       var="con"
                                       />
        <c:if test="${user.type=='admin'}">
        <sql:query dataSource="${con}" var="data">
                        select * from committees where type=?
        <sql:param>univ</sql:param>
        </sql:query>
        <div class="container" id="secondary-div">
        <div class="row">
        <div class="col-xs-12">
      <div class="table-responsive">
        <table class="table table-bordered table-hover">
          <caption class="text-center">List Of Universities</caption>
          <thead>
            <tr>
              <th>University Name</th>
              <th>University E-Mail</th>
              <th>Verify</th>
            </tr>
          </thead>
          <tbody>
        <c:forEach items="${data.rows}" var="row">
            <tr>
              <td>${row.name}</td>
              <td>${row.email_id}</td>
              <c:if test="${row.isverified==1}">
                  <td>Verified</td>
              </c:if>
              <c:if test="${row.isverified==0}">
                  <td><button><a href="VerifyController?id=${row.id}&type=${user.type}">Verify</a></button></td>
              </c:if>
            </tr>
        </c:forEach>
            </tbody>
          <tfoot>
            <tr>
              <td colspan="5" class="text-center">Data retrieved from Committee Database.</td>
            </tr>
          </tfoot>
        </table>
      </div>
    </div>
  </div>
</div>
        </c:if>
        <c:if test="${user.type=='committee'&& param.check=='coll'}">
        <sql:query dataSource="${con}" var="data">
                        select * from committees where type=? and parent_id=?
        <sql:param>${param.check}</sql:param>
        <sql:param>${user.id}</sql:param>
        </sql:query>
        <div class="container" id="secondary-div">
        <div class="row">
        <div class="col-xs-12">
      <div class="table-responsive">
        <table class="table table-bordered table-hover">
          <caption class="text-center">List Of Colleges</caption>
          <thead>
            <tr>
              <th>College Name</th>
              <th>College E-Mail</th>
              <th>Verify</th>
            </tr>
          </thead>
          <tbody>
        <c:forEach items="${data.rows}" var="row">
            <tr>
              <td>${row.name}</td>
              <td>${row.email_id}</td>
              <c:if test="${row.isverified==1}">
                  <td>Verified</td>
              </c:if>
              <c:if test="${row.isverified==0}">
                  <td><button><a href="VerifyController?id=${row.id}&type=${user.type}&level=coll">Verify</a></button></td>
              </c:if>
            </tr>
        </c:forEach>
            </tbody>
          <tfoot>
            <tr>
              <td colspan="5" class="text-center">Data retrieved from Committee Database.</td>
            </tr>
          </tfoot>
        </table>
      </div>
    </div>
  </div>
</div>
        </c:if>
        <c:if test="${user.type=='committee' && param.check=='students'}">
        <sql:query dataSource="${con}" var="data">
                        select * from students where college_id=?
        <sql:param>${user.id}</sql:param>
        </sql:query>
        <div class="container" id="secondary-div">
        <div class="row">
        <div class="col-xs-12">
      <div class="table-responsive">
        <table class="table table-bordered table-hover">
          <caption class="text-center">List Of Students</caption>
          <thead>
            <tr>
              <th>Student Name</th>
              <th>Student E-Mail</th>
              <th>Student UID</th>
              <th>Course Name</th>
              <th>Verify</th>
            </tr>
          </thead>
          <tbody>
        <c:forEach items="${data.rows}" var="row">
            <tr>
              <td>${row.first_name} ${row.middle_name} ${row.last_name}</td>
              <td>${row.email_id}</td>
              <td>${row.student_uid}</td>
              <td>${row.course_name}</td>
              <c:if test="${row.isverified==1}">
                  <td>Verified</td>
              </c:if>
              <c:if test="${row.isverified==0}">
                  <td><button><a href="VerifyController?id=${row.student_id}&type=${user.type}&level=students">Verify</a></button></td>
              </c:if>
            </tr>
        </c:forEach>
            </tbody>
          <tfoot>
            <tr>
              <td colspan="5" class="text-center">Data retrieved from Student Database.</td>
            </tr>
          </tfoot>
        </table>
      </div>
    </div>
  </div>
</div>
        </c:if>
    </body>
</html>
