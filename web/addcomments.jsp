<%-- 
    Document   : addcomments
    Created on : 17 Jan, 2020, 6:29:47 PM
    Author     : Pravesh Ganwani
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
        <title>Add Comments | SGRC</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="container-form">
            <h1>Send Comments</h1>
            <form class="form" action="CommentsController?id=${param.id}" method="post">
                <fieldset class="form-fieldset ui-input __first">
                <input type="text" name="comments" id="firstname" tabindex="0" />
                <label for="firstname">
                    <span data-text="Write Your Comments">Comments</span>
                </label>
                </fieldset>
                <div class="form-footer">
                <button class="btn" type="submit">Send</button>
                &nbsp;&nbsp;&nbsp;  
                <button class="btn" type="reset">Reset</button>
            </div>
          </form>
        </div>
    </body>
</html>
