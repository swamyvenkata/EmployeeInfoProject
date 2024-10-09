<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page session="false"%>
<%
	// for checking the session is available or not, if not available it will throw exception, "Session already invalidated."
	HttpSession sesssion = request.getSession(false);
	if (sesssion != null) {
		sesssion.invalidate();
	}
	String error=(String)request.getAttribute("error");
	String flag=(String)request.getAttribute("flag");
%>
<!doctype html>
<html class="no-js" lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Employee  Login</title>
    <%-- <link rel="icon" href="<%=request.getContextPath() %>/assets/images/LOGO_N.png" type="image/gif" sizes="16x16"> --%>
    <link rel="icon" href="<%=request.getContextPath() %>/assets/images/LOGO-N1.png" type="image/gif" sizes="16x16">
   
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%-- <link rel="shortcut icon" type="image/png" href="<%=request.getContextPath() %>/assets/images/icon/favicon.ico"> --%>
   <link rel="shortcut icon" type="image/png" href="<%=request.getContextPath() %>/assets/images/icon/logo1.ico"> 
   
    <link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/themify-icons.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/metisMenu.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/slicknav.min.css">
    <!-- amchart css -->
  <!--   <link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" /> -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/export.css" type="text/css" media="all" >
    <!-- others css -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/typography.css" >
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
    background: url(<%=request.getContextPath() %>/assets/images/spdclbng.jpg) center/cover no-repeat;
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

#flag{
	margin-bottom: 15px;
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
                <form method="post" action="/gpfemp" autocomplete="off">
               <!--  <form method="post" action="/gpfemplogin" autocomplete="off"> -->
                    <div class="login-form-head">
                        <h4><%-- <img  src="<%=request.getContextPath() %>/assets/images/LOGO_N.png"
									height="81px" width="100px" class="img-rounded" alt="SPDCL"> --%>
									<img  src="<%=request.getContextPath() %>/assets/images/LOGO-N1.png"
									height="81px" width="100px" class="img-rounded" alt="SPDCL">
									<span class="d-block d-sm-block d-md-none d-lg-none d-xl-none"><br/></span>
									 &nbsp; &nbsp; &nbsp; Employee Sign In</h4>
                    </div>
                    <div class="login-form-body">
                    	<%
                    		if(error!=null && error != ""){
                    	%>
                			<h5 class="text-center text-danger"><%=error %></h5>	
                    	<%} %>
                    	<%
                    		if(flag!=null && flag != ""){
                    	%>
                			<h6 class="text-center text-success" id="flag"><%= flag %></h6>
                			
                				
                    	<%} %>
                    	
                        <div class="form-gp">
                            <label for="exampleInputEmail1">Username <sup>*</label>
                            <input type="text" id="exampleInputEmail1" name="username" required>
                            <i class="ti-email"></i>
                        </div>
                        <div class="form-gp">
                            <label for="exampleInputPassword1">Password<sup>*</label>
                            <input type="password" id="exampleInputPassword1"  name="password" required>
                            <i class="ti-lock"></i>
                        </div>
                         <div class="captchaimg text-center" >
                         		<span id="captchazone"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ti-reload" onclick="refreshcaptcha();"></span>
                         </div>
                         <!-- <div class="form-gp">

                            <label for="captcha">Captcha<sup>*</label>
                            <input type="text" id="captcha" name="captcha" required>
                        </div> -->
                        
                         <div class="row mb-2 rmber-area">
                            <div class="col-6 text-right">
                                <a href="<%=request.getContextPath() %>/empforgotpassword.jsp">Forgot Password?</a>
                            </div>
                        </div> 
                        <div class="submit-btn-area">
                            <button id="form_submit" type="submit">Submit <i class="ti-arrow-right"></i></button>
                        </div>
                     <div class="form-footer text-center mt-3">
                            <p class="text-danger">Note : If you have any Queries, Please contact  <b>73826805 54</b>.</p>
                        </div> 
                            <div class="form-footer text-center mt-3">
                               <a href="<%=request.getContextPath() %>/assets/Property-Returns.pdf"" target="_blank" >Click here</a> for Property Returns user Manual
                            <%-- <p class="text-danger"><a href="<%=request.getContextPath() %>/authorityLogin.jsp">Click For Authority Login</a></p> --%>
                        </div> 
                        <div class="form-footer text-center mt-3">
                        	<p class="text-danger">NOTE : This application works best in the Chrome browser</p>
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
    	/* $('#exampleInputPassword1').tooltip({'trigger':'focus', 'title': '* Minimum of 6 or more characters. * Include three of the following mix of character types: uppercase, lowercase, numbers'}); */
		history.pushState(null, null, location.href);
		window.onpopstate = function() {
			history.go(1);
		};
		$(document).ready(function() {
			refreshcaptcha();
		});
		function refreshcaptcha(){
			$('#preloader').show();
			if($('#capimage').length>0){
				$('#capimage').remove();
			}
			$.get( "<%=request.getContextPath()%>/CaptchaServlet", function( data ) {
				$('#preloader').hide();
				 $('#captchazone').html($('<img/>',{'src':'data:image/png;base64,'+data,'id':'capimage'}));
			});		   
		}
		
		function getInfo(){
			$('#preloader').show();
			if($('#capimage').length>0){
				$('#capimage').remove();
			}
			$.get( "<%=request.getContextPath()%>/CaptchaServlet", function( data ) {
				$('#preloader').hide();
				 $('#captchazone').html($('<img/>',{'src':'data:image/png;base64,'+data,'id':'capimage'}));
			});		   
		}
		
		function intOnly(i) {
		    if(i.value.length>0) {
		        i.value = i.value.replace(/[^\d]+/g, '');
		    }
		}

	</script>
</body>

</html>