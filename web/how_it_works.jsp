<%-- 
    Document   : how_it_works.jsp
    Created on : 17 Jan, 2020, 9:18:02 AM
    Author     : utkarsh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
  <script src="https://unpkg.com/scrollreveal"></script>
        <title>JSP Page</title>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
        <style>
body {	
  margin: 0;
  padding-top: 120px;
  background: rgb(230,230,230);
  
  color: rgb(50,50,50);
  font-family: 'Open Sans', sans-serif;
  font-size: 112.5%;
  line-height: 1.6em;
    
  
}

/* ================ The Timeline ================ */

.timeline {
  position: relative;
  width: 660px;
  margin: 0 auto;
  margin-top: 20px;
  padding: 1em 0;
  list-style-type: none;
}

.timeline:before {
  position: absolute;
  left: 50%;
  top: 0;
  content: ' ';
  display: block;
  width: 6px;
  height: 100%;
  margin-left: -3px;
  background: rgb(80,80,80);
  background: -moz-linear-gradient(top, rgba(80,80,80,0) 0%, rgb(80,80,80) 8%, rgb(80,80,80) 92%, rgba(80,80,80,0) 100%);
  background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(30,87,153,1)), color-stop(100%,rgba(125,185,232,1)));
  background: -webkit-linear-gradient(top, rgba(80,80,80,0) 0%, rgb(80,80,80) 8%, rgb(80,80,80) 92%, rgba(80,80,80,0) 100%);
  background: -o-linear-gradient(top, rgba(80,80,80,0) 0%, rgb(80,80,80) 8%, rgb(80,80,80) 92%, rgba(80,80,80,0) 100%);
  background: -ms-linear-gradient(top, rgba(80,80,80,0) 0%, rgb(80,80,80) 8%, rgb(80,80,80) 92%, rgba(80,80,80,0) 100%);
  background: linear-gradient(to bottom, rgba(80,80,80,0) 0%, rgb(80,80,80) 8%, rgb(80,80,80) 92%, rgba(80,80,80,0) 100%);
  
  z-index: -1;
}

.timeline li {
  padding: 1em 0;
}

.timeline li:after {
  content: "";
  display: block;
  height: 0;
  clear: both;
  visibility: hidden;
}

.direction-l {
  position: relative;
  width: 300px;
  float: left;
  text-align: right;
}

.direction-r {
  position: relative;
  width: 300px;
  float: right;
}

.flag-wrapper {
  position: relative;
  display: inline-block;
  
  text-align: center;
}

.flag {
  position: relative;
  display: inline;
  background: rgb(248,248,248);
  padding: 6px 10px;
  border-radius: 5px;
  
  font-weight: 600;
  text-align: left;
}

.direction-l .flag {
  -webkit-box-shadow: -1px 1px 1px rgba(0,0,0,0.15), 0 0 1px rgba(0,0,0,0.15);
  -moz-box-shadow: -1px 1px 1px rgba(0,0,0,0.15), 0 0 1px rgba(0,0,0,0.15);
  box-shadow: -1px 1px 1px rgba(0,0,0,0.15), 0 0 1px rgba(0,0,0,0.15);
}

.direction-r .flag {
  -webkit-box-shadow: 1px 1px 1px rgba(0,0,0,0.15), 0 0 1px rgba(0,0,0,0.15);
  -moz-box-shadow: 1px 1px 1px rgba(0,0,0,0.15), 0 0 1px rgba(0,0,0,0.15);
  box-shadow: 1px 1px 1px rgba(0,0,0,0.15), 0 0 1px rgba(0,0,0,0.15);
}

.direction-l .flag:before,
.direction-r .flag:before {
  position: absolute;
  top: 50%;
  right: -40px;
  content: ' ';
  display: block;
  width: 12px;
  height: 12px;
  margin-top: -10px;
  background: #fff;
  border-radius: 10px;
  border: 4px solid rgb(255,80,80);
  z-index: 10;
}

.direction-r .flag:before {
  left: -40px;
}

.direction-l .flag:after {
  content: "";
  position: absolute;
  left: 100%;
  top: 50%;
  height: 0;
  width: 0;
  margin-top: -8px;
  border: solid transparent;
  border-left-color: rgb(248,248,248);
  border-width: 8px;
  pointer-events: none;
}

.direction-r .flag:after {
  content: "";
  position: absolute;
  right: 100%;
  top: 50%;
  height: 0;
  width: 0;
  margin-top: -8px;
  border: solid transparent;
  border-right-color: rgb(248,248,248);
  border-width: 8px;
  pointer-events: none;
}

.time-wrapper {
  display: inline;
  
  line-height: 1em;
  font-size: 0.66666em;
  color: rgb(250,80,80);
  vertical-align: middle;
}

.direction-l .time-wrapper {
  float: left;
}

.direction-r .time-wrapper {
  float: right;
}

.time {
  display: inline-block;
  padding: 4px 6px;
  background: rgb(248,248,248);
}

.desc {
  margin: 1em 0.75em 0 0;
  
  font-size: 0.77777em;
  font-style: italic;
  line-height: 1.5em;
}

.direction-r .desc {
  margin: 1em 0 0 0.75em;
}

/* ================ Timeline Media Queries ================ */

