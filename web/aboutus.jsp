<%-- 
    Document   : aboutus1
    Created on : 17 Jan, 2020, 9:40:36 AM
    Author     : manojkulkarni
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
<meta charset="UTF-8">
<title>Bootstrap 3 Carousel</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<style>
.carousel-inner .item{
	background: #a7cfdf; /* Old browsers */
	background: -moz-linear-gradient(top,  #a7cfdf 0%, #23538a 100%); /* FF3.6-15 */
	background: -webkit-linear-gradient(top,  #a7cfdf 0%,#23538a 100%); /* Chrome10-25,Safari5.1-6 */
	background: linear-gradient(to bottom,  #a7cfdf 0%,#23538a 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#a7cfdf', endColorstr='#23538a',GradientType=0 ); /* IE6-9 */
    text-align: center;
    height: 500px;/*change as your needs*/
}
.control-buttons{
	text-align:center;
}
.transition-timer-carousel-progress-bar {
    height: 3px;
    background-color: #5cb85c;/*progress bar color*/
    width: 0;
    margin: 0 0 0 0;
    border: none;
    z-index: 11;
    position: relative;
}
.carousel-control{
	z-index: 11;
}
@import url('https://fonts.googleapis.com/css?family=Roboto');
body{
   margin:0;
   padding-top:120px;
   font-family: 'Roboto', sans-serif;
   position:relative;
}
nav{
   width:100%;
   height:100px;
   background-color:rgba(51, 51, 51, 0.3);
   position:absolute;
   top:0;
   z-index:5;
}
.header{
   width:100%;
   height:500px;
   opacity:.8;
   background-color:rgb(30, 173, 255);
   background-image:url('https://res.cloudinary.com/arpr/image/upload/v1541394028/architecture-building-campus-207684.jpg');
   background-size:cover;
   background-position:bottom;
}
.container{
   width:100%;
}
.container h1{
   font-size:50px
}
.about{
   padding:5% 0;
   width:100%;
   height:auto;
   background-color:#fff;
}
.about .left{
   padding:2% 0;
   float:left;
   width:50%;
   display:inline-block;
}
.about .right{
   width:50%;
   display:inline-block;
}
.about .right img{
   width:100%
}
.about .left h1{
   text-align:center;
   color:#1EADFF;
   margin:0 0 10px 0;
}
.about .left hr{
   width:20%;
   border-top:2px solid #000;
   border-bottom:none;
}
.about .left p{
   font-size:1rem;
   margin:40px auto;
   width:80%
}

.mission{
   padding:5% 0;
   width:100%;
   height:auto;
   background-color:#fff;
}
.mission .right{
   padding:2% 0;
   width:50%;

   display:inline-block;
}
.mission .left{
   float:left;
   width:50%;

   display:inline-block;
}
.mission .left img{
   width:100%;
}
.mission .right h1{
   text-align:center;
   color:#1EADFF;
   margin:0 0 20px 0;
}
.mission .right hr{
   width:35%;
   border-top:2px solid #000;
   border-bottom:none;
}
.mission .right p{
   font-size:1rem;
   margin:40px auto;
   width:80%
}


.team{
   width:90%;
   margin:auto;
   padding:5% 5%;
   over-flow:hidden;
}
.team h1{
   text-align:center;
   color:#1EADFF;
   
}
.team h1 hr{
   width:15%;
   border-top:2px solid #000;
   background-color:transperant;
   border-bottom:none;
   margin-bottom:50px;
}
.team .card{
   padding-bottom:20px;
   padding-top:20px;
 
   position:relative;
   min-width:30%;
   height:500px !important;
   height:auto;
   background-color:#fff;
   display:inline-table;
   margin:40px 1.5%;
   box-shadow: 0 0 20px 2px rgba(0,0,0,0.5);
   text-align:center;
}
.card .circle-container{
   position:relative;
   background-color:#579f79;
   width:250px;
   height:250px;
   border:none;
   border-radius:50%;
   margin:auto;
   color:#fff;
}
.circle-container h1{
   position:absolute;
   top:50%;
   left:50%;
   transform:translate(-50%,-50%);
   margin:0;
   font-size:60px;
}

.team .card h2{
   text-align:center;
   margin:30px 0 0 0;
}
.team .card h4{
   text-align:center;
   margin:10px 0 0 0;
}
.team .card p{
   width:250px;
   margin:30px auto;
   text-align:center;

}
.clear{
    clear: both;			
}
/* media */
@media(max-width:1200px){
   .mission .right p{
      font-size:.8rem;
      margin:20px auto;
   }
   .about .left p{
      font-size:.8rem;
      margin:20px auto;
   }
}






@media(max-width:992px){
   .about .left{
   width:100%; 
}
   .about .right{
   width:100%; 
}
      .mission .left{
   width:100%; 
}
   .mission .right{
   width:100%; 
}
   .team .card{ 
   width:40%;
}   
}

@media(max-width:768px){
      .team .card{ 
   width:80%;
} 
   nav{
      height:80px;
   }
}
</style>
<script>
$(document).ready(function(){
	var percent = 0,
	interval = 30,//it takes about 6s, interval=20 takes about 4s
	$bar = $('.transition-timer-carousel-progress-bar'),
	$crsl = $('#myCarousel');
	$('.carousel-indicators li, .carousel-control').click(function (){$bar.css({width:0.5+'%'});});
	/*line above just for showing when controls are clicked the bar goes to 0.5% to make more friendly, 
	if you want when clicked set bar empty, change on width:0.5 to width:0*/
	$crsl.carousel({//initialize
		interval: false,
		pause: true
	}).on('slide.bs.carousel', function (){percent = 0;});//This event fires immediately when the bootstrap slide instance method is invoked.
	function progressBarCarousel() {
		$bar.css({width:percent+'%'});
		percent = percent +0.5;
		if (percent>=100) {
			percent=0;
			$crsl.carousel('next');
		}
	}
	var barInterval = setInterval(progressBarCarousel, interval);//set interval to progressBarCarousel function
	if (!(/Mobi/.test(navigator.userAgent))) {//tests if it isn't mobile
		$crsl.hover(function(){
					clearInterval(barInterval);
				},
				function(){
					barInterval = setInterval(progressBarCarousel, interval);
				}
		);
	}
});
</script>
</head>
 <!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
    <body>
 <jsp:include page="header.jsp"/>
       <div id="myCarousel" class="carousel slide myCarousel" data-interval="false" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
  </ol> 
  <!-- Carousel items -->
  <div class="carousel-inner">
    <div class="active item">
      <!--put img inside itens like this-->
      <!--<img src="" alt="...">-->
        <div class="container">
    <div class="carousel-caption">
          <h3>First slide label</h3>
          <p>It's Responsive and Pauses on hover</p>
        </div>
        </div>
    </div>
    <div class="item">
        <div class="container">
        <div class="carousel-caption">
          <h3>Second slide label</h3>
          <p>If you use controls, progress bar will change too.</p>
        </div>
        </div>
    </div>
    <div class="item">
        <div class="container">
        <div class="carousel-caption">
          <h3>Third slide label</h3>
          <p>Bug fixed</p>
        </div>
        </div>
    </div>
  </div>
  <hr class="transition-timer-carousel-progress-bar" />
  <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
    <div class="container">
   
   <div class="team">
      <div>
         <h1>About us</h1>
         <hr>
         <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>

                  <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>

      </div>
      
      <div class="clear"></div>
   </div>
   
   
   
   
   
   
  
       <div class="team">
      
          
          
          
      <div  class="card">
         <div class="circle-container">
            <h1 style="color:#fff;">M</h1>
         </div>
         <h2>Mahesh E U</h2>
         <h4>Technical Lead</h4>
         <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
      </div>
          
          
          
      <div class="card">
         <div class="circle-container">
            <h1 style="color:#fff;">M</h1>
         </div>
         <h2>Mridul</h2>
         <h4>Evangelist</h4>
          <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
      </div>
          
          
          
      <div class="card">
         <div class="circle-container">
            <h1 style="color:#fff;">R</h1>
         </div>
         <h2>Rajesh</h2>
         <h4>Evangelist</h4>
          <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
      </div>
          
          
          
      
   </div>

   
</div>
 <jsp:include page="footer.jsp"/>
  </body>
</html>
