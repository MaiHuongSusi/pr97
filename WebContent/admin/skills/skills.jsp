<%@page import="model.bean.Skills"%>
<%@page import="model.bean.Courses"%>
<%@page import="model.bean.Majors"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/templates/inc/dashboard.jsp" %>  
<script src="jquery.twbsPagination.min.js"></script>
<script src="http://1892.yn.lt/blogger/JQuery/Pagging/js/jquery.twbsPagination.js" type="text/javascript"></script> 
   

    <style>
            ///** CSS cÃ„Æ’n id pagination ra giÃ¡Â»Â¯a mÃƒ n hÃƒÂ¬nh **///
            #pagination {
                display: flex;
                display: -webkit-flex; /* Safari 8 */
                flex-wrap: wrap;
                -webkit-flex-wrap: wrap; /* Safari 8 */
                justify-content: center;
                -webkit-justify-content: center;
            }
        </style>

<%
String classNameContent = "" ;
String classNameContainer = "";
String styleContent = "style='margin-top:  5px;'";
if( user.getRoleId() == 3) {
	classNameContent = "right_col";
	classNameContainer = "container-fluid";
	styleContent = "";
}
%>
<%
int check = 0;
ArrayList<Skills> skill = (ArrayList<Skills>) request.getAttribute("skill");
/* if(request.getAttribute("check") != null){
	check = Integer.parseInt((String)request.getAttribute("check"));
} */
int k = 0;
int tong = skill.size();
%>
<div class="<%= classNameContent%>" <%= styleContent%> style="background: white;">
  <div class="<%= classNameContainer%>">
    <div class="card mb-3">
        <div class="alert alert-primary" style="font-size: larger;margin-bottom: 0px;"> 
             <i class="fa fa-fw fa-graduation-cap" ></i>
             	<strong>Skills List</strong>
			  </div>	
			  <%       	String msg = "";
if(request.getParameter("msg") != null){
	boolean check1 = false;
	int msgInt = Integer.parseInt((String)request.getParameter("msg"));
	switch(msgInt){
	case 1: {
		check1 = false;
		msg = "This skill is already exists in system"; break;
	}
	case 2: {
		check1 = true;
		msg = "You added the skill successfully"; break;
	}
	case 3:{
		check1 = true;
		msg = "You edited the skill successfully"; break;
	}
	}
	if (check1 == false){
		%>
		<div class="alert alert-danger"><strong><%=msg %></strong></div>
		<% 
	} else {
		%>
		<div class="alert alert-success"><strong><%=msg %></strong></div>
		<%
		}
	}
