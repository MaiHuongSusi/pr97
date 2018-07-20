<%@page import="model.bean.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
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
  </head>

  <body class="nav-md" style="">
	<% User user = (User)session.getAttribute("user"); %>
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view" style="">
            <div class="navbar nav_title" style="height:59px;border: 0; background:rgb(237, 237, 237);border-bottom: 1px solid #D9DEE4;border-right: 1px solid rgb(213, 212, 208);">
              <a href="index.html" class="site_title">
              	<i class="" style="border:none;">
		        	<img src="<%= request.getContextPath()%>/templates/images/logo.png" style="border:none; height:43px; margin-top:-7px;"/>
              	</i> 
              	<img src="<%= request.getContextPath()%>/templates/images/logo2.png" style="border:none; height:46px; margin-top:0px; margin-left:-11px;"/>
              </a>
            </div>

            <div class="clearfix"></div>

            <!-- menu profile quick info -->
            <div class="profile clearfix" style="">
              <div class="profile_pic">
                <img src="<%= request.getContextPath()%>/templates/images/img.jpg" alt="..." class="img-circle profile_img">
              </div>
              <div class="profile_info">
                <span>Welcome,</span>
                <h2><%= user.getUsername()%></h2>
              </div>
            </div>
            <!-- /menu profile quick info -->

            <br />

            <!-- sidebar menu -->
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
                <h3>General</h3>
                <ul class="nav side-menu">
                  <li><a class="" href="<%= request.getContextPath()%>/trainee/index"><i class="fa fa-user"></i> Trainee <span class="fa fa-chevron-down"></span></a>
                    
                  </li>
                  
                  <li><a class="" href="<%= request.getContextPath()%>/trainer/index"><i class="fa fa-user"></i> Trainer <span class="fa fa-chevron-down"></span></a>
                    
                  </li>
                  
                  <li><a class="" href="<%= request.getContextPath()%>/major"><i class="fa fa-briefcase"></i> Major <span class="fa fa-chevron-down"></span></a>
                    
                  </li>
                  
                  <li><a class="" href="<%= request.getContextPath()%>/course/index"><i class="fa fa-book"></i> Course <span class="fa fa-chevron-down"></span></a>
                    
                  </li>
                  
                  <li><a class="" href="<%= request.getContextPath()%>/classes/index"><i class="fa fa-object-group"></i> Class <span class="fa fa-chevron-down"></span></a>
                    
                  </li>
                  
                  <li><a class="" href="<%= request.getContextPath()%>/room"><i class="fa fa-home"></i> Room <span class="fa fa-chevron-down"></span></a>
                    
                  </li>
                  
                  <li><a class="" href="<%= request.getContextPath()%>/Skills"><i class="fa fa-graduation-cap"></i> Skill <span class="fa fa-chevron-down"></span></a>
                    
                  </li>
                  
                  <li><a class="" href="#statistical"><i class="fa fa-bar-chart-o"></i> Statistic <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu" id="statistical">
                      <li><a style="color:white; font-size:12px; padding:9px; font-weight:500; position:relative; display:block;" href="<%= request.getContextPath()%>/statistical/trainee">Trainees</a></li>
                      <li><a style="color:white; font-size:12px; padding:9px; font-weight:500; position:relative; display:block;"  href="<%= request.getContextPath()%>/statistical/result">Class's Quality</a></li>
                    </ul>
                  </li>
                </ul>
			  </div>
            </div>
            <!-- /sidebar menu -->

            <!-- /menu footer buttons -->
            <div class="sidebar-footer hidden-small" style="">
              <a data-toggle="tooltip" data-placement="top" title="Settings" style="">
                <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="FullScreen" style="">
                <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="Lock" style="">
                <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="Logout" href="<%=request.getContextPath()%>/login" style="">
                <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
              </a>
            </div>
            <!-- /menu footer buttons -->
          </div>
        </div>

        <!-- top navigation -->
        <div class="top_nav">
          <div class="nav_menu">
            <nav>
              <div class="nav toggle">
                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
              </div>

              <ul class="nav navbar-nav navbar-right">
                <li class="">
                  <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    <img src="<%=request.getContextPath()%>/files/<%= user.getAvatar()%>" alt="<%= user.getUsername()%>" ><%= user.getUsername()%>
                    <span class=" fa fa-angle-down"></span>
                  </a>
                  <ul class="dropdown-menu dropdown-usermenu pull-right">
                    <li><a href="javascript:;"> Profile</a></li>
                    <li><a href="<%=request.getContextPath()%>/login"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
                  </ul>
                </li>

                <li role="presentation" class="dropdown">
                  <a href="javascript:;" class="dropdown-toggle info-number" data-toggle="dropdown" aria-expanded="false">
                    <i class="fa fa-envelope-o"></i>
                    <span class="badge bg-green">6</span>
                  </a>
                  <ul id="menu1" class="dropdown-menu list-unstyled msg_list" role="menu">
                  </ul>
            </nav>
          </div>
        </div>  
    </div>

    <!-- jQuery -->
    <script src="<%= request.getContextPath()%>/templates/vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="<%= request.getContextPath()%>/templates/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- Custom Theme Scripts -->
    <script src="<%= request.getContextPath()%>/templates/js/custom.min.js"></script>
  
  </body>
</html>
