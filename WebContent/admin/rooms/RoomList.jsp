<%@page import="model.bean.Rooms"%>
<%@page import="model.bean.Schedule"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/templates/inc/dashboard.jsp" %>  
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
<div class="<%= classNameContent%>" <%= styleContent%> style="background:white; ">
  <div class="<%= classNameContainer%>">
    <div class="card mb-3" style="min-height:954px;" >
        <div class="alert alert-primary" style="margin-left:-23px; margin-top:60px;"> 
             <i class="fa fa-fw fa-home" style="font-size:21px; margin-bottom:5px;"></i>
             	<strong style="font-size:20px; color:rgb(90, 115, 142)">Room List</strong>
			  </div>	
			 
			  
         
         <%			int check=0;
                  	ArrayList<Rooms> roomlist = (ArrayList<Rooms>) request.getAttribute("roomList");
         		
         			int k=0;
         			int tong = roomlist.size();
        	
        	
        	String msg = "";
	  if(request.getParameter("msg") != null){
		  boolean check1 = false;
		  int msgInt = Integer.parseInt((String)request.getParameter("msg"));
		  switch(msgInt) {
		  case 1: {
			  check1 = false;
			  msg = "This username is already exists in system"; break;
		  }
		  case 2:{
			  check1 = true;
			  msg = "You added the room successfully!"; break;
		  }
		  case 3:{
			  check1 = true;
			  msg = "You edited the room successfully!"; break;
		  }
		  case 4:{
			  check1 = true;
			  msg  = "You deleted room successfully"; break;
		  }
		  case 0:{
			  check1 = false;
			  msg  = "Error! System have some problems. Please try again"; break;
		  }
		  }
		   if( check1 == false){
		  %>
        	<div class="alert alert-danger" id="testDiv" style="margin-top:-20px;">
		    	<strong> <%= msg%> </strong>
		  	</div>
		  <%
		  } else {
			  %>
	        	<div class="alert alert-success" id="testDiv1" style="margin-top:-20px;">
			    	<strong> <%= msg%> </strong>
			  	</div>
			  <%
		  }
	  }
	  %>
        	

       
