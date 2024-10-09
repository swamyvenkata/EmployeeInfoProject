<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="headerOne.jsp"></jsp:include>
<jsp:directive.page import="com.vo.User" />
<%
	User loggedinuser1 = null;	
	String empid = null;
	String username = null;
	boolean gpfavailable = false;
	session = request.getSession(false);
	String desg=null;
	String designation = "";
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
			designation = desg;
		} else {
			response.sendRedirect(request.getContextPath() +"/gpfEmpLogin.jsp");
			return;
		}
	}	
%>
<div class="container">

<form action="<%=request.getContextPath()%>/SubmittedList" method="Get">
<H6>Get Employee Submitted Details</H6>
  <div class="form-row">
    <div class="col-xs-4">
     <input type="text" class="form-control" placeholder="Employee Id" id="empid" name="empid" >
     </div>
      <div class="col-xs-4">
      <input type="text" class="form-control" placeholder="Year"    id="year"  name="year" >
     </div>
      <div class="col-xs-4">
    
      <select  class="form-control " name="ptype"  id="ptype">
                    <option value="">Return Type</option>
                    <option value="NIL">Nil Return</option>
                     <option value="Prior">Prior Intimation</option>
                    <option value="Preturn">Property Return</option> 
                    </select>
   
     </div>
      <div class="col-xs-4">
       <input type="submit" class="btn btn-primary btn-xd" value="Get Details">
      </div>
     
    </div> 
   
      <div class="form-row">
     
      </div>   
</form>
<br>
<c:if test="${ not empty fn:trim(error)}">
				<div id="exist" class="alert alert-danger" role="alert">${error}</div>
</c:if>
	<%-- <c:if test="${ not empty fn:trim(list)}">
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>S.NO</th>
					<th class="text-right">EmpId</th>
					<th class="text-right">EmpName</th>
					<th class="text-right">EmpDesg</th>
					<th class="text-right">AckNo</th>
					<th class="text-right">DateOfSubmitted</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="mtrblc" items="${list}" varStatus="tagStatus">
					<tr>
						<td>${tagStatus.index + 1}</td>
						<td class="text-right">${mtrblc.empid}</td>
						<td class="text-right">${mtrblc.empname}</td>
						<td class="text-right">${mtrblc.empdesig}</td>
						<td class="text-right"><a href="<%=request.getContextPath() %>/Ack?pid=${mtrblc.prop_ret_id}&id=${mtrblc.empid}">${mtrblc.prop_ret_id}</a></td>
						<td class="text-right">${mtrblc.date_proffour}</td>

					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:if> --%>	
	<c:if test="${ not empty fn:trim(list)}">  
		<table class="table table-bordered table-striped" id="myTable">
			<thead>
				<tr>
					<th>S.NO</th>
					<th class="text-right">EmpId</th>
					<th class="text-right">EmpName</th>
					<th class="text-right">EmpDesg</th>
					<th class="text-right">Reference No</th>
					<th class="text-right">DateOfSubmitted</th>
					
						<th class="text-right">Remarks</th>
				
					<th class="text-right">Type</th>
					<th class="text-right">Status</th>					
				</tr>
			</thead>
			<tbody>
			<%  desg = desg.substring(0,desg.length()-1); 
			
			String statustxt = "PENDING";%>
				<c:forEach var="mtrblc" items="${list}" varStatus="tagStatus">
					<tr>
					
						<td>${tagStatus.index + 1}</td>
						<c:if test = "${mtrblc.prop_type == 'NIL'}">
							<td class="text-right"><a href="<%=request.getContextPath() %>/Ack?pid=${mtrblc.prop_ret_id}&id=${mtrblc.empid}&year=${mtrblc.prop_ret_year}">${mtrblc.empid}</a></td>
						</c:if>
						
						<c:if test = "${mtrblc.prop_type == 'Prior'}">
						 <td class="text-right"><a href="<%=request.getContextPath() %>/AllRemarks?returnId=${mtrblc.prop_ret_id}&id=${mtrblc.empid}&type=${mtrblc.prop_type}">${mtrblc.empid}</a></td>
							
						  </c:if>
						<c:if test = "${mtrblc.prop_type == 'Preturn'}">
						 <td class="text-right"><a href="<%=request.getContextPath() %>/AllRemarks?returnId=${mtrblc.prop_ret_id}&id=${mtrblc.empid}&type=${mtrblc.prop_type}">${mtrblc.empid}</a></td>
							
						  </c:if>
						   
						
						<td class="text-right">${mtrblc.empname}</td>
						<td class="text-right">${mtrblc.empdesig}</td>
						<td class="text-right">${mtrblc.prop_ret_id}</td>
						<td class="text-right">${mtrblc.trandt}</td>
						
						<td class="text-right">${mtrblc.remarks}</td>
			
						<td class="text-right">${mtrblc.prop_type}</td>
						
						<td><button type="button" class="btn btn-warning btn-sm">${mtrblc.status}</button></td>
						
						<!-- <td class="text-right" class="btn btn-primary">Pending In DGM</td> -->
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:if>
</div>
<jsp:include page="footer.jsp"></jsp:include>