<%@page import="model.bean.Majors"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/templates/inc/dashboard_trainee_trainer.jsp" %>  
<script src="jquery.twbsPagination.min.js"></script>
<script src="http://1892.yn.lt/blogger/JQuery/Pagging/js/jquery.twbsPagination.js" type="text/javascript"></script> 

<%
String classNameContent = "" ;
String classNameContainer = "";
String styleContent = "style=''";
if( user.getRoleId() == 3) {
	classNameContent = "right_col";
	classNameContainer = "container-fluid";
	styleContent = "";
}
%>

<div class="<%= classNameContent%>" <%= styleContent%> id="toggler_contentId" style="background:white; ">
  <div class="<%= classNameContainer%>" id="toggler_containerId">
    <div  class="card mb-3" style="min-height:954px; " >
<!-- Nav -->
       	<div class="alert alert-primary" style="margin-left:-18px; margin-top:60px;"> 
        	<i class="fa fa-fw fa-briefcase" style="font-size:17px; margin-bottom:5px;"></i>
			<strong style="font-size:20px; color:rgb(90, 115, 142)">Majors </strong>
		</div>
		
<!-- Div Page Content -->
        <div>
			  <%
				  String msg = "";
				  if(request.getParameter("msg") != null){
					  boolean check = false;
					  int msgInt = Integer.parseInt((String)request.getParameter("msg"));
					  switch(msgInt) {
						  case 1: {
							  check = true;
							  msg = "You added the major successfully!"; break;
						  }
						  case 2:{
							  check = true;
							  msg = "You edited the major successfully!"; break;
						  }
						  case 3:{
							  check = true;
							  msg = "You deleted the major successfully!"; break;
						  }
						  case 4:{
							  check = true;
							  msg  = "You deleted majors successfully!"; break;
						  }
						  case 5:{
							  check = false;
							  msg  = "This major has existed in the system."; break;
						  }
						  case 6:{
							  check = false;
							  msg  = "No changes!"; break;
						  }
						  case 0:{
							  check = false;
							  msg  = "Error! System have some problems. Please try again."; break;
						  }
				  	  }
					  
					  if( check == false){
						  %>
				        	<div class="alert alert-danger" id="testDiv" style="margin-top:-20px;">
						    	<strong> <%= msg%> </strong>
						  	</div>
						  <%
					  } else {
						  %>
				        	<div class="alert alert-success" id="testDiv1" style="margin-top:-20px;color:rgb(90, 115, 142);background-color: #dff0d8; border:1px solid white;font-size:14px;">
						    	<strong> <%= msg%> </strong>
						  	</div>
						  <%
					  }
				  }
			%>
	  
			<%
				ArrayList<Majors> majors = new ArrayList<Majors>();
				int total = 0;
				if (request.getAttribute("major") != null) {
					majors = (ArrayList<Majors>) request.getAttribute("major");
					total = majors.size();		 
				}
			%>
<!-- Checkbox -->		
	        <script type="text/javascript">
	            $(document).ready(function(){
	                $(document).on('change', '.checkall, .checkitem', function(){
	                    var $_this = $(this);
	                    document.getElementById("deleteall").style.display = "block";
	                    if($_this.hasClass('checkall')){
	                        $('.checkitem').prop('checked', $_this.prop('checked'));
	                    } else {
	                        var $_checkedall = true;
	                        $('.checkitem').each(function(){
	                            if(!$(this).is(':checked')){
	                                $_checkedall = false;
	                            }
	                            $('.checkall').prop('checked', $_checkedall);
	                        });
	                    }
	                    
	                    var $_uncheckedall = true;
	                    $('.checkitem').each(function(){
	                        if($(this).is(':checked')){
	                            $_uncheckedall = false;
	                        }
	                        if($_uncheckedall){
	                            document.getElementById("deleteall").style.display = "none";
	                        }else{
	                            document.getElementById("deleteall").style.display = "block";
	                        }
	                    });
	                });
	            });
	        </script>
	        
