<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Login</title>
		<link rel="shortcut icon" type="image/x-icon" href="<%= request.getContextPath()%>/templates/images/login_icon.png" />
		<link rel="stylesheet"  type="text/css" href="<%= request.getContextPath()%>/templates/css/custom.min.css">
		<!-- Bootstrap -->
    <link href="<%= request.getContextPath()%>/templates/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="<%= request.getContextPath()%>/templates/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- Custom Theme Style -->
    <link href="<%= request.getContextPath()%>/templates/css/custom.min.css" rel="stylesheet">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

  	<link rel="stylesheet prefetch" href="https://cdn.jsdelivr.net/bootstrap.tagsinput/0.8.0/bootstrap-tagsinput.css">
  	<script src="https://code.jquery.com/jquery-3.2.1.js" ></script>
  	<link href="<%= request.getContextPath()%>/templates/js/custom.min.js" rel="stylesheet">
		<link rel="stylesheet" href="<%=request.getContextPath()%>/templates/css/styleLogin1.css">
	</head>
	
	<body id="loginPage">
	    <div class="wrapper" id="home">
	        <div class="container">
	            <div class="logoSite">
	                <img src="<%= request.getContextPath()%>/templates/images/enclave_logo.png" class="logo" height="120px" width="370px" >
	            </div>
	            <div class="formSite">
	                <div>
	                    <form class="formLogin form-group" action="<%= request.getContextPath()%>/login" method="post" name="Login_Form" id="login_form">
	                        <div class="divForm">
	                             <label id="nameForm" class="nameForm">BOOTCAMP MANAGEMENT SYSTEM</label>
	                        </div>
	                        <div class="divEmail">
	                            <input type="email" name="email" class="inputEmail" id="txtemail" placeholder="Email">
	                            <span id="spnEmailStatus"></span>
	                        </div>
	                        <div class="divPassword">
	                            <input type="password" name="password" class="inputPassword" id="txtpassword" placeholder="Password">
	                            <span id="spnPassStatus"></span>
	                        </div>
	                        <div class="button" style="background:transparent; border-top:none; box-shadow:none;">
	                            <input type="submit" class="btnLogIn" value="LOG IN">
	                        </div>
	                        <div class="divForgot">
	                            <a href="#" class="forgotPass"><u>Forgot Password?</u></a>
	                        </div>
	                    </form>	
	                </div>
		       </div>   
	        </div>
		<script type="text/javascript">
			$(document).ready(function() {
				$("#login_form").validate({
					rules : {
						email : "required",
						password : "required",
					},
					messages : {
						email : "Please enter email.",
						password : "Please enter password.",
					}
				});
			});
			$(document).ready(function(e) {
				$('#txtemail').blur(function() {
					var sEmail = $('#txtemail').val();
					if ($.trim(sEmail).length == 0) {
						$('#spnEmailStatus').html('Please enter valid email address!');
						$('#spnEmailStatus').css('color', 'red');
						document.getElementById("btnSubmit").disabled = true;
					}
					if (validateEmail(sEmail)) {
						$('#spnEmailStatus').html('');
						$('#spnEmailStatus').css('color', 'green');
						document.getElementById("btnSubmit").disabled = false;
					} else {
						$('#spnEmailStatus').html('Please enter valid email address!');
						$('#spnEmailStatus').css('color', 'red');
						document.getElementById("btnSubmit").disabled = true;
					}
				});
			});

			function validateEmail(sEmail) {
				var filter = /^([A-Za-z]+.[A-Za-z0-9]*)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
				if (filter.test(sEmail)) {
					return true;
				} else {
					return false;
				}
			}
		</script>
	</div>
	</body>
</html>

