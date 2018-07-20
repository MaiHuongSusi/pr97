<%@page import="model.bean.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="icon" href="<%= request.getContextPath()%>/templates/images/logo.png" type="image/ico" />
    <title>Bootcamp Management System</title>
    <link href="<%= request.getContextPath()%>/templates/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%= request.getContextPath()%>/templates/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="<%= request.getContextPath()%>/templates/css/custom.min.css" rel="stylesheet">
  	<script src="<%= request.getContextPath()%>/templates/vendor/jquery/dist/jquery.min.js"></script>
  	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  	<link rel="stylesheet prefetch" href="https://cdn.jsdelivr.net/bootstrap.tagsinput/0.8.0/bootstrap-tagsinput.css">
  	<script src="https://code.jquery.com/jquery-3.2.1.js" ></script>
  	<script src="http://1892.yn.lt/blogger/JQuery/Pagging/js/jquery.twbsPagination.js" type="text/javascript"></script>
  	<script async="" src="https://www.google-analytics.com/analytics.js"></script>
  	<link href="<%= request.getContextPath()%>/templates/js/custom.min.js" rel="stylesheet">
  	<link rel="stylesheet" href="<%=request.getContextPath()%>/templates/css/styleDashboardTraineeTrainer.css">
  	<link rel="stylesheet" href="<%=request.getContextPath()%>/templates/css/styleBubbling.css">
  	<script src="<%= request.getContextPath()%>/templates/js/bubbling.js"></script>
  </head>
  <style>
	.mySlides {display:none;}
  </style>
  <body>
  <% User user = (User)session.getAttribute("user"); %>
      <div class="wrapper">
      	<header>
        	<nav>
            	<div class="menu-icon">
                	<i class="fa fa-bars fa-2x"></i>
                </div>
                <div class="logo">
	                <img src="<%= request.getContextPath()%>/templates/images/enclave_logo.png" style="height:72px; width:200px; margin-top:-4px;"/>
                </div> 
                <div class="menu">
                	<ul>
	                    <li><a href="#" style="padding:10px 40.5px; border:1px solid #bababa; border-radius:50px;">Schedule</a></li>
	                    <li><a href="#" style="padding:10px 33px; border:1px solid #bababa; border-radius:50px;">Registation</a></li>
	                    <li><a href="#" style="padding:10px 20px; border:1px solid #bababa; border-radius:50px;">Registed Class</a></li>
                        <li>
                        	<a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
        						<img src="<%=request.getContextPath()%>/templates/images/img.jpg" alt="" style="width:40px; height:40px; border:1px solid rgb(210, 209, 208);">
        						<label style="color:#000; font-weight:500;">Hetty</label>
        						<span class=" fa fa-angle-down"></span>
      						</a>
								<ul class="dropdown-menu dropdown-usermenu pull-right" style="width:244px; margin-top:0;">
	    							<li><a href="javascript:;"> Profile</a></li>
	   								<li><a href="<%=request.getContextPath()%>/login"><i class="fa fa-sign-out pull-right" style="vertical-align:middle; margin-top:3px; margin-left:117px;"></i> Log Out</a></li>
	  							</ul>
    					</li>

                                    
                    </ul>
                </div>
       		</nav>
   		</header>
   		
                  
		<div class="slide" style="width:100%; ">
			<img class="mySlides" src="<%= request.getContextPath()%>/templates/images/s5.jpg" style="width:100%">
			<img class="mySlides" src="<%= request.getContextPath()%>/templates/images/s3.jpg" style="width:100%">
			<img class="mySlides" src="<%= request.getContextPath()%>/templates/images/s11.jpg" style="width:100%">
			<img class="mySlides" src="<%= request.getContextPath()%>/templates/images/s12.jpg" style="width:100%">
			<img class="mySlides" src="<%= request.getContextPath()%>/templates/images/s17.jpg" style="width:100%">
			<img class="mySlides" src="<%= request.getContextPath()%>/templates/images/s23.jpg" style="width:100%">
			<img class="mySlides" src="<%= request.getContextPath()%>/templates/images/s4.jpg" style="width:100%">
			
			<div class="centered" >
				<div class="center-outer" >
					<div class="center-inner" >
						<div class="bubbles">
							<label class="txt1">BOOTCAMP MANAGEMENT</label><br> 
							<label class="txt2">SYSTEM</label>
						</div>
					</div>
				</div>
			</div>
			
		<!-- Test svg -->
				<div class="mouse">
				<a href="#main">
					<div class="center-outer">
						<div class="center-inner">
							<div class="scroll-down abs-bc clickable scroll-to tablet-hide" data-position="100%">
		                		<svg xmlns="http://www.w3.org/2000/svg" width="88.149" preserveAspectRatio="xMinYMin meet" 
		                				viewBox="0 0 88.149 146.597" class="svg-scroll onload--fadedown" 
		                				style="opacity: 1; transform: matrix(0.5, 0, 0, 0.5, 0, 0);">
	                				<path style="fill:#3f3d3d" class="svg-scroll__path trans" d="M44.075 145.597C19.772 145.597 0 125.825 0 101.522V44.074C0 19.771 19.772 0 44.075 0s44.074 19.771 44.074 44.074v57.448c0 24.303-19.772 44.075-44.074 44.075zm0-140.262c-21.361 0-38.74 17.378-38.74 38.739v57.448c0 21.361 17.378 38.739 38.74 38.739 21.361 0 38.739-17.378 38.739-38.739V44.074c0-21.361-17.378-38.739-38.739-38.739z">
		                			</path>
		                			<circle style="fill:#3f3d3d"class="svg-scroll__dot" cx="44.074" cy="50.324" r="7.529"></circle>
				     			</svg>            
		                	</div>
						</div>
					</div>
					</a>
				</div>
			
		<!-- Test svg -->	
		</div>
		
		<!-- Main Content -->
		<div id="main" class="main" style="background: white;">
			<div id="row1" class="row" style="background:rgb(234, 233, 231)">
				<div class="col-sm-6 img1">
					<img class="i1" src="<%= request.getContextPath()%>/templates/images/i1.jpg"/>
				</div>
				<div class="col-sm-6 textrow1" style="padding:140px 180px;">
					<h1 style="color:#3f3d3d;font-size:42px;font-family:FuturaBt Book;">The Magic</h1><br>
					<p style="color:#3f3d3d;font-family:FuturaBt MediumItalic, Verdana, Arial, sans-serif; font-size:22px; ">All success comes from trying to train and cultivate yourself. We provide you with a modern working environment. 
					Join us now to feel the difference!</p>
				</div>
			</div>
			<div id="row2" class="row">
				<div class="col-sm-6 textrow2" style="padding:140px 180px;">
					<h1 style="color:#3f3d3d;font-size:42px;font-family:FuturaBt Book;">The Magic</h1><br>
					<p style="color:#3f3d3d;font-family:FuturaBt MediumItalic, Verdana, Arial, sans-serif; font-size:22px; ">All success comes from trying to train and cultivate yourself. We provide you with a modern working environment. 
					Join us now to feel the difference!</p>
				</div>
				<div class="col-sm-6 img2">
					<img class="i1" src="<%= request.getContextPath()%>/templates/images/i6.jpg"/>
				</div>
				
			</div>
		
		</div>
		<!-- Main Content -->
		
	</div>
	
	
	<script>
		var myIndex = 0;
		carousel();
		
		function carousel() {
		    var i;
		    var x = document.getElementsByClassName("mySlides");
		    for (i = 0; i < x.length; i++) {
		       x[i].style.display = "none";  
		    }
		    myIndex++;
		    if (myIndex > x.length) {myIndex = 1}    
		    x[myIndex-1].style.display = "block";  
		    setTimeout(carousel, 5000); // Change image every 5 seconds
		}
		</script>
		
      	<script type="text/javascript">

      		// Menu-toggle button

		      $(document).ready(function() {
		            $(".menu-icon").on("click", function() {
		                  $("nav ul").toggleClass("showing");
		            });
		      });

      		// Scrolling Effect

		      $(window).on("scroll", function() {
		            if($(window).scrollTop()) {
		                  $('nav').addClass('black');
		            }
		
		            else {
		                  $('nav').removeClass('black');
		            }
		      })
      	</script>
      	
	    <!-- jQuery -->
	    <script src="<%= request.getContextPath()%>/templates/vendors/jquery/dist/jquery.min.js"></script>
	    <!-- Bootstrap -->
	    <script src="<%= request.getContextPath()%>/templates/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
	    <!-- Custom Theme Scripts -->
	    <script src="<%= request.getContextPath()%>/templates/js/custom.min.js"></script>
	  
  </body>
</html>