<!-- Pagination -->
	        <script type="text/javascript">
	            $(function () {
	                var pageSize = 10; 
	                showPage = function (page) {
	                    $(".contentPage").hide();
	                    $(".contentPage").each(function (n) {
	                        if (n >= pageSize * (page - 1) && n < pageSize * page)
	                            $(this).show();
	                    });
	                }
	                showPage(1);
	                ///** Cần truyền giá trị vào đây **///
	                var totalRows = <%= total%>; // Tổng số sản phẩm hiển thị
	                var btnPage = 5; // Số nút bấm hiển thị di chuyển trang
	                var iTotalPages = Math.ceil(totalRows / pageSize);
	
	                var obj = $('#pagination').twbsPagination({
	                    totalPages: iTotalPages,
	                    visiblePages: btnPage,
	                    onPageClick: function (event, page) {
	                        console.info(page);
	                        showPage(page);
	                    }
	                });
	                console.info(obj.data());
	            });
	        </script>
	        
<!-- Style Pagination -->
	        <style>
	           ///** CSS căn id pagination ra giữa màn hình **///
	           #pagination {
	               display: flex;
	               display: -webkit-flex; /* Safari 8 */
	               flex-wrap: wrap;
	               -webkit-flex-wrap: wrap; /* Safari 8 */
	               justify-content: center;
	               -webkit-justify-content: center;
	           }
	       </style>
	       
<!-- Content -->
		   <div class="card-body" style="height:auto;">
		         <div class="table-responsive" style="overflow-x: inherit;margin-top:20px;">
           			<form action="<%= request.getContextPath()%>/major/del"  method="post">
          				<div style="margin-left: -10px; margin-bottom: 5px;">
            				<div style="float: right;" >
			            		<button style="padding-left:25px; padding-right:25px;border-color:white;width:auto; font-size:15px; height:auto; margin-bottom:10px; margin-left: 10px;"
			            				type="button" class="btn btn-round btn-primary" data-toggle="modal" data-target="#addModal" role="button">Add new major
	            				</button>
			        		</div>
			            	<div style="float: right; ">
			            		<input class="btn btn-round btn-danger" style="padding-left:25px; padding-right:25px;font-size:15px;display: none; width:auto; margin-left: 10px; margin-bottom: 10px; border:1px solid white;" 
			            			   onclick="return confirm('Do you want to delete these majors?')" id="deleteall" type="submit" value="Delete major">
			               	</div>
		              		<div style="clear: both">
		              		</div>
	       				</div>
		                <table  id="myTable" class="table table-bordered" width="100%" id="dataTable" cellspacing="0">
							<thead>
		                    	<tr>
									<th style="text-align: center; font-size: medium; color:rgb(90, 115, 142);">Delete All
			                      		<input 	style="display: inline-block; margin-left: 15px;vertical-align: middle; margin-top: -3px;" 
			                      				type="checkbox" class="checkall">
			                      	</th>
									<th style="text-align: center; font-size: medium;color:rgb(90, 115, 142);" >Name</th>
									<th style="text-align: center; font-size: medium;color:rgb(90, 115, 142);">Action</th>
			                    </tr>
		                  	</thead>
                  			<tbody>
				                  <%
				                  	for (Majors list: majors){
				                  %>
							   <tr class="contentPage" style="vertical-align: middle;">
								   <td   style="text-align: center; vertical-align: middle;"> 
								   		<input 	style="vertical-align: middle;" type="checkbox" name="major<%= list.getMajorId()%>" 
								   				value="<%= list.getMajorId()%>" class="checkitem" id="chkitem"> 
							   	   </td>
				                   <td style="text-align: center; vertical-align: middle; font-size:14px;color:rgb(90, 115, 142);"><%=list.getName()%></td>
								   <td style="text-align: center; vertical-align: middle; color:rgb(90, 115, 142);">
				                   		<button type="button" class="btn btn-link" name="editMajor" style="" data-toggle="modal"
				                    			data-target="#editModal<%=list.getMajorId()%>">
				                    	<i class="fa fa-edit" style="font-size:20px;  vertical-align:middle; margin-top:5px;"></i>
			                    		</button>
				                    	<a 	href="<%= request.getContextPath()%>/major/del?id=<%= list.getMajorId()%>" 
				                    		onclick="return confirm('Do you want to delete major : <%= list.getName()%>?')" name="deleteMajor" >
					                    	<i class="fa fa-trash" style="color:rgb(220, 53, 69) ;font-size:20px; vertical-align:middle;"></i>
				                    	</a>
				                   </td>          
			                   </tr>
<!-- Edit list -->
			                  <div class="modal fade" id="editModal<%=list.getMajorId()%>" role="dialog">
									<div class="modal-dialog">
										<!-- Modal content-->
										<div class="modal-content">
											<div class="modal-header alert alert-primary">
												<h5 class="modal-title " style="float:left;">
													<i class="fa fa-fw fa-edit"></i>
													<strong style="font-size:16px; color:rgb(90, 115, 142); ">Edit Major</strong>
												</h5>
											</div>
											<div class="modal-body">
												<form id="add-post2" action="/managementSystem/major/edit?id=<%=list.getMajorId()%>" method="POST">
													<div class="form-group">
														<label class="required"><strong style="font-size:15px;">Major Name:</strong>
															<span style="color: red"> *</span>&nbsp;<span id="spnNameStatus"></span>
														</label>
														<input style="font-size:15px;"	class="form-control" id="majorname" type="text" name="name" value="<%=list.getName()%>"
																placeholder="Major Name" required />
													</div>
													<div style="text-align:center;">
														<button type="submit" class="btn btn-primary" style="width:100px; font-size:15px; border:1px solid white;" id="btnSubmit">Save 
														</button>
														<button style="width:100px; " type="button" class="btn btn-default" data-dismiss="modal">Close
														</button>
													</div>
												</form>
											</div>
										</div>
									</div>
								</div>
						 
<!-- Add Modal -->
								<div class="modal fade" id="addModal" role="dialog">
									<div class="modal-dialog">
										<!-- Modal content-->
										<div class="modal-content">
											<form id="add-post1" action="/managementSystem/major/add" method="POST">
												<div class="modal-header alert alert-primary">
													<h5 class="modal-title" style="float:left; color:rgb(90, 115, 142); font-size:16px;">
														<i style="size: 20px;" class="fa fa-fw fa-plus-square"></i>
														<strong>Add new major</strong>
													</h5>
												</div>
												<div class="modal-body">
													<div class="form-group">
														<label class="required">
															<strong style="font-size:15px;">Major Name:</strong>
															<span style="color: red"> *</span>&nbsp;
															<span id="spnNameStatus1"></span>
														</label>
														<input 	style="font-size:15px;" class="form-control" id="majorname1" type="text"
																name="name" placeholder="Major Name" required />
													</div>
													<div style="text-align: center;" >
														<button type="submit" class="btn btn-primary" id="btnSubmit"
														 		style="width:100px; font-size:15px; border:1px solid white;" >Add 
												 		</button>
														<button style="width:100px;" type="button" class="btn btn-default" data-dismiss="modal">Close
														</button>
													</div>
												</div>
											</form>
										</div>
									</div>
								</div>
									<%
				                  	}
				                  	%>
                  
               			</tbody>
	                </table>
	                <div id="pager" style="float: left; margin-top:-25px;">
						<ul id="pagination" class="pagination-sm"></ul>
					</div>
				</form>
	      </div>
    </div>
<!-- Footer -->
<!--     <div class="card-footer small text-muted" style="margin-top: 40px;">
      	Updated yesterday at 11:59 PM
    </div> -->
    
   
  </div>
</div>


</div>
</div>
 <footer style="background:#EDEDED; padding:15px 20px; display:block;"> 
          <div class="pull-right">
            Updated yesterday at 11:59 PM by Team A.
          </div>
          <div class="clearfix"></div>
</footer>








