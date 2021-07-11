<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Login | SGRC</title>
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%
            session.removeAttribute("user");
            session.invalidate();
        %>
        <jsp:include page="header.jsp"/>
        <div class="container-form">
            <h1><%= request.getParameter("type")%> LOGIN</h1>
            <form class="form" action="LoginController?type=${param.type}" method="post">
            <fieldset class="form-fieldset ui-input __second">
              <input type="email" name="email" id="email" tabindex="0" />
              <label for="email">
                <span data-text="User Name (Registered E-mail ID)">E-mail Address</span>
              </label>
            </fieldset>
    
            <fieldset class="form-fieldset ui-input __third">
              <input type="password" name="password" id="new-password" />
              <label for="new-password">
                <span data-text="Password">Password</span>
              </label>
            </fieldset>
            <div class="form-footer">
              <button class="btn">Login</button>
            </div>
          </form>
        </div>  
    </body>
</html>
