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
	String desg=null;
	String authType = "";
	if (session == null || session.getAttribute("USER") == null) {
		response.sendRedirect(request.getContextPath()+"/gpfEmpLogin.jsp");
		return;
	} else {
		loggedinuser1 = (User) session.getAttribute("USER");
		if (loggedinuser1 != null) {
			empid=loggedinuser1.getUsername();
			username = loggedinuser1.getEmpname();
			desg=loggedinuser1.getDesignation();
			authType = (String)session.getAttribute("authType");
		} else {
			response.sendRedirect(request.getContextPath() +"/gpfEmpLogin.jsp");
			return;
		}
	}	
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee-<%=username%></title>
<%-- <link rel="icon" href="<%=request.getContextPath() %>/assets/images/LOGO_N.png" type="image/gif" sizes="16x16"> --%>
<link rel="icon" href="<%=request.getContextPath() %>/assets/images/LOGO-N1.png" type="image/gif" sizes="16x16">

<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/assets/css/datatables.min.css">
<!-- <link rel="stylesheet"
	href="https://cdn.datatables.net/fixedcolumns/3.2.6/css/fixedColumns.dataTables.min.css"> -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/fixedColumns.dataTables.min.css">
	<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/css/bootstrap-select.min.css"> -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/bootstrap-select.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/jquery.dataTables.css">
<!--  <script src="<%=request.getContextPath() %>/assets/js/vendor/jquery-2.2.4.min.js"></script>
<script src="<%=request.getContextPath() %>/assets/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
 -->	
	  <!--  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script> -->
	  <script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/jquery.js"></script>
  <!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
  <script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/bootstrap.min.js"></script>
	<!--  <script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/js/bootstrap-select.min.js"></script> -->
	<script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/bootstrap-select.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/jquery.dataTables.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/notify.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/notify.min.js"></script>
	
<style type="text/css">
/* body{
 	font-size: 16px;
} */
.navbar-inverse{
font-size: 16px;
}
.navbar-inverse .navbar-nav>li>a {
	color: rgba(226, 226, 226, 1);
}

.navbar-inverse .navbar-nav>li>a:focus, .navbar-inverse .navbar-nav>li>a:hover {
	color: rgba(222, 92, 92, 1);
}

.btn.focus, .btn:focus, .btn:hover {
	color: rgba(222,92,92,1);
}

.navbar-inverse {
	    background-color: #2c71da;
}

.alignment{
	text-align: center;
}
</style>

<script>
$(document).ready( function () {
    $('#myTable').DataTable();
} );


</script>


</head>
<body>
		<br>
		<div class="container-fluid">
			<div class="panel panel-primary">
				<div class="panel-body">
					<div class="row">					
							<div class="form-group col-md-2 col-sm-2 col-xs-2 text-left">
								<%if(!empid.equalsIgnoreCase("ADMIN")){ %>
								<a href="<%=request.getContextPath() %>/pages/empHome.jsp"><%} %>
								<%-- <img src="<%=request.getContextPath() %>/assets/images/bannerspdcl.jpg"
									height="80" width="95%" class="img-rounded" alt="SPDCL"> --%>
									<img  src="<%=request.getContextPath() %>/assets/images/LOGO-N1.png"
									height="80px" width="80px" class="img-rounded" alt="SPDCL"></a>
							</div>
							<div class="form-group">
										<PRE style="font-size: 25px"><b>	SOUTHERN POWER DISTRIBUTION COMPANY OF A.P. LIMITED
		  CORPORATE OFFICE :: TIRUPATI</b></PRE>
								 
							</div>						
					</div>
				</div>
			</div>
			<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<ul class="nav navbar-nav navbar-center">
					<%if(empid.equalsIgnoreCase("ADMIN")){ %>
					<li><a href="<%=request.getContextPath() %>/pages/admin.jsp">Home</a></li>
					<%}else{ %>
					<%if (!authType.equalsIgnoreCase("AUTH")) {
			    %>
			   
					<li><a href="<%=request.getContextPath() %>/pages/empHome.jsp">Main Home</a></li>
					<%} } %>
				</ul>
				<%if (!authType.equalsIgnoreCase("AUTH")) {
			    %>
				<ul class="nav navbar-nav navbar-center">
				    <li><a href="<%=request.getContextPath() %>/pages/home.jsp">Home</a></li>
					
				</ul>
					<ul class="nav navbar-nav navbar-center">

				    <li><a href="<%=request.getContextPath() %>/ReturnsList">Returns List</a></li>

					
				</ul>
				<% } %>
			<ul class="nav navbar-nav navbar-center">

				<%if (authType.equalsIgnoreCase("AUTH")) {
			    %>
				<li><a href="<%=request.getContextPath() %>/SubmittedList">SubmittedList</a></li>
				<%} %>

			</ul>
			<ul class="nav navbar-nav navbar-center">
					<li><a href="#"><span
							class="glyphicon glyphicon glyphicon-user "></span> <%=username%> <span> &nbsp;
							<%if (!authType.equalsIgnoreCase("AUTH")	) {
			    %>
				( Emp ID : <%=empid %>)
				<%} %>
							
							</span>
					</a>
				</ul>	
			
				<%-- <ul class="nav navbar-nav navbar-left">
					<%if(!empid.equalsIgnoreCase("ADMIN")){ %>
				<li>	<a href="<%=request.getContextPath() %>/pages/empInfo.jsp"><span class="glyphicon glyphicon-user"></span>View Info</a></li>
				<%} %>
				</ul>			 --%>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="<%=request.getContextPath() %>/logout"><span
							class="glyphicon glyphicon-log-out"></span> Logout</a></li>
				</ul>
			</div>
			</nav>
			<br>