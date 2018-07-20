<%@page import="model.bean.ClassWaiting"%>
<%@page import="model.bean.Schedule"%>
<%@page import="model.bean.Roles"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/templates/inc/dashboard.jsp" %>
<script src="jquery.twbsPagination.min.js"></script>
<script src="http://1892.yn.lt/blogger/JQuery/Pagging/js/jquery.twbsPagination.js" type="text/javascript"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/templates/css/styleRegisterClass.css">
<style>
	#add-post .required:after {
	content:"*";color:red;
	}
</style>
<%
String classNameContent = "" ;
String classNameContainer = "";
String styleContent = "style='margin-top:  5px;'";
if( user.getRoleId() == 3) {
	classNameContent = "content-wrapper py-3";
	classNameContainer = "container-fluid";
	styleContent = "";
}

%>
<div class="<%= classNameContent%>" <%= styleContent%>>
  <div class="<%= classNameContainer%>">
        <div class="card mb-3 divForm">
       		<div class="alert alert-primary" style="font-size:  larger; margin-bottom: 0px;"> 
             <i class="fa fa-fw fa-user" ></i>
             <strong>Register Class</strong>
			  </div>
			  <div>
			<%
			  ArrayList<ClassWaiting> listClassOpening = (ArrayList<ClassWaiting>)request.getAttribute("list");
			  int tong = listClassOpening.size();
			  if (tong==0){
				 %>
				 <div class="alert alert-danger">
		    	<strong> No Class to register </strong>
		  		</div>
				 <% 
			  }
			%>
			<script type="text/javascript">
            $(function () {
                var pageSize = 10; // Hiển thị 6 sản phẩm trên 1 trang
                showPage = function (page) {
                    $(".contentPage").hide();
                    $(".contentPage").each(function (n) {
                        if (n >= pageSize * (page - 1) && n < pageSize * page)
                            $(this).show();
                    });
                }
                showPage(1);
                ///** Cần truyền giá trị vào đây **///
                var totalRows = <%= tong%>; // Tổng số sản phẩm hiển thị
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
			  
		  	<div class="form">
		  		<table>
		  		<%
		  		if(tong !=0){
		  			%>
		  			<tr >
				    <th>No.</th>
				    <th>Name</th>
				    <th>Time</th>
				    <th>Date Of Week</th>
				    <th>Duration</th>
				    <th>Trainer</th>
				    <th>Option</th>
				  </tr>
		  			<% 
		  		}
		  		%>
				  
				  <%
				  int count=0;
				  for (ClassWaiting classOpening : listClassOpening) {
					  count++;
				  
				  %>
				   <tr class="contentPage" >
				    <td class="no"><%= count %></td>
				    <td class="name"><%= classOpening.getClassName() %></td>
				    <td class="time"><%= classOpening.getTimeOfDate() %></td>
				    <td class="date"><%= classOpening.getDateOfWeek() %></td>
				    <td class="duration"><%= classOpening.getDuration()%></td>
				    <td class="trainer"><%= classOpening.getTrainerName() %></td>
				    
				    
				    <%
				    
				    
				    %>
				    <td class="btnRegister">
				    	<button  type="button" name="register" class = "btn btn-primary register" id="<%= classOpening.getClassId() %>" >Register</button>		
				    		    	
				    	
				    </td>
				    
				  </tr>
				  <%
					  
				  }
				  %>
				 
				</table>
				<div id="pager">
					<ul id="pagination" class="pagination-sm"></ul>
				</div>
				</form>
		  	</div>
   		</div> 
     
              
        <div style="clear: both"></div>
        <div class="error" ></div>
        <div style="margin-bottom: 10%"></div>
	</div>
</div>
     <script type="text/javascript">
   $(document).ready(function(){ 
   
	   $(document).on('click','.register',function(){
			 var classOpening_id = $(this).attr("id");
			 regiterClass(classOpening_id);
		});
		function regiterClass(classOpening_id)
		{	
			if(confirm("Are you sure register class?")){
				$.ajax({
					url: '/managementSystem/RegisterClassControllerAjax?classOpening_id=' + classOpening_id,
					type : 'POST',
					//data:{post_id:post_id},
					success:function(data)
					{
						
						$('#post_modal_noti').modal('show');
						$('#post_detail_noti').html(data);					 
					}
				});
			}
			
		}
		
	});
</script>
<div id="post_modal_noti" class ="modal fade">
		<div class = "modal-dialog">
		<div style="margin:auto;margin-top:60%;" class="modal-content"  id = "post_detail_noti">
		</div>
		
	</div>
</div>
<%@include file="/templates/inc/footer.jsp" %> 