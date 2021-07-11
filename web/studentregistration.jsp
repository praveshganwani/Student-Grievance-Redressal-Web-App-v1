<%-- 
    Document   : register
    Created on : 14 Jan, 2020, 11:21:42 PM
    Author     : Pravesh Ganwani
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Registration | SGRC</title>
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <script>
            function changeCollege(value){
                var url = "PopulateDropdownServlet?name="+value;
                
                var xhttp=new XMLHttpRequest();
                xhttp.onreadystatechange=function()
                {
                    if(xhttp.readyState==4 && xhttp.status==200)
                    {
                              document.getElementById('college').innerHTML=xhttp.responseText;
                    }
                };
                
                xhttp.open("post",url, true);
                xhttp.send();
            }
        </script>
        <jsp:include page="header.jsp"/>
        <div class="container-form">
            <h1><%=request.getParameter("type")%> REGISTRATION</h1>
            <form class="form" action="RegistrationController?type=${param.type}" method="post">
            <fieldset class="form-fieldset ui-input __zero  ">
                <br>
                <select name="level" id="university" onchange="changeCollege(this.value)">
                    <option value="dropdown" selected disabled>Please Select Your University</option>
                    <sql:setDataSource driver="com.mysql.jdbc.Driver" 
                                       url="jdbc:mysql://localhost:3306/projectdb?autoReconnect=true&useSSL=false"
                                       user="root"
                                       password="root"
                                       var="con"
                                       />
                    <sql:query dataSource="${con}" var="data">
                        select * from committees where type=? and isverified=1
                        <sql:param>univ</sql:param>
                    </sql:query>
                    <c:forEach items="${data.rows}" var="row">
                        <option value="${row.name}">${row.name}</option>
                    </c:forEach>
                </select>
            </fieldset>
            <fieldset class="form-fieldset ui-input __zero  ">
                <br>
                <select name="sublevel" id="college">
                    <option selected="selected" disabled="disabled">Please Select University First</option>
                </select>
            </fieldset>
            <fieldset class="form-fieldset ui-input __first">
                <input type="text" name="firstname" id="firstname" tabindex="0" />
                <label for="firstname">
                    <span data-text="First Name">First Name</span>
                </label>
            </fieldset>
                
            <fieldset class="form-fieldset ui-input __second">
                <input type="text" name="middlename" id="middlename" tabindex="0" />
                <label for="middlename">
                    <span data-text="Middle Name">Middle Name</span>
                </label>
            </fieldset>
                <fieldset class="form-fieldset ui-input __third">
                    <input type="text" name="lastname" id="lastname" tabindex="0"/>
                <label for="lastname">
                    <span data-text="Last Name">Last Name</span>
                </label>
            </fieldset>
            <fieldset class="form-fieldset ui-input __third">
                    <input type="text" name="coursename" id="lastname" tabindex="0"/>
                <label for="lastname">
                    <span data-text="Course Name">Course Name</span>
                </label>
            </fieldset>
            <fieldset class="form-fieldset ui-input __third">
                    <input type="text" name="enrollment" id="lastname" tabindex="0"/>
                <label for="lastname">
                    <span data-text="Registration/Enrollment No.">Registration/Enrollment No.</span>
                </label>
            </fieldset>
            <fieldset class="form-fieldset ui-input __fourth">
                <input type="email" name="emailid" id="email" tabindex="0" />
              <label for="email">
                <span data-text="E-mail Address">E-mail Address</span>
              </label>
            </fieldset>
                        
            <fieldset class="form-fieldset ui-input __third">
                <input type="password" name="password" id="new-password" />
              <label for="new-password">
                <span data-text="Password">Password</span>
              </label>
            </fieldset>
            <div class="form-footer">
                <button class="btn" type="submit">Register</button>
                &nbsp;&nbsp;&nbsp;  
                <button class="btn" type="reset">Reset</button>
            </div>
          </form>
        </div>
    </body>
</html>