@media screen and (max-width: 660px) {

.timeline {
 	width: 100%;
	padding: 4em 0 1em 0;
}

.timeline li {
	padding: 2em 0;
}

.direction-l,
.direction-r {
	float: none;
	width: 100%;

	text-align: center;
}

.flag-wrapper {
	text-align: center;
}

.flag {
	background: rgb(255,255,255);
	z-index: 15;
}

.direction-l .flag:before,
.direction-r .flag:before {
  position: absolute;
  top: -30px;
	left: 50%;
	content: ' ';
	display: block;
	width: 12px;
	height: 12px;
	margin-left: -9px;
	background: #fff;
	border-radius: 10px;
	border: 4px solid rgb(255,80,80);
	z-index: 10;
}

.direction-l .flag:after,
.direction-r .flag:after {
	content: "";
	position: absolute;
	left: 50%;
	top: -8px;
	height: 0;
	width: 0;
	margin-left: -8px;
	border: solid transparent;
	border-bottom-color: rgb(255,255,255);
	border-width: 8px;
	pointer-events: none;
}

.time-wrapper {
	display: block;
	position: relative;
	margin: 4px 0 0 0;
	z-index: 14;
}

.direction-l .time-wrapper {
	float: none;
}

.direction-r .time-wrapper {
	float: none;
}

.desc {
	position: relative;
	margin: 1em 0 0 0;
	padding: 1em;
	background: rgb(245,245,245);
	-webkit-box-shadow: 0 0 1px rgba(0,0,0,0.20);
	-moz-box-shadow: 0 0 1px rgba(0,0,0,0.20);
	box-shadow: 0 0 1px rgba(0,0,0,0.20);
	
  z-index: 15;
}

.direction-l .desc,
.direction-r .desc {
	position: relative;
	margin: 1em 1em 0 1em;
	padding: 1em;
	
  z-index: 15;
}

}

@media screen and (min-width: 400px) and (max-width: 660px) {

.direction-l .desc,
.direction-r .desc {
	margin: 1em 4em 0 4em;
}
ul {
    display: block;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
}

}

        </style>
        
    </head>
    
    <body><link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic' rel='stylesheet' type='text/css'>
        <jsp:include page="header.jsp"/>
        
        <div>
            <h1>HOW TO APPLY</h1>
        <ul>
            <li class="h4 mb-1" style="opacity:0.88;"><h3>Create an Account</h3></li>
		<ul>
                    <p style="color:#000000;opacity:0.75;">Both Students and Prospecitve Studens can create account in the portal. <br>Click on relevant button and fill the details to create a new account</p>
		</ul>
            <li class="h4 mt-1" style="opacity:0.88;"><h3>Verify OTP to activate account</h3> </li>
		<ul>
                    <p style="color:#000000;opacity:0.75;">An OTP will be sent to your mobile number. Login using the username and <br> password and click on 'OTP Verification' tab and enter the OTP to activate your account</p>
		</ul>
                <li class="h4 mt-1" style="opacity:0.88;"><h3>Submit your Grievance</h3></li>
		<ul>
		 <p style="color:#000000;opacity:0.75;">Once the OTP has been verified, you can submit your grievances</p>
		</ul>
	 </ul>
        </div>

        <h1 style="text-align:center">TIMELINE</h1>
<ul class="timeline">

	<!-- Item 1 -->
	<li>
		<div class="direction-r">
                    <div data-aos="fade-left" >
			<div class="flag-wrapper">
				<span class="flag" style="font-size:1.1em" >Grievance submission</span>
				<span class="time-wrapper"><span class="time">Stage-1</span></span>
			</div>
			<div class="desc" style="font-size:1.1em" >Submit grievances related to academics, examination, results, complaints and suggestions related to institutions, management and universities.</div>
                    </div>
		</div>
	</li>
  
	<!-- Item 2 -->
	<li>
		<div class="direction-l">
                    <div data-aos="fade-right">
			<div class="flag-wrapper">
				<span class="flag" style="font-size:1.1em" >Officer in Universities</span>
				<span class="time-wrapper"><span class="time">Stage-2</span></span>
			</div>
			<div class="desc" style="font-size:1em" >A nodal officer at each University/Institution will attend the grievances received and will forward it to the concerned personnel for redressel actions. Portal will be updated with most recent information.</div>
		</div>
                </div>
	</li>

	<!-- Item 3 -->
	<li>
		<div class="direction-r">
                    <div data-aos="fade-left">
			<div class="flag-wrapper">
				<span class="flag" style="font-size:1.1em" >Status Updates</span>
				<span class="time-wrapper"><span class="time">Stage-3</span></span>
			</div>
			<div class="desc" style="font-size:1em" >Comments and actions taken at each level will be updated in the portal</div>
		</div>
                </div>
	</li>
        
        <li>
		<div class="direction-l">
                    <div data-aos="fade-right">
			<div class="flag-wrapper">
				<span class="flag" style="font-size:1.1em" >Continuous monitoring</span>
				<span class="time-wrapper"><span class="time">Stage-4</span></span>
			</div>
			<div class="desc" style="font-size:1em" >Portal will be monitored by Minister's Office and necessary actions will be taken for delayed responses towards grievances submitted.

</div>
                    </div>
		</div>
	</li>
  
</ul>

<script>
  AOS.init();
</script>

    </body>
</html>
