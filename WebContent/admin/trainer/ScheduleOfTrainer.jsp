
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="model.bean.Rooms"%>
<%@page import="model.bean.User"%>
<%@page import="model.bean.Schedule"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/inc/dashboard.jsp" %>  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="jquery.twbsPagination.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.js" ></script>
<script src="http://1892.yn.lt/blogger/JQuery/Pagging/js/jquery.twbsPagination.js" type="text/javascript"></script>

  <%
   	ArrayList<Schedule> schedule = (ArrayList<Schedule>) request.getAttribute("schedule");
   	int k=0;
   	String dayOfWeek2="";
   	int tong = schedule.size();
   	int classid_choose=0;
   	User ur = (User) request.getAttribute("ur");
%>
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
    <div class="card mb-3">
         <div class="alert alert-primary"  style="font-size: larger;margin-bottom: 0px;"> 
             <i class="fa fa-fw fa-book" ></i>
			    <strong><%=ur.getUsername()%>'s schedule</strong>
         </div>
			  
			  <div>
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
        <div class="card-body">
          <div class="table-responsive">
          
                <input style="display: none; margin-left: 10px; margin-bottom: 10px; color: red" id="deleteall" type="submit" value="Delete">
                <table id="myTable" class="table table-bordered" width="100%"  cellspacing="0">
                  <thead>
                    <tr>
                      <th style="text-align: center;">No.</th>
                      <th style="text-align: center;">Class</th>
                       <th style="text-align: center;">Room</th>
                      <th style="text-align: center;">Course</th>
                      <th style="text-align: center;">Time</th>
                      <th style="text-align: center;">Date Of Week</th>
                      <th style="text-align: center;">Taught Hours </th>
                      <th style="text-align: center;">Duration (Hours)</th>
                      <th style="text-align: center;">Action</th>
                    </tr>
                  </thead>
                  <tbody>
                  
                  	<%
                  	String FORMAT = "EEE,d MMM yyyy";
		          	DateFormat formater = new SimpleDateFormat(FORMAT);
		          	Date date = new Date();
		        	System.out.println(formater.format(date));
		        	String s1 = formater.format(date);
		        	String s2[] = s1.split(",");
		        	String s3 ="";
		        	System.out.println(s2[0]);
		        	String arr1[] = s2[1].split(" ");
		        	switch(s2[0]){
            		 
            		 case "Mon":
            		 {
            			 s3+="2";
            			 break;
            		 }
            		 case "Tue":
            		 {
            			 s3+="3";
            			break;
            		 }
            		 case "Wed":
            		 {
            			 s3+="4";
            			break;
            		 }
            		case "Thu":
            		 {
            			 s3+="5";
            			break;
            		 }
            		case "Fri":
            		 {
            			 s3+="6";
            			break;
            		 }
            		case "Sat":
            		 {
            			 s3+="7";
            			break;
            		 }
            		case "Sun":
            		 {
            			 s3+="8";
            			break;
            		 }
            	    default:
            	    {
            	        
            	    }
            		 }
                  	for (Schedule list : schedule){
                  		k+=1;
                  		String s="";
                  	 	String str=list.getDateOfWeek();
                  	 	String arr[]=str.split(",");
	                  	 for(int i=0; i<arr.length;i++){
	                  		if(i==(arr.length-1)){
	               			 s+=" and ";
	               		 }
	                 		 switch(arr[i]){
	                 		 
	                 		 case "2":
	                 		 {
	                 			 s+="Mon";
	                 			 break;
	                 		 }
	                 		 case "3":
	                 		 {
	                 			 s+="Tue";
	                 			break;
	                 		 }
	                 		 case "4":
	                 		 {
	                 			 s+="Wed";
	                 			break;
	                 		 }
	                 		case "5":
	                 		 {
	                 			 s+="Thu";
	                 			break;
	                 		 }
	                 		case "6":
	                 		 {
	                 			 s+="Fri";
	                 			break;
	                 		 }
	                 		case "7":
	                 		 {
	                 			 s+="Sat";
	                 			break;
	                 		 }
	                 		case "8":
	                 		 {
	                 			 s+="Sun";
	                 			break;
	                 		 }
	                 	    default:
	                 	    {
	                 	        
	                 	    }
	                 		 }
	                 		 if (i< (arr.length-2)) {
	                 			 s+=", ";
	                 		 }
	                 		if (i == (arr.length-1)) {
	                			 s+="";
	                		 }
                  	 	}
                  %>
				   <tr class="contentPage">
                  <td style="text-align: center; vertical-align: middle;"><%= k %></td>
                  <td  vertical-align: middle;"><%= list.getNameclass()%></td>
                   <td style="text-align: center; vertical-align: middle;"><%= list.getNameroom()%></td>
                   <td style=" vertical-align: middle;"><%= list.getCourse()%></td>
                   <td style="text-align: center; vertical-align: middle;"><%= list.getTimeOfDate()%></td>
                   <td style="text-align: center; vertical-align: middle;"><%= s%></td>
                   <td style="text-align: center; vertical-align: middle;"><%= list.getCountLession()%></td>
                   <td style="text-align: center; vertical-align: middle;"><%= list.getDuration() %></td>
                    <td style="text-align: center; vertical-align: middle;"> <a href="/managementSystem/trainer/list?class_id=<%= list.getClassid() %>&name=<%= list.getNameclass()%>" class="fa fa-list" style="text-align: center; vertical-align: middle;font-size:20px; text-decoration: none;"></a>
                   <button  type="button" class="btn btn-link"  style="text-align: center; vertical-align: middle; font-size: 20px" data-toggle="modal" data-target="#myModal<%=k%>"><i class="fa fa-paper-plane" aria-hidden="true"></i>
                   </button>
                   <div class="modal fade" id="myModal<%=k %>" role="dialog">
						    <div class="modal-dialog ">
						      <div class="modal-content">
						        <div class="modal-header; alert alert-primary">
						          <button type="button" class="close" data-dismiss="modal">&times;</button>
						          <h4 class="modal-title">Requesting a day off for <%= list.getNameclass()%></h4>
						        </div>
						        <div class="modal-body">
						          <table border="0px">
						           <form action="" method="post"> 
						           
						         
						          <tr>
						          <th>Day off</th>
						          <td>
						          
						          		
						          			<%
						          			
						          		String []dayoff={"Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"};
						          		for(int j=0; j<arr.length; j++){
						          		String b = arr[j];
						          		int b1 =Integer.parseInt((String)b);
						          		int s4 =Integer.parseInt((String)s3);
						          		if(b1==s4){
						          		%>
										  <input style="float: left;" type="radio" name="dayoff" value="<%=b %>"> <%=s2[0]+", "+s2[1] %><br>
										  <% 
										 } else {
											 if(b1>s4){
												 int kq = b1-s4;
												 int day =Integer.parseInt((String)arr1[0]);
												 day = day + kq;
												 String dayOfWeek ="";
												 String day1 =  String.valueOf(day);
												
												 for(int c = 0; c<dayoff.length; c++){
													 if(s2[0].equals(dayoff[c])){
														  dayOfWeek = dayoff[c+kq];
													 }
												 }
												 day1=dayOfWeek +", "+ day1 +" " +arr1[1] +" " +arr1[2];
												 %>
												  <input style="float: left;" type="radio" name="dayoff" value="<%=dayOfWeek %>"> <%=day1 %><br>
												  <%
											 }else {
													 int kq = b1 - s4;
													 int kq1 = kq +7;
													 int day =Integer.parseInt((String)arr1[0]);
													 day = day + kq1;
													 String dayOfWeek ="";
													 String day1 =  String.valueOf(day);
													
													 for(int c = 0; c<dayoff.length; c++){
														 if(s2[0].equals(dayoff[c])){
															  dayOfWeek = dayoff[c+kq];
														 }
													 }
													 day1=dayOfWeek +", "+ day1 +" " +arr1[1] +" " +arr1[2];
													 %>
													  <input style="float: left;" type="radio" name="dayoff" value="<%=dayOfWeek %>"> <%=day1 %><br>
													  <%
											 }
										 }
						          		%>
										
						          		<% 
						          	}
						          %>
						          </td>
						           <input type="hidden" value="<%=list.getClassid()%>" id="classId">
						          <%-- <%
						          	 classid_choose = list.getClassid();
						          	System.out.println(classid_choose);
						          %> --%>
						          <script type="text/javascript">
					    function takeDayOff (){
					    	<%-- var dayinstead = $("#dayinstead"+<%=dayOfWeek2%>).val(); --%>
					    	var dayinstead= $('input[name="dayinstead"]:checked').val();
					    	var class_id = $('#classId').val();
					    	alert(class_id);
					        $.ajax({
					              type : 'POST', 
					              url : '/managementSystem/trainer/RequestTakeDayOf?class_id='+class_id+"&dayinstead="+dayinstead, 
					              success : function(result)  
					                        { 
					            				alert(result);
					                        }
					              });
					        }
					</script>
						          </tr>
						          </tr>
						          
						          
						          <tr>
						          <th>Day instead</th>
						          <td>
						         
						          	<%
						          	String []dayoff2={"2", "3", "4", "5", "6", "7", "8"};
						          	String []dayoff3={"Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"};
						          	for(int t=0; t<dayoff2.length; t++){
						          		String c = dayoff2[t];
						          		int c1 =Integer.parseInt((String)c);
						          		int s5 =Integer.parseInt((String)s3);
						          		
						          		if(c1==s5){
						          			dayOfWeek2 = s2[0];
						          			%>
											  <input style="float: left;" type="radio" name="dayinstead" value="<%=s2[0] %>"> <%=s2[0]+", "+s2[1] %><br>
											  <% 
						          		}else {
											 if(c1>s5){
												 int kq = c1-s5;
												 int day2 =Integer.parseInt((String)arr1[0]);
												 day2 = day2 + kq;
												 dayOfWeek2 ="";
												 String day3 =  String.valueOf(day2);
												
												 for(int d = 0; d<dayoff3.length; d++){
													 if(s2[0].equals(dayoff3[d])){
														  dayOfWeek2 = dayoff3[d+kq];
													 }
												 }
												 day3=dayOfWeek2 +", "+ day3 +" " +arr1[1] +" " +arr1[2];
												 %>
												  <input style="float: left; " type="radio" name="dayinstead" value="<%=dayOfWeek2 %>"> <%=day3 %><br>
												  <%
											 }else {
													 int kq = c1 -s5;
													 int kq1 = kq +7;
													 int day2 =Integer.parseInt((String)arr1[0]);
													 day2 = day2 + kq1;
													 dayOfWeek2 ="";
													 String day3 =  String.valueOf(day2);
													
													 for(int d = 0; d<dayoff3.length; d++){
														 if(s2[0].equals(dayoff3[d])){
															  dayOfWeek2 = dayoff3[d+kq];
														 }
													 }
													 day3=dayOfWeek2 +", "+ day3 +" " +arr1[1] +" " +arr1[2];
													 %>
													  <input style="float: left; " type="radio" name="dayinstead" value="<%=dayOfWeek2 %>"> <%=day3 %><br>
													  <%
											 }
						          		}
						          	%>
									  
								
									<%
									}
									%>
									</td>
						          </tr>
						          <tr>
						          	<th colspan="2">
						          	<button id="bttcheck" onclick="takeDayOff();" style="float: right;" class=" btn btn-primary">Check</button>
						          	</th>
						          </tr>
						          </form>
						          
						          <tr>
						          <th>Time</th>
						          <td>
						          <select style="float: left;width:145px" >
						          <option value="">7:00-9:00</option>
						          <option value="">9:00-11:00</option>
									  
									</select>
						          </td>
						          </tr>
						          <tr>
						          <th>Room</th>
						         
						          <td>
						          	 <select style="float: left; ">
						          	 <%-- <option value="nameroom"><%= list.getNameroom()%></option> --%>
						          	  <%
						          	
						          	ArrayList<Rooms> rooms =(ArrayList<Rooms>)request.getAttribute("rooms");
						          	for(Rooms ar: rooms){
						          	%>	
									  <option value="nameroom"><%= ar.getName()%></option>
						          <%
						          }
						          %>
						          </select> 
						          </td>
						          </tr>
						          <tr>
						          <th colspan="2"><label>Content</label><textarea rows="5" cols="45"></textarea></th>
						          </tr>
						          
						          </table>
						        </div>
						        <div class="modal-footer">
						         <button type="button" class="btn btn-default; btn btn-primary" >Submit</button>
						          <button type="button" class="btn btn-default;" data-dismiss="modal" style="font-size: 13px">Close</button>
						         
						        </div>
						      </div>
						    </div>
						  </div>
                  </td>
                  </tr>
                  <%
                  	}
                  %>
                  </tbody>
                </table>
                <div id="pager">
					<ul id="pagination" class="pagination-sm"></ul>
				</div>
						


					</div>
        </div>
        <div class="card-footer small text-muted">
          Updated yesterday at 11:59 PM
        </div>
      </div>
    </div>
  </div>
<%@include file="/templates/inc/footer.jsp" %> 