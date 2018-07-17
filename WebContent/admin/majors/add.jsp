<%@page import="model.bean.Skills"%>
<%@page import="model.bo.SkillBo"%>
<%@page import="model.bean.Majors"%>
<%@page import="model.bean.Roles"%>
<%@page import="java.util.List"%>
<%@page import="model.bo.RoleBo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/inc/dashboard.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
<div class="content-wrapper py-3">
	<div class="container-fluid">
		<div class="card mb-3">
        <div class="alert alert-primary" style="font-size: larger;margin-bottom: 0px;"> 
             <i class="fa fa-fw fa-book" ></i>
	    	<h5><strong>Add new major</strong></h5>
	  	</div>
	  	</div>
			  	<%
				if(request.getAttribute("Error") != null){
				%>
				<div class="alert alert-danger">
				  <strong>Error!</strong><%= request.getAttribute("Error")%>
				</div>
				<%
				}
			  	%>
			  </div>
			  <div>
			  	<%
				if(request.getAttribute("Success") != null){
				%>
				<div class="alert alert-success">
				  <strong>Success!</strong><%= request.getAttribute("Success")%>
				</div>
				<%
				}
			  	%>
			  </div> 
			<form id="add-post" action="/managementSystem/AddNewMajor" method="POST">
				<div style="height: 5%"></div>
				<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-5" style="float: left">
					<div class="form-group">
						<label class="required">
							<strong>Major Name:</strong>
							<span style="color: red"> *</span>
						</label>
						<input class="form-control" id="txtname" type="text" name="name" placeholder="Major Name" required />
					</div>
					
				<div class="col-md-5"></div>
				<div>
					<button type="submit" class="btn btn-success">Add Major</button>
					<div style="margin-bottom: 10%"></div>
				</div>
				</div>
				</div>
			</form>

		</div>

</body>
</html>
<%@include file="/templates/inc/footer.jsp"%>