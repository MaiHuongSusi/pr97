<%@page import="model.bean.Skills"%>
<%@page import="model.bo.SkillBo"%>
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
<title>Insert title here</title>
</head>
<body>
<div class="content-wrapper py-3">
	<div class="container-fluid">
		<div class="card mb-3">
        <div class="alert alert-primary" style="font-size: larger;margin-bottom: 0px;"> 
             <i class="fa fa-fw fa-book" ></i>
	    	<strong>Add new room</strong>
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
			<form id="add-post" action="/managementSystem/AddNewRoom" method="POST">
				<div style="height: 5%"></div>
				<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-5" style="float: left">
					<div class="form-group">
						<label class="required"><strong>Room Name:</strong><span
							style="color: red"> *</span></label> <input class="form-control"
							id="txtname" type="text" name="name"
							placeholder="Room Name" required />
					</div>
					<strong>Status:</strong><span
							style="color: red"> *</span><br>
  						<input type="radio" name="status" value="1" checked> Available<br>
  						<input type="radio" name="status" value="0"> Occupied
				</div>
				<div class="col-md-5" style="float: right">
					<div class="form-group">
						<label class="required"><strong>Capacity:</strong><span
							style="color: red"> *</span></label> <input class="form-control"
							id="txtname" type="text" name="capacity"
							placeholder="Capacity" required />
					</div>
				</div>
				<div class="col-md-5"></div>
				<div>
					<button type="submit" class="btn btn-success">Add Room</button>
					<div style="margin-bottom: 10%"></div>
				</div>
				</div>
			</form>

		</div>
	</div>
</div>
</body>
</html>
<%@include file="/templates/inc/footer.jsp"%>