<!-- Show room -->			  	

        <div class="card-body"  style="height:auto;">
          <div class="table-responsive" style="overflow-x: inherit;">
                <div style="margin-left: -15px; margin-bottom: 5px;">
	            	<div style="float: left" >
	            	<button style=";border-color:white;width:auto; font-size:15px; height:auto; margin-bottom:10px; margin-left: 14px;"
	            	type="button" class="btn btn-round btn-primary" data-toggle="modal" data-target="#addModal" role="button">Add new room</button>
	        		</div>
	            	<div style="float: left; margin-left: 15px;">
	            	<input class="btn btn-danger" style="display: none; margin-left: 10px; margin-bottom: 5px;" onclick="return confirm('Do you want to delete these rooms?')" id="deleteall" type="submit" value="Delete rooms">
                	</div>
                	<div style="clear: both"></div>
	        	</div>
	        	<table id="myTable" class="table-bordered" style="width: 100%;">
                  <thead>
                    <tr style="height:50px;">
                      <th style="text-align: center; font-size: medium; color:rgb(90, 115, 142);">No.</th>
                      <th style="text-align: center; font-size: medium; color:rgb(90, 115, 142);">Name</th>
                      <th style="text-align: center; font-size: medium; color:rgb(90, 115, 142);">Capacity</th>
                      <th style="text-align: center; font-size: medium; color:rgb(90, 115, 142);">Status</th>
                      <th style="text-align: center; font-size: medium; color:rgb(90, 115, 142);">Action</th>
                   
                    </tr>
                  </thead>
                  <tbody>
                  
                  	<%
                  	for (Rooms rooms: roomlist){
                  		k++;
                  %>
				   <tr class="contentPage" style="">
				   <td style="text-align: center; vertical-align: middle; font-size:14px;color:rgb(90, 115, 142);" ><%=k %></td>
                  <td style="text-align: center; vertical-align: middle; font-size:14px;color:rgb(90, 115, 142);"><%= rooms.getName() %></td>
                  <td style="text-align: center; vertical-align: middle;font-size:14px;color:rgb(90, 115, 142);" ><%= rooms.getCapacity()%></td>
                  <%if(rooms.getStatus()==0){
                	  %>
		                    <td  id="" style='text-align: center;"'><a><img alt="" src="<%= request.getContextPath()%>/templates/images/deactive.gif"></a></td>
                	  <%
                  } else {
                	  %>
		                    <td id=""  style='text-align: center;'><a  ><img alt="" src="<%= request.getContextPath()%>/templates/images/active.gif"></a></td>
                	  <%
                  }
                   %>  
                  <td style="text-align: center; vertical-align: middle;color:rgb(90, 115, 142);">
                   <button type="button" class="btn btn-link" name="editRoom" style="font-size:28px;" data-toggle="modal"
                    data-target="#editModal<%=rooms.getRoomId()%>"><i class="fa fa-edit" style="font-size:16px; margin-bottom: 10px !important; "></i></button>
                   
                   </td>
                   
                  </tr>
                  
<!-- Edit room -->
                  <div class="modal fade" id="editModal<%=rooms.getRoomId()%>" role="dialog">
						<div class="modal-dialog">
							<!-- Modal content-->
							<div class="modal-content">
								<div class="modal-header alert alert-primary">
								<h4 class="modal-title " style="float:left; color:rgb(90, 115, 142);"><i class="fa fa-fw fa-home" style="font-size:20px;"></i><strong>Edit room</strong></h4>
								</div>
								<div class="modal-body">
									<form id="add-post2" action="/managementSystem/EditRoomController?id=<%=rooms.getRoomId()%>" method="POST">
										<div class="form-group">
											<label class="required"><strong style="color:rgb(90, 115, 142);">Room Name:</strong><span
												style="color: red"> *</span>&nbsp;<span id="spnNameStatus"></span></label>
											<input class="form-control" id="roomname" type="text"
												name="name" value="<%=rooms.getName()%>"
												placeholder="Room Name" required />
										</div>
										<div class="form-group">
											<label class="required"><strong style="color:rgb(90, 115, 142);">Capacity:</strong><span
												style="color: red"> *</span></label> <input class="form-control"
												type="number" name="capacity"
												value="<%=rooms.getCapacity()%>" placeholder="Capacity"
												min="1" required />
										</div>
										<div class="form-group">
											<label class="required"><strong style="color:rgb(90, 115, 142);">Status:</strong></label> <br>
											<%
												String available = "", occupied = "";

												if (rooms.getStatus() == 0) {
											%>
											<input style="color:rgb(90, 115, 142);" type="radio" name="status" value="1">
											Available <br> <input type="radio" name="status"
												value="0" checked="checked"> Occupied <br>
											<%
												} else if (rooms.getStatus() == 1) {
											%>
											<input type="radio" name="status" value="1" checked="checked">
											Available <br> <input type="radio" name="status"
												value="0"> Occupied <br>
											<%
												}
											%>
										</div>
										<div style="text-align:center;">
										<button type="submit" class="btn btn-primary" style=" text-align:center;border:1px solid white;width:100px; font-size:15px; " id="btnSubmit">Save Room</button>
										<button type="button" class="btn btn-default" data-dismiss="modal" style=" text-align:center;width:100px;">Close</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
                  <%
                  	}
                  %>
                  </tbody>
                </table>
                <div id="pager" style="float:left;">
					<ul id="pagination" class="pagination-sm pagination"></ul>
				</div>
				 


  <!-- Add Modal -->
					<div class="modal fade" id="addModal" role="dialog">
						<div class="modal-dialog">
							<!-- Modal content-->
							<div class="modal-content">
								<div class="modal-header alert alert-primary">
								<h4 class="modal-title" style="float:left;"><i class="fa fa-fw fa-home"></i><strong style="color:rgb(90, 115, 142);">Add new room</strong></h4>
								</div>
								<div class="modal-body">
									<form id="add-post1" action="/managementSystem/AddNewRoom"
										method="POST">
										<div class="form-group">
											<label class="required"><strong style="color:rgb(90, 115, 142);">Room Name:</strong><span
												style="color: red"> *</span>&nbsp;<span id="spnNameStatus1"></span></label>
											<input class="form-control" id="roomname1" type="text"
												name="name" placeholder="Room Name" required />
										</div>
										<div class="form-group">
											<label class="required"><strong style="color:rgb(90, 115, 142);">Capacity:</strong><span
												style="color: red"> *</span></label> 
												<input class="form-control"
												id="txtname" type="number" name="capacity"
												placeholder="Capacity" min="1" required />
										</div>
										<div class="form-group" style="color:rgb(90, 115, 142);">
											<input type="radio" name="status" value="1" checked
												style="display: none;"> 
											<input type="radio" name="status" value="0" style="display: none;">
										</div>
										<div style="text-align: center;">
										<button type="submit" class="btn btn-primary" id="btnSubmit"
										 style="width:100px; border:1px solid white; font-size:15px; text-align:center;">Add Room</button>
											<button type="button" class="btn btn-default" data-dismiss="modal" style=" text-align:center;width:100px;">Close</button>
											</div>
									</form>
								</div>
							</div>
						</div>
					</div>
			</div>
			<script type="text/javascript">
							/* var input = document.getElementById('roomname');
							input.oninvalid = function(event) {
							    event.target.setCustomValidity('Room Name does not allow to contain special characters.');
							} */
							
							$(document).ready(function() {
		      					$('#roomname').blur(function(e) {
		      						var name = $('#roomname').val();
		          					if (validateStrings(name)) {
		      							$('#spnNameStatus').html('');
		      							$('#spnNameStatus').css('color', 'green');
		      							document.getElementById("btnSubmit").disabled = false; 
		      						}
		      						else {
		      							$('#spnNameStatus').html('Room Name just allow upper, lower letter and number');
		      							$('#spnNameStatus').css('color', 'red');
		      							document.getElementById("btnSubmit").disabled = true; 
		      						}
		       					});
		      				});

							$(document).ready(function() {
		      					$('#roomname1').blur(function(e) {
		      						var name = $('#roomname1').val();
		          					if (validateStrings(name)) {
		      							$('#spnNameStatus1').html('');
		      							$('#spnNameStatus1').css('color', 'green');
		      							document.getElementById("btnSubmit").disabled = false; 
		      						}
		      						else {
		      							$('#spnNameStatus').html('Room Name just allow upper, lower letter and number');
		      							$('#spnNameStatus').css('color', 'red');
		      							document.getElementById("btnSubmit").disabled = true; 
		      						}
		       					});
		      				});

							function validateStrings(string) {
		      					var pattern = /^[^`~<>@#%&\*\$\{\}\[\]\(\)\+\=?\|\;_!]+$/;

		      					return $.trim(string).match(pattern) ? true : false;
		      				}
							</script>

        <script type="text/javascript">
            $(document).ready(function(){
                $(document).on('change', '.checkall, .checkitem', function(){
                    var $_this = $(this);
                    document.getElementById("deleteall").style.display = "block";
                    if($_this.hasClass('checkall')){
                        $('.checkitem').prop('checked', $_this.prop('checked'));
                    }else{
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
        <script type="text/javascript">
            $(function () {
                var pageSize = 10; // HiÃ¡Â»Æ’n thÃ¡Â»â€¹ 6 sÃ¡ÂºÂ£n phÃ¡ÂºÂ©m trÃƒÂªn 1 trang
                showPage = function (page) {
                    $(".contentPage").hide();
                    $(".contentPage").each(function (n) {
                        if (n >= pageSize * (page - 1) && n < pageSize * page)
                            $(this).show();
                    });
                }
                showPage(1);
                ///** CÃ¡ÂºÂ§n truyÃ¡Â»Ân giÃƒÂ¡ trÃ¡Â»â€¹ vÃƒ o Ã„â€˜ÃƒÂ¢y **///
                var totalRows = <%= tong%>; // TÃ¡Â»â€¢ng sÃ¡Â»â€˜ sÃ¡ÂºÂ£n phÃ¡ÂºÂ©m hiÃ¡Â»Æ’n thÃ¡Â»â€¹ 
                var btnPage = 5; // SÃ¡Â»â€˜ nÃƒÂºt bÃ¡ÂºÂ¥m hiÃ¡Â»Æ’n thÃ¡Â»â€¹ di chuyÃ¡Â»Æ’n trang
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
        </div>
        </div>
        
       </div>  
      </div>
 <footer style=" background:#EDEDED; padding:15px 20px; display:block;"> 
          <div class="pull-right">
            Updated yesterday at 11:59 PM by Team A.
          </div>
          <div class="clearfix"></div>
    </footer>