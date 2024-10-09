<jsp:include page="header.jsp"/>
			<%@ page import="java.util.*"%>
			<jsp:directive.page import="com.vo.User" />
<%
	User loggedinuser1 = null;	
	String empid = null;
	String username = null;
	boolean gpfavailable = false;
	session = request.getSession(false);
	String desg=null;
	String empOffice = null;
	if (session == null || session.getAttribute("USER") == null) {
		response.sendRedirect(request.getContextPath() +"/gpfEmpLogin.jsp");
		return;
	} else {
		loggedinuser1 = (User) session.getAttribute("USER");
		if (loggedinuser1 != null) {
			empid=loggedinuser1.getUsername();
			username = loggedinuser1.getEmpname();
			gpfavailable = loggedinuser1.isGpfavailable();
			desg=loggedinuser1.getDesignation();
			empOffice = loggedinuser1.getOffice();
			//System.out.println("designation:"+desg);
		//	System.out.println("empOffice:"+loggedinuser1.getOffice());
		} else {
			response.sendRedirect(request.getContextPath() +"/gpfEmpLogin.jsp");
			return;
		}
	}	
%>	
<div class="container" style=" background: url(<%=request.getContextPath() %>/assets/images/slip.png);  background-repeat: no-repeat; background-size: cover;">

  <div class="row text-center" align="center" >
  
    <div class="col-lg-5 col-md-5 col-sm-8 col-xs-8 col-md-offset-4 col-lg-offset-4 col-sm-offset-3 col-xs-offset-3">
      <div class="box">
        <!-- /.box-header -->
        <div class="box-body">       
            <div class="form-group row" align="center" >
              
              <div class="col-lg-9 col-md-9 col-sm-10">
              <br><br>
              <a href="https://apspdcl.in/ctc/?employeeId=<%=empid%>"  >
              <button type="submit" class="glass" style="font-size: 22px; padding: 10px;"> CTC-Self</button>
              </a>
              <br><br>
              <% if(desg != null && desg.equals("JAO") && empOffice != null) { %>
                <a href="https://apspdcl.in/ctc/jao?jaoUserName=JAO-<%=empOffice %>" >
              <button type="submit" class="glass" style="font-size: 22px; padding: 10px;"> CTC-JAO ADM</button>
              </a>
              <br><br>
               			<% } %>
              	
               
               			 <form method="post" action="<%=request.getContextPath() %>/YOUR_SLIP" target="_blank">
               				 <input type="hidden" name="empid" value="<%=empid%>">
               				 <input type="hidden" name="sliptype" value="PAYSLIP">
               				 <input type="submit" class="glass" value="Pay Slip">
               			</form> 
               			 
               			<br><br>
               			 <form method="post" action="<%=request.getContextPath() %>/YOUR_SLIP" target="_blank">
               				 <input type="hidden" name="empid" value="<%=empid%>">
               				 <input type="hidden" name="sliptype" value="GROSSPAY"> 
               				  <input type="submit" class="glass" value="Gross Pay"> -
               				 <!-- <button type="submit" class="glass" style="font-size: 22px;padding: 0px;"> Gross Pay <br>Particulars</button> -->
               			</form> 
               			<br><br>
               			<%if(gpfavailable) {%>
                	   <form method="post" action="<%=request.getContextPath() %>/YOUR_SLIP" target="_blank">
               				 <input type="hidden" name="empid" value="<%=empid%>">
               				 <input type="hidden" name="sliptype" value="GPF">
               				 <input type="submit" class="glass" value="GPF Slip">
               			</form>
               			<br><br> 
               			<%} %>
               			<a  href="home.jsp"><button  class="glass" style="font-size: 22px;padding: 0px;"> Property Returns <br>Particulars</button></a>

						<%-- 	<%
								if (desg.equalsIgnoreCase("CGM") || desg.equalsIgnoreCase("DGM") || desg.equalsIgnoreCase("PAY OFFICER")) {
									
							%>
							<br><br>
							<a  href="<%=request.getContextPath() %>/pages/submittedlist.jsp"><button  class="glass" style="font-size: 22px;padding: 0px;"> Property Returns <br>Submitted Details</button></a>
							<%
								}
							%> --%>


						</div>
            </div>     
        </div>
        <!-- /.box-body -->
      </div>
      <!-- /.box -->
    </div>
    <!-- /.col -->
  </div>
  <!-- /.row -->
</div>
<div class="container">
	<div class="row text-center" align="center" >
			<div class="col-12">
					<h2 style="color:red;font-size:22px"> Note : The slips are for current month/financial year.</h2>
			</div>
	</div>
</div>
<style>
 .glass{
	/* background styles */
	position: relative;
	display: inline-block;
	padding: 15px 25px;
    background-color: white;
    background-image: linear-gradient(#716e82,#234c6f);
    border-radius: 20%;
	/* text styles */
	text-decoration: none;
	color: #fff;
	font-size: 25px;
	font-family: sans-serif;
	font-weight: 100;
	width:75%;
}
.glass:after{
	content: '';
	position: absolute;
	top: 2px;
	left: 2px;
	width: calc(100% - 4px);
	height: 50%;	
}
.glass:hover{
	 background: linear-gradient(#fff,#2c71da);
    color: #000;
}
</style>
</body>
</html>