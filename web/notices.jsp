<%-- 
    Document   : notices
    Created on : 17 Jan, 2020, 7:59:20 AM
    Author     : manojkulkarni
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            @import 'https://fonts.googleapis.com/css?family=Lato:300,400';
            .blinking{
    animation:blinkingText 1.2s infinite;
}
@keyframes blinkingText{
    0%{     color: yellow;    }
    49%{    color: yellow; }
    60%{    color: transparent; }
    99%{    color:transparent;  }
    100%{   color: yellow;    }
}


* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}
body, html {
	font-family: 'Lato', sans-serif;
	font-size: 20px;
	height: 100%;
     
	position: relative;
}

.clearfix:after {
	content: "";
	display: block;
	clear: both;
}

a {
	color: #fff;
	text-decoration: none; 
}

.nav-btn {
	width: 100%;
	height: 35px;
	padding-top: 4px;
	color: #D5D3D3;
	background-color: #212121;			 ;
	text-align: center;
	cursor: pointer;
	display: none;
}
.nav-btn:active {
	background-color: #090909; 
}



.container {
	width: 100%;
	height: 100%;
	position: relative;
        
}



.main-content {
	background-color: #fafafa; 
	width: 100%;
	height: 100%;
	padding: 20px 30px;
        padding-top:120px;
}
.main-content .panel-wrapper {
	margin: 20px 0;
	box-shadow: 0px 1px 5px #777;
}

.main-content .panel-wrapper .panel-head {
	background-color: #28587c;
	color: #fff;
	padding: 10px 10px;
	border: 1px solid #00A5F2;
}
.main-content .panel-wrapper .panel-body {
	padding: 20px 10px;
	font-size: 80%;
}

@media only screen and (max-width: 420px){
	header {
		display: block;
	}
	.nav-btn {
		display: block;
	}
	
	.main-content {
		width: 100%;
		margin-left: 0;
		z-index: -1;
		position: relative;
	}
}

@media only screen and (max-width: 768px){
	header {
		display: block;
	}
	.nav-btn {
		display: block;
	}
	
	.main-content {
		width: 100%;
		margin-left: 0;
		z-index: -1;
		position: relative;
	}
}
        </style>
        <script>
            $(document).ready(function() {
	$('.nav-btn').on('click', function(event) {
		event.preventDefault();
		/* Act on the event */
		$('.sidebar').slideToggle('fast');

		window.onresize = function(){
			if ($(window).width() >= 768) {
				$('.sidebar').show();
			} else {
				$('.sidebar').hide();
			}
		};
	});
});
        </script>
    </head>
     
    <body>
        <jsp:include page="header.jsp"/>
	
	<div class="container">
		
		

		<div class="main-content">
			<h1>NOTICES</h1>
                        
			<div class="panel-wrapper">
                            
                            <div class="panel-head">
                                <div class="blinking">
					News
				</div>
                            </div>
				<div class="panel-body">
					Lorem ipsum dolor sit amet, consectetur adipisicing elit. Totam fugiat culpa quia possimus molestiae id sapiente ad eveniet, aliquid, eum sint fuga eius, ratione suscipit ut minus voluptates dicta nesciunt.
				</div>
			
                        </div>
			<div class="panel-wrapper">
				<div class="panel-head">
					News
				</div>
				<div class="panel-body">
					Lorem ipsum dolor sit amet, consectetur adipisicing elit. Totam fugiat culpa quia possimus molestiae id sapiente ad eveniet, aliquid, eum sint fuga eius, ratione suscipit ut minus voluptates dicta nesciunt.
				</div>
			</div>
			<div class="panel-wrapper">
				<div class="panel-head">
					News
				</div>
				<div class="panel-body">
					Lorem ipsum dolor sit amet, consectetur adipisicing elit. Totam fugiat culpa quia possimus molestiae id sapiente ad eveniet, aliquid, eum sint fuga eius, ratione suscipit ut minus voluptates dicta nesciunt. Totam fugiat culpa quia possimus molestiae id sapiente ad eveniet, aliquid, eum sint fuga eius, ratione suscipit ut minus voluptates dicta nesciunt.
				</div>
			</div>
                        <div class="panel-wrapper">
				<div class="panel-head">
					News
				</div>
				<div class="panel-body">
					Lorem ipsum dolor sit amet, consectetur adipisicing elit. Totam fugiat culpa quia possimus molestiae id sapiente ad eveniet, aliquid, eum sint fuga eius, ratione suscipit ut minus voluptates dicta nesciunt. Totam fugiat culpa quia possimus molestiae id sapiente ad eveniet, aliquid, eum sint fuga eius, ratione suscipit ut minus voluptates dicta nesciunt.
				</div>
			</div>
                        <div class="panel-wrapper">
				<div class="panel-head">
					News
				</div>
				<div class="panel-body">
					Lorem ipsum dolor sit amet, consectetur adipisicing elit. Totam fugiat culpa quia possimus molestiae id sapiente ad eveniet, aliquid, eum sint fuga eius, ratione suscipit ut minus voluptates dicta nesciunt. Totam fugiat culpa quia possimus molestiae id sapiente ad eveniet, aliquid, eum sint fuga eius, ratione suscipit ut minus voluptates dicta nesciunt.
				</div>
			</div>
		</div>
	</div>
        <div style="margin-top: 300px;"/>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
