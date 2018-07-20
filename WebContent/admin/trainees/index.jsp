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
<div class="<%= classNameContent%>" <%= styleContent%> id="toggler_contentId" style="background: white;">
  <div class="<%= classNameContainer%>" id="toggler_containerId">
    <div  class="card mb-3" style="min-height:954px;" >
             <div class="alert alert-primary" style="margin-left:-18px; margin-top:60px;"> 
             <i class="fa fa-fw fa-users" style="font-size:17px; margin-bottom:5px;"></i>
			    <strong class="namePage" style="font-size:20px; color:rgb(90, 115, 142)">Trainees </strong>
			  </div>
        <div>
	  <%
	  String msg = "";
	  if(request.getParameter("msg") != null){
		  boolean check = false;
		  int msgInt = Integer.parseInt((String)request.getParameter("msg"));
		  switch(msgInt) {
		  case 1: {
			  check = true;
			  msg = "You added the trainee successfully"; break;
		  }
		  case 2:{
			  check = true;
			  msg = "You edit the trainee successfully"; break;
		  }
		  case 3:{
			  check = true;
			  msg = "You deleted the trainee successfully"; break;
		  }
		  case 4:{
			  check = true;
			  msg  = "You deleted trainees successfully"; break;
		  }
		  case 0:{
			  check = false;
			  msg  = "Error! System have some problems. Please try again"; break;
		  }
		  }
		   if( check == false){
		  %>
        	<div class="alert alert-danger"  id="testDiv" style="margin-top:-20px;"> 
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
	  
		<%
		ArrayList<User> trainees = new ArrayList<User>();
		int total = 0;
		if (request.getAttribute("trainees") != null) {
		 trainees = (ArrayList<User>) request.getAttribute("trainees");
		 total = trainees.size();
				 
		}
		%>
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
                var pageSize = 10; // Hiển thị 10 sản phẩm trên 1 trang
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
        <div class="card-body" style="height:auto;">
          <div class="table-responsive" style="overflow-x: inherit;margin-top:20px;">
            <form action="<%= request.getContextPath()%>/trainee/del"  method="post">
            	<div class="wrapper" style="margin-left: -10px; margin-bottom: 5px;">
	            	<div style="float: right;" >
	            	<a  class="btn btn-round btn-primary"
	            	 style="padding-left:25px;padding-right: 25px;border-color:white;width:auto; font-size:15px; height:auto; margin-bottom:10px; margin-left: 10px;"  href="<%=request.getContextPath() %>/trainee/add" role="button">
	            		Add new trainee's account
            		</a>
	        		</div>
	            	<div style="float: right;">
	            	<input class="btn btn-round btn-danger" style="font-size:15px;padding-left:25px;padding-right:25px;display: none; width:auto; margin-left: 10px; margin-bottom: 10px;  border:1px solid white;"  onclick="return confirm('Do you want to delete these trainees?')" id="deleteall" type="submit" value="Delete trainees">
                	</div>
                	<div style="clear: both"></div>
	        	</div>
                <table  id="myTable" class="table table-bordered" width="100%" id="dataTable" cellspacing="0">
                  <thead>
                    <tr>
                      <th style="text-align: center; font-size: medium; color:rgb(90, 115, 142);">Delete All
                      	<input style="display: inline-block; margin-top:-3px;margin-left:10px;vertical-align:middle;" type="checkbox" class="checkall">
                   	  </th>
                      <th style="text-align: center; font-size: medium; vertical-align:middle;color:rgb(90, 115, 142);">Avatar</th>
                      <th style="text-align: center; font-size: medium; vertical-align:middle;color:rgb(90, 115, 142);">User Name</th>
                      <th style="text-align: center; font-size: medium; vertical-align:middle; word-break:normal;color:rgb(90, 115, 142);">Full Name</th>
                      <th style="text-align: center; font-size: medium; vertical-align:middle;color:rgb(90, 115, 142);">Email</th>
                      <th style="text-align: center; font-size: medium; vertical-align:middle;color:rgb(90, 115, 142);">Phone</th>
                      <th style="text-align: center; font-size: medium; vertical-align:middle; color:rgb(90, 115, 142);word-break:normal;">Address</th>
                      <th style="text-align: center; font-size: medium; vertical-align:middle;color:rgb(90, 115, 142);">Status</th>
                      <th style="text-align: center; font-size: medium; vertical-align:middle;color:rgb(90, 115, 142); word-break:normal;">Action</th>
                    </tr>
                  </thead>
                  <tbody >
                  <%
                  	for(User trainee : trainees){
                  %>	
                  	<tr class="contentPage">
                      	<td   style="font-size:14px;text-align: center; vertical-align: middle;color:rgb(90, 115, 142);"> <input type="checkbox" name="trainee<%= trainee.getUserId()%>" value="<%= trainee.getUserId()%>" class="checkitem" id="chkitem"> </td>
                      	<td  style="font-size:14px;text-align: center; vertical-align: middle;color:rgb(90, 115, 142);"><img alt="<%= trainee.getUsername()%>" src="<%=  request.getContextPath()%>/files/<%= trainee.getAvatar()%>" class="img-circle" width="120" height="140"></td>
                     	<td  style="font-size:14px;text-align: center; vertical-align: middle;color:rgb(90, 115, 142);"> <a href="<%= request.getContextPath()%>/trainee/edit?id=<%= trainee.getUserId()%>"><%= trainee.getUsername()%></a> </td>
	                    <td   style=" font-size:14px;vertical-align: middle; text-align: center;color:rgb(90, 115, 142);"><%= trainee.getFullname() %></td>
	                    <td   style="font-size:14px;text-align: center; vertical-align: middle;color:rgb(90, 115, 142);"><%= trainee.getEmail()%></td>
	                    <td   style="font-size:14px;text-align: center; vertical-align: middle;color:rgb(90, 115, 142);"><%= trainee.getPhone()%></td>
	                    <td   style="font-size:14px;text-align: center; vertical-align: middle;color:rgb(90, 115, 142);"><%= trainee.getAddress() %></td>
	                    <%
	                    if (trainee.getStatus() == 1){
	                    	%>	
		                    <td id="status<%= trainee.getUserId()%>"    style="text-align: center; vertical-align: middle;">
		                    <a href="javascript:void(0)" onclick="changeStatus(<%= trainee.getUserId()%>, 1);"><img alt="" src="<%= request.getContextPath()%>/templates/images/active.gif"></a></td>
		                    <%
	                    } else {
	                    	%>	
		                    <td  id="status<%= trainee.getUserId()%>"   style="text-align: center; vertical-align: middle;"><a href="javascript:void(0)" onclick="changeStatus(<%= trainee.getUserId()%>, 0);"><img alt="" src="<%= request.getContextPath()%>/templates/images/deactive.gif"></a></td>
		                    <%
	                    }
	                    %>
                    	<td   style="text-align: center; vertical-align: middle;">
                        <a href="<%= request.getContextPath()%>/trainee/edit?id=<%= trainee.getUserId()%>">
                        	<i class="fa fa-edit" style="font-size:20px; vertical-align:middle;"></i>
                       	</a>
                        <a  style="" href="<%= request.getContextPath()%>/trainee/del?id=<%= trainee.getUserId()%>" onclick="return confirm('Do you want to delete trainee : <%= trainee.getUsername()%>?')">
                        	<i class="fa fa-trash iconDel" style="color:rgb(220, 53, 69) ;font-size:20px;vertical-align:middle;margin-left:10px;"></i>
                       	</a>
                     	</td>
                    </tr>
                  <%	
                  	}
                  %>
                  </tbody>
                </table>
                
                
                <script type="text/javascript">
                function changeStatus(id, status){
            		$.ajax({
            			url: '<%=request.getContextPath()%>/trainee/index',
            			type: 'POST',
            			cache: false,
            			data: {
            				//Dữ liệu gửi đi
            				traineeId: id,
            				status : status
            			},
            			success: function(data){
            				// Xử lý thành công
            				$('#status' + id).html(data);
            			},
            			error: function (){
            			// Xử lý nếu có lỗi
            				alert('fail');
            			}
            		});
            	}
                </script>
                
                
            </form>
            <div id="pager" style="float: left; margin-top:-25px;">
					<ul id="pagination" class="pagination-sm"></ul>
				</div>
          </div>
        </div>
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
    
   
  