<%-- 
    Document   : home
    Created on : 14 Jan, 2020, 6:29:54 PM
    Author     : Pravesh Ganwani
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans"><link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
        <link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css'>
        <link href="css/header.css" rel="stylesheet" type="text/css"/>
        <title>SGRC | Home</title>
    </head>
    <body>
        <header>
		<nav id="main-navbar" class="navbar navbar-default navbar-fixed-top">
			<div class="container navbar-container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
                                    <a href="#"><img class="navbar-brand" src="images/WebsiteLogo.png" alt=""/></a>
                                    <h3>Govt. Of Andhra Pradesh</h3>
				</div>
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="home.jsp">Home</a></li>
						<li><a href="aboutus.jsp">About Us</a></li>
						<li><a href="how_it_works.jsp">How It Works</a></li>
						<li><a href="notices.jsp">Notices</a></li>
                                                <li><a href="faq.jsp">FAQs</a></li>
                                                <li><a href="chatbot1.jsp">ChatBot</a></li>
                                                <c:if test="${user!=null}">
                                                <li><a href="dashboard.jsp?type=${user.type}">Go To Dash Board</a></li>
                                                <li><a href="login.jsp?type=${user.type}">Log Out</a></li>
                                                </c:if>
						</li>
					</ul>
				</div>
<!--				<div class="top-social">
					<ul id="top-social-menu">
						<li><a href="#"><i class="fa fa-twitter"></i></a></li>
						<li><a href="#"><i class="fa fa-facebook"></i></a></li>
						<li><a href="#">Register</a></li>
						<li><a href="#">Careers</a></li>
					</ul>
				</div>-->
			</div>
		</nav>
	</header>   
        <script src="js/header.js" type="text/javascript"></script>
    </body>
</html>
