<%@page import="com.daos.TeachDaos"%>
<%@page import="com.beans.Tests"%>
<%@page import="com.daos.TestDaos"%>
<%@page import="com.daos.StudDaos"%>
<%@page import="com.beans.Stud"%>
<%@page import="com.beans.Subjects"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.daos.SubjectDaos"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="images/graduate.png">
      <title>Best Study an Education Category Bootstrap Responsive Website Template | Login :: w3layouts</title>
       
    <!-- Bootstrap Core CSS -->
    <link href="plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="css/style.css" rel="stylesheet">
    <!-- You can change the theme colors from here -->
    <link href="css/colors/blue.css" id="theme" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
    
	<!-- meta-tags -->
	
	
	<script>
		addEventListener("load", function () {
			setTimeout(hideURLbar, 0);
		}, false);

		function hideURLbar() {
			window.scrollTo(0, 1);
		}
	</script>
    
    
    <!-- //meta-tags -->
	<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
	
	<!-- font-awesome -->
	<link href="css/font-awesome.css" rel="stylesheet">
	<!-- fonts -->
	<link href="//fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"
	    rel="stylesheet">
	<link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">
    
 
</head>
<body class="fix-header fix-sidebar card-no-border">
    
  
           
         <%
        if (session.getAttribute("admin")==null){
            response.sendRedirect("../loginjsp.jsp");
            return;
        }
        %>
     
        <!-- header -->
       
    <!-- ============================================================== -->
    <!-- Preloader - style you can find in spinners.css -->
    <!-- ============================================================== -->
    <div class="preloader">
        <svg class="circular" viewBox="25 25 50 50">
            <circle class="path" cx="50" cy="50" r="25" fill="none" stroke-width="2" stroke-miterlimit="10" /> </svg>
    </div>
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    
    
    <!-- ============================================================== -->
    <div id="main-wrapper">
        
        <!-- ============================================================== -->
        <!-- Topbar header - style you can find in pages.scss -->
        <!-- ============================================================== -->
      
           <jsp:include page="topbar1.jsp"></jsp:include>
         
           
        
        
        <!-- ============================================================== -->
        <!-- End Topbar header -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
          <jsp:include page="left-sidebar.jsp"></jsp:include>
        <!-- ============================================================== -->
        <!-- End Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Page wrapper  -->
        <!-- ============================================================== -->
    
       <div class="page-wrapper">
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            
            <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
               
                
                <!-- ============================================================== -->
                <!-- End Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
                <!-- Row -->
                <!-- Row -->
                         <div class="row">
                               
                                    
                                  <%  
                                       String op = request.getParameter("op");
                                       if(op!=null && op.equalsIgnoreCase("update_status")){
                                    int testid = request.getParameter("id") != null ? Integer.parseInt(request.getParameter("id")) : 0;
                                    TestDaos td = new TestDaos();
                                    Tests tests = td.getById(testid);
                                %>
                                <div class="card col col-md-10" style=" text-align: justify;text-justify: inter-word;">
                                    <div class="card-body">
                                        <div> <h2 class="card-title"><%=tests.getTestname() %></h2>
                                        </div> <BR><BR>
                                
                                        <form  method="get" role="form" class="contactForm">    
                                            <h4>Change Status </h4>
              <br>  <span><h4><input type="radio" name="status"  class="form-control" value="Pending"/> <%if(tests.getStatus().equals("Pending"))out.println(" checked"); %> <label> <b>Pending</b> </h4> </span>
                <br>  <span><h4><input type="radio" name="status"  class="form-control"  value="Approved"/> <%if(tests.getStatus().equals("Approved"))out.println(" checked"); %> <label> <b>Approve</b> </h4> </span>
                <br>  <span><h4><input type="radio" name="status"  class="form-control" value="Rejected"/> <%if(tests.getStatus().equals("Rejected"))out.println(" checked"); %> <label> <b>Reject</b> </h4> </span>
                   
                <p><input type="submit" name="submit" value="Save and Return" class="btn btn-primary form-control"/></p>
                                    </form>
                                </div>

 
                            </div>

            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
            <footer class="footer">
                
            </footer>
            <!-- ============================================================== -->
            <!-- End footer -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- End Page wrapper  -->
        <!-- ============================================================== -->
    </div>   
         
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
    
    <!-- footer -->
      
    <script src="plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="plugins/bootstrap/js/tether.min.js"></script>
    <script src="plugins/bootstrap/js/bootstrap.min.js"></script>
    <!-- slimscrollbar scrollbar JavaScript -->
    <script src="js/jquery.slimscroll.js"></script>
    <!--Wave Effects -->
    <script src="js/waves.js"></script>
    <!--Menu sidebar -->
    <script src="js/sidebarmenu.js"></script>
    <!--stickey kit -->
    <script src="plugins/sticky-kit-master/dist/sticky-kit.min.js"></script>
    <!--Custom JavaScript -->
    <script src="js/custom.min.js"></script>
  
    
    
    <script src="js/jquery-2.1.4.min.js"></script>
	<!-- bootstrap -->
	<script src="js/bootstrap.js"></script>
	<!-- smooth scrolling -->
	<script src="js/SmoothScroll.min.js"></script>
	<script src="js/move-top.js"></script>
	<script src="js/easing.js"></script>
	<!-- here stars scrolling icon -->
	<script>
		$(document).ready(function () {
			/*
				var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
				};
			*/

			$().UItoTop({
				easingType: 'easeOutQuart'
			});

		});
	</script>
 <%
    if(request.getParameter("submit")!=null){
         String status = request.getParameter("status");
       if(td.updateTestStatus(testid, status)){ 
             out.println("<script>alert('Status Updated');</script>");
         // response.sendRedirect("AllNews.jsp");
            
         }        
         else 
             out.println("<script>alert('Status cannot be Updated');</script>");
    }
    
    %>
    <%}%>
</body>

</html>