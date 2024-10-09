<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!doctype html>
<html class="no-js" lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>GPFEmployee  Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/png" href="<%=request.getContextPath() %>/assets/images/icon/logo1.ico">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/themify-icons.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/metisMenu.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/slicknav.min.css">
    <!-- amchart css -->
    <link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
    <!-- others css -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/typography.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/default-css.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/styles.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/responsive.css">
    <!-- modernizr css -->
    <script src="<%=request.getContextPath() %>/assets/js/vendor/modernizr-2.8.3.min.js"></script>
    <style>
    	.loginnote{
    		color: aqua;
    		font-weight: bold;
    	}
    	/* login-s3 */

.login-bg {
    background: url(/EmployeeInfo/assets/images/spdclbng.jpg) center/cover no-repeat;
    position: relative;
    z-index: 1;
}

.login-bg:before {
    content: '';
    position: absolute;
    left: 0;
    top: 0;
    z-index: -1;
    height: 100%;
    width: 100%;
    background: #272727;
    opacity: 0.7;
}
    	
    </style>
</head>

<%
	String req=(String)request.getAttribute("reg");
%>

<body>
    <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
    <!-- preloader area start -->
    <div id="preloader">
        <div class="loader"></div>
    </div>
    <!-- preloader area end -->
    <!-- login area start -->
    <div class="login-area login-bg">
        <div class="container">

            <div class="login-box ">
                    <form action="<%=request.getContextPath() %>/InItPwdChange" method="post" onsubmit="return validate();">
                    <div class="login-form-head">
                        <h4>Employee Change Password</h4>
                    </div>
                    <div class="login-form-body">  											
									<div class="form-group">
										<label for="inputPasswordNew">New Password</label> <input
											type="password" class="form-control" id="inputPasswordNew"
											name="new_password" required pattern="(?=^.{6,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$">
										
									</div>
									<div class="form-group">
										<label for="inputPasswordNewVerify">Confirm Password</label> <input
											type="password" class="form-control"
											id="inputPasswordNewVerify" name="confirm_password"
											required pattern="(?=^.{6,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$"> 
									</div>
									<input type="hidden" name="userid" value="<%=request.getAttribute("userid")%>">
									<input type="hidden" name="empname" value="<%=request.getAttribute("empname")%>">
									<%if(req!=null){ %><h6 class="text-danger"><%=req %></h6>
										<%} %>
									<div class="submit-btn-area">
                            				<button id="form_submit" type="submit">Submit <i class="ti-arrow-right"></i></button>
                       				 </div>
								<div>										
							</div>
						</div>						
					</form> 
					</div>
            </div>
        </div>   
    <!-- login area end -->

    <!-- jquery latest version -->
    <script src="<%=request.getContextPath() %>/assets/js/vendor/jquery-2.2.4.min.js"></script>
    <!-- bootstrap 4 js -->
    <script src="<%=request.getContextPath() %>/assets/js/popper.min.js"></script>
    <script src="<%=request.getContextPath() %>/assets/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath() %>/assets/js/vendor/bootstrap-notify.min.js"></script>
    <script src="<%=request.getContextPath() %>/assets/js/owl.carousel.min.js"></script>
    <script src="<%=request.getContextPath() %>/assets/js/metisMenu.min.js"></script>
    <script src="<%=request.getContextPath() %>/assets/js/jquery.slimscroll.min.js"></script>
    <script src="<%=request.getContextPath() %>/assets/js/jquery.slicknav.min.js"></script>
    
    <!-- others plugins -->
    <script src="<%=request.getContextPath() %>/assets/js/plugins.js"></script>
    <script src="<%=request.getContextPath() %>/assets/js/scripts.js"></script>
	<script type="text/javascript">
	$('#inputPasswordNew').tooltip({'trigger':'focus', 'title': '* Minimum of 6 or more characters. * Include three of the following mix of character types: uppercase, lowercase, numbers'});
	 $('#inputPasswordNewVerify').tooltip({'trigger':'focus', 'title': 'To confirm, type the new password again.'});
function validate(){
	if($('#inputPasswordNew').val()!=$('#inputPasswordNewVerify').val()){
		notifyuser('warning', "Please Enter Confirm password same as new password");
		return false;
	}
	return true;
}
</script>
</body>

</html>