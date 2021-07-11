<%-- 
    Document   : home.jsp
    Created on : 14 Jan, 2020, 7:48:19 PM
    Author     : Pravesh Ganwani
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/home.css" rel="stylesheet" type="text/css"/>
        <title>Home | SGRC</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <c:if test="${user==null}">
        <div class="container-boxes">
            <div class="box box--pink">
<!--              <div class="profile"></div>-->
              <div class="content">
                  <h1><a href="login.jsp?type=student">Student Login</a></h1>
                  <br>
                  <p>Not Yet Registered? <a href="studentregistration.jsp?type=student">Register Here</a> </p>
              </div>
            </div>
            <div class="box box--orange">
              <!--<div class="profile"></div>-->
              <div class="content">
                  <h1><a href="login.jsp?type=committee">Committee Login</a></h1>
                  <br>
                  <p>Not Yet Registered? <a href="committeeregistration.jsp?type=committee">Register Here</a> </p>
              </div>
            </div>
            <div class="box box--green">
              <!--<div class="profile"></div>-->
              <div class="content">
                  <h1><a href="login.jsp?type=admin">Admin Login</a></h1>
                <!--<p> lorem ipsum dolor sit amet consectetur adipiscing elit </p>-->
              </div>
        </div>
        </div>
        </c:if>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