%>  
        <div class="card-body" >
          <div class="table-responsive">
                <div style="margin-left: -15px; margin-bottom: 5px;">
	            	<div style="float: left" >
	            	<button style="width:auto; font-size:15px; height:auto; margin-bottom:10px; margin-left: 10px;"
	            	type="button" class="btn btn-primary" data-toggle="modal" data-target="#addModal" role="button">Add new skill</button>
	        		</div>
	            	<div style="float: left; margin-left: 15px;">
	            	<input class="btn btn-danger" style="display: none; margin-left: 10px; margin-bottom: 5px;" onclick="return confirm('Do you want to delete these rooms?')" id="deleteall" type="submit" value="Delete rooms">
                	</div>
                	<div style="clear: both"></div>
	        	</div>
	
	        	<table id="myTable" class="table-bordered" style="width: 100%;">
                  <thead>
                    <tr style="height:50px;">
                      <th style="text-align: center;">No.</th>
                      <th style="text-align: center;">Name</th>
                      <th style="text-align: center;">Action</th>
                    </tr>
                  </thead>
                  <tbody>
                  <%
                  for (Skills list: skill){
                	  k++;
                  %>
				   <tr class="contentPage" style="">
				   <td style="text-align: center; vertical-align: middle;width=20%" ><%=k %></td>
                  <td style="text-align: center; vertical-align: middle;width=20%"><%=list.getName()%></td>
				  <td style="text-align: center; vertical-align: middle;">
                   <button type="button" class="btn btn-link" name="editSkill" style="" data-toggle="modal"
                    data-target="#editModal<%=list.getSkillId()%>"><i class="fa fa-edit" style="font-size:16px; margin-bottom: 10px !important; "></i></button>
<%--                    <a style="display:block" href="<%= request.getContextPath()%>/trainer/del?id=<%= list.getSkillId()%>" onclick="return confirm('Bạn có muốn xóa danh mục này?')"><i class="fa fa-trash"></i></a>
 --%>                   </td>
                            
                   </tr>
<!-- Edit list -->
                  <div class="modal fade" id="editModal<%=list.getSkillId()%>" role="dialog">
						<div class="modal-dialog">
							<!-- Modal content-->
							<div class="modal-content">
								<div class="modal-header alert alert-primary">
								<h4 class="modal-title " align="center"><i class="fa fa-fw fa-graduation-cap"></i><strong>Edit Skill</strong></h4>
								</div>
								<div class="modal-body">
									<form id="add-post2" action="/managementSystem/EditSkillController?id=<%=list.getSkillId()%>" method="POST">
									<div class="container">
										 <div><strong>Major:</strong>
										  <ul class="nav nav-tabs">
										  <%
										  
										  	List<Majors> listMajorCheck = (List<Majors>) request.getAttribute("listMajors");
										  	int courseIdCheck = list.getcourseId(); 
										  	int majorIdOfCourseIdCheck = 0;
										  	 for(Majors majorCheck:  listMajorCheck){
										  		List<Courses> listCourseOfmajorCheck= (List<Courses>) request.getAttribute("listCourse"+ majorCheck.getName())  ;
										  		for(Courses courseCheck: listCourseOfmajorCheck){
										  			if(courseIdCheck==courseCheck.getCourseId()){
										  				majorIdOfCourseIdCheck = majorCheck.getMajorId();
										  				System.out.println("This is majorId of Course:"+majorIdOfCourseIdCheck);
										  				break;
										  			}
										  		}
										  		}
										  %>
										  
										  <%
										  List<Majors> listMajor = (List<Majors>) request.getAttribute("listMajors");
										  for(Majors major: listMajor){
											  if(major.getMajorId()== majorIdOfCourseIdCheck){
												  System.out.println("Da tim ra duoc major cua ccourese :"+ major.getMajorId());
												  %>
											  <li ><a data-toggle="tab" href="#<%=major.getName() %><%= list.getSkillId() %>"   ><button  class="btn btn-primary"  font-size:15px; margin-left: 9.5em;"><%= major.getName() %></button></a></li>
											  
											 <% }
											  else { %>
											  <li><a data-toggle="tab" href="#<%=major.getName() %><%= list.getSkillId() %>" ><button  class="btn btn-primary"  font-size:15px; margin-left: 9.5em;"><%= major.getName() %></button></a></li>
											  
											<%	  
											  }
										  }
										  %>
										  </ul>
										</div>
										  <div class="tab-content">
										   <%
										   for(Majors ma: listMajor){
										   %>
										  
										   <div id="<%= ma.getName() %><%= list.getSkillId() %>" class="tab-pane fade" >
										      <%
											List<Courses> list1 = (List<Courses>) request.getAttribute("listCourse"+ ma.getName())  ;
										      %>
										      <div  ><strong>Courses of <%=ma.getName() %> :</strong></div>
										      <% 
										      for(Courses cou : list1){
										    	  
										    	  if(list.getcourseId()== cou.getCourseId()){
										    		  
										    		  %>
										    		  <input type="radio" name="courseId" value="<%= cou.getCourseId() %>" checked> <%=cou.getName() %><br>
										    	  <% 
										    	  }
										    	  else {
										    		  %>
										    		  <input type="radio" name="courseId" value="<%= cou.getCourseId() %>"> <%=cou.getName() %><br>
										    	  <% 
										    	  }
										      }
										      %>
										    </div>
										    <% } %>
										 
										  </div>
										<br>
										<div class="form-group">
											<label class="required"><strong>Skill Name:</strong><span
												style="color: red"> *</span>&nbsp;<span id="spnNameStatus"></span></label>
											<input class="form-control" id="roomname" type="text"
												name="name" maxlength="20" value="<%=list.getName()%>"
												placeholder="Skill Name" required />
										</div>
										
										<button type="submit" class="btn btn-primary" style="width:auto; font-size:15px; margin-left: 9.5em;" id="btnSubmit">Save Skill</button>
										<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
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
                <div id="pager">
					<ul id="pagination" class="pagination-sm"></ul>
				</div>
<!-- Add Modal -->
					<div class="modal fade" id="addModal" role="dialog">
						<div class="modal-dialog">
							<!-- Modal content-->
							<div class="modal-content">
								<div class="modal-header alert alert-primary">
								<h4 class="modal-title" align="center"><i class="fa fa-fw fa-graduation-cap"></i><strong>Add new skill</strong></h4>
								</div>
								<div class="modal-body">
									<form id="add-post1" action="/managementSystem/AddNewSkillController" method="POST">
										<div class="container" >
										 <div><strong>Major:<span style="color: red"> *</span></strong>
										  <ul class="nav nav-tabs">
										  <%
										  List<Majors> listMajor1 = (List<Majors>) request.getAttribute("listMajors");
										  for(Majors major1: listMajor1){
											  %>
											  <a data-toggle="tab" href="#<%=major1.getName() %>Add" ><button  class="btn btn-primary"  font-size:15px; margin-left: 9.5em;"><%= major1.getName() %></button></a>
											  <%
										  }
										  %>
										  </ul>
										</div>
										  <div class="tab-content">
										   <%
										   for(Majors ma: listMajor1){
										   %>
										  
										   <div id="<%= ma.getName() %>Add" class="tab-pane fade"><br>
										      <%
											List<Courses> list = (List<Courses>)request.getAttribute("listCourse"+ ma.getName())  ;
										      %>
										      <div "><strong>Courses of <%=ma.getName() %> :</strong></div>
										      <% 
										      for(Courses cou : list){
										    	  %>
										    	  <label><input type="radio" name="courseId" value="<%= cou.getCourseId() %>" required> <%=cou.getName() %></label><br>
										    	  <%
										      }
										     %>
										    </div> 
										    
										    <% } %>
										 
										  </div>
										<br>
										<div class="form-group">
											<label class="required"><strong>Skill Name:</strong><span
												style="color: red"> *</span>&nbsp;<span id="spnNameStatus1"></span></label>
											<input class="form-control" id="roomname1" type="text"
												name="name" placeholder="Skill Name" maxlength="25" required />
										</div>
										<button type="submit" class="btn btn-primary" id="btnSubmit"
										 style="width:auto; font-size:15px; margin-left: 9em;">Add Skill</button>
											<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
									</div>
									</form>

								</div>
							</div>
						</div>
					</div>
	<script type="text/javascript">
            $(function () {
                var pageSize = 10; // // Hiển thị 10 sản phẩm trên 1 trang
                showPage = function (page) {
                    $(".contentPage").hide();
                    $(".contentPage").each(function (n) {
                        if (n >= pageSize * (page - 1) && n < pageSize * page)
                            $(this).show();
                    });
                }
                showPage(1);
              /** Cần truyền giá trị vào đây **/
                var totalRows = <%=tong%>;  // Tổng số sản phẩm hiển thị
                var btnPage = 2; // Số nút bấm hiển thị di chuyển trang
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
        <script type="text/javascript">
						
							$(document).ready(function() {
		      					$('#roomname1').blur(function(e) {
		      						var name = $('#roomname1').val();
		          					if (validateStrings(name)) {
		      							$('#spnNameStatus1').html('');
		      							$('#spnNameStatus1').css('color', 'green');
		      							document.getElementById("btnSubmit").disabled = false; 
		      						}
		      						else {
		      							$('#spnNameStatus1').html('Skill Name just contains letters and " + . # ""');
		      							$('#spnNameStatus1').css('color', 'red');
		      							document.getElementById("btnSubmit").disabled = true; 
		      						}
		       					});
		      				});

							function validateStrings(string) {
		      					var pattern = /^[^0-9`~<>@%&\*\$\{\}\[\]\(\)\=?\|\;_!]+$/;

		      					return $.trim(string).match(pattern) ? true : false;
		      				}
				</script>
        </div>
        </div>
       </div>  
      </div>
<%@include file="/templates/inc/footer.jsp" %> 