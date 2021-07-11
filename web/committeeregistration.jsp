<%-- 
    Document   : committeeregistration
    Created on : 15 Jan, 2020, 12:59:49 AM
    Author     : Pravesh Ganwani
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Committee Registrations |  SGRC</title>
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <script>
            function changeSublevel(value){
                var url = "PopulateDropdownServlet?type="+value;
                
                var xhttp=new XMLHttpRequest();
                xhttp.onreadystatechange=function()
                {
                    if(xhttp.readyState==4 && xhttp.status==200)
                    {
                              document.getElementById('sublevel_id').innerHTML=xhttp.responseText;
                    }
                };
                
                xhttp.open("get",url, true);
                xhttp.send();
            }
        </script>
        <jsp:include page="header.jsp"/>
        <div class="container-form">
            <h1><%=request.getParameter("type")%> REGISTRATION</h1>
            <form class="form" action="RegistrationController?type=${param.type}" method="post">
                
            <c:if test="${param.type=='committee'}">
            <fieldset class="form-fieldset ui-input __zero  ">
                <br>
                <select name="level" id="level_id" onchange="changeSublevel(this.value)">
                    <option value="" selected="selected" disabled="disabled">Select Committee Level</option>
                    <option value="univ">University Level</option>
                    <option value="coll">College Level</option>
                </select>
            </fieldset>
            <fieldset class="form-fieldset ui-input __zero  ">
                <br>
                <select name="sublevel" id="sublevel_id">
                    <option selected="selected" disabled="disabled">Please Select Committee Level First</option>
                </select>
            </fieldset>
            </c:if>    
            <fieldset class="form-fieldset ui-input __first">
                <input type="text" name="username" id="firstname" tabindex="0" />
                <label for="firstname">
                    <span data-text="Committee Name">Name</span>
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
