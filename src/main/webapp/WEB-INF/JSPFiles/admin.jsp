<jsp:include page="header.jsp"/>

<jsp:directive.page import="com.pojo.User" />
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	User loggedinuser1 = null;	
	String empid = null;
	String username = null;
	session = request.getSession(false);
	if (session == null || session.getAttribute("USER") == null) {
		response.sendRedirect(request.getContextPath() +"/gpfEmpLogin.jsp");
		return;
	} else {
		loggedinuser1 = (User) session.getAttribute("USER");
		if (loggedinuser1 != null ) {			
			empid=loggedinuser1.getUsername();
			if(!empid.equalsIgnoreCase("ADMIN")){
				response.sendRedirect(request.getContextPath() +"/gpfEmpLogin.jsp");
				return;
			}
			username = loggedinuser1.getEmpname();
		} else {
			response.sendRedirect(request.getContextPath() +"/gpfEmpLogin.jsp");
			return;
		}
	}	
%>

<br>
<br>
<div class="container">
<form action="<%=request.getContextPath() %>/fetchEmp" method="post">
<%-- <ul class="nav navbar-nav navbar-center">
			<li><a href="<%=request.getContextPath() %>/pages/addUser.jsp">AddUser</a></li> 
			</ul> --%>
<div class="input-group" style="width: 60%;">

			
	<input type="number" class="form-control"  name="search" placeholder="Enter Employee ID..." required>
      <span class="input-group-btn">
        <button class="btn btn-search" type="submit"><i class="fa fa-search fa-fw"></i> Search</button>
      </span>
      
</div>
</form>
<div class="row "  >
<br/>
</div>

<div class="input-group" style="width: 60%;">
<input type="text"  id="bulkId"  class="form-control"  name="bult" placeholder="Enter  bulk Employee IDs with comma seperated to reset.." required>
      <!-- <span class="input-group-btn">
        <button class="btn btn-search" type="submit"><i class="fa fa-search fa-fw"></i> Reset</button> -->
  <th  id = "reset" rowspan="2" style="vertical-align: middle;"> &nbsp; 
  <button class="btn btn-lg btn-info" onclick="resetBulkPassword();">Bulk Reset</button></th>
  <br/>
  <th>
  
  </th>   
</div>
<div class="row "  >
<br/><font color="green"> <span id="resultt"  ></span></font>
</div>
</div>
<br>
<br>
<br>
<div class="table-responsive" id="SearchEmployee" style="text-align: center;width: 75%;">
	<%
	String error=request.getAttribute("error")!=null?(String)request.getAttribute("error"):null;
	
	if(error!=null) {%>
	<div style="color: red;">
		<h2><%=error %></h2>
	</div>
	<% } 
	User suser=request.getAttribute("searcheduser")!=null?(User)request.getAttribute("searcheduser"):null;
	if(suser!=null){
	%>
	
	<table class="table table-bordered" style="text-align: center;">
	
			<tr>
				<th> Employee ID </th>
				<th> Employee Name </th>
				<th> Designation </th>
				<th> Employee Password </th>
			
				<th  id = "reset" rowspan="2" style="vertical-align: middle;"><button class="btn btn-lg btn-info" onclick="resetPassword(<%=suser.getUsername() %>)">Reset</button></th>
					<%-- <th  id = "addEmp" rowspan="2" style="vertical-align: middle;"><button class="btn btn-lg btn-info" onclick="addEmployee(<%=suser%>)">AddUser</button></th> --%>
			</tr>
	
			<tr >
				<td><%=suser.getUsername() %></td>
				<td><%=suser.getEmpname() %></td>
				<td><%=suser.getDesignation()  %></td>
				<td><%=suser.getPassword() %></td>		
					
			</tr>
			
		
	</table>
	<input type="hidden" name="empId" value="<%=suser.getUsername() %>">
	<input type="hidden" name = "empName" value="<%=suser.getEmpname() %>">
	<input type="hidden" name="empPassword" value="<%=suser.getPassword() %>">
<%} %>
</div>
<%-- <div class="table-responsive" id="AddEmployee" style="text-align: center;width: 75%;">
<%
	String errorsap=request.getAttribute("error")!=null?(String)request.getAttribute("error"):null;
	
	if(errorsap!=null) {%>
	<div style="color: red;">
		<h2><%=errorsap %></h2>
	</div>
	<%} 
	User sapuser=request.getAttribute("searcheduser")!=null?(User)request.getAttribute("searcheduser"):null;
	if(suser!=null){
	%>
	<table class="table table-bordered" style="text-align: center;">
	
			<tr>
				<th> Employee ID </th>
				<th> Employee Name </th>
				<th> Employee Password </th>
				<th rowspan="2" style="vertical-align: middle;"><button class="btn btn-lg btn-info" onclick="addEmployee(<%=suser%>)">AddUser</button></th>
			</tr>
	
			<tr >
				<td><%=suser.getUsername() %></td>
				<td><%=suser.getEmpname() %></td>
				<td><%=suser.getPassword() %></td>		
				
			</tr>
			
		
	</table>
<%} %>
	
</div> --%>

			<!-- </div>
 -->		<!-- </div> -->
	<!-- </center> -->
</body>
<style>
.btn-search {
	  background: slateblue;
	  border-radius: 0;
	  color: #fff;
	  border-width: 1px;
	  border-style: solid;
	  border-color: #1c1c1c;
	}
	.btn-search:link, .btn-search:visited {
	  color: #fff;
	}
	.btn-search:active, .btn-search:hover {
	  background: #1c1c1c;
	  color: #fff;
	}
	th,td{
		text-align: center;
	}
</style>
<script type="text/javascript">
		function resetPassword(username){			
			$.ajax({
			    type:'GET',
			    url: '<%=request.getContextPath()%>/ResetPassword',
			    data: {username:username},
			    success: function (result) {			    	
			       if(result=="success"){
			    	   alert("Password Reset Successfully");
			    	   window.location.reload();
			       }else{
			    	   alert("Password Reset Failed");
			       }
			    },
			    error: function(error){
			    	alert("Password Reset Failed");
			    }
			});
		}
		</script>	
		<script type="text/javascript">
		function resetBulkPassword(){		
			//alert();
			var username=$('#bulkId').val();
			//alert(username);
			 $.ajax({
			    type:'POST',
			    url: '/EmployeeInfo/ResetBulkPassword',
			    data: {username:username},
			    success: function (result) {
			    	$('#resultt').html(result);
			    	//alert(result);
			    	//window.location.reload();
			       /* if(result=="success"){
			    	   alert("Password Reset Successfully");
			    	   window.location.reload();
			       }else{
			    	   alert("Password Reset Failed");
			       } */
			    },
			    error: function(error){
			    	alert("Password Reset Failed");
			    }
			});
		}

</script>

<script type="text/javascript">
function addEmployee(sapuser) {
	alert("Enter in to addEmployee ");
	if (window.confirm("Do you want really Add the User ?")) { 
		//  window.open("exit.html", "Thanks for Visiting!");
		}else {
			alert("Employee not Added");
		}
	$.ajax({
	    type:'POST',
	    url: '<%=request.getContextPath()%>/Addemployee',
	    data: sapuser,
	    success: function (result) {			    	
	       if(result=="success"){
	    	   alert("Employee added Successfully");
	    	   window.location.reload();
	       }else{
	    	   alert("Employee Creation  Failed");
	       }
	    },
	    error: function(error){
	    	alert("Employee Creation  Failed");
	    }
	});
}

</script>
</html>