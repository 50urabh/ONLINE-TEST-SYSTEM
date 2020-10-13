<%@page import="java.sql.*"%>
<%@page import="com.daos.SubjectDaos"%>
<%@page import="com.beans.Subjects"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.jdbc.ConnectionPool"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="com.beans.Tests,com.beans.Teacher,java.util.ArrayList"%>

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
    <link href="css/style_1.css" rel="stylesheet">
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
        if (session.getAttribute("teacher")==null){
            response.sendRedirect("../loginjsp.jsp");
            return;
        }
        com.beans.Teacher teacher1 = (com.beans.Teacher)session.getAttribute("teacher");
        int teachrid =teacher1.getId();
        System.out.println("Logged In Teacher : " + teacher1.getName() + ", " + teacher1.getId());
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
                    <!-- Column -->
                  
                    <!-- Column -->
                    <!-- Column -->
  <jsp:useBean class="com.beans.Tests" id="tests" scope="session"></jsp:useBean>
     <jsp:useBean class="com.beans.Teacher" id="teacher" scope="session"></jsp:useBean>   
        <jsp:useBean class="com.beans.Subjects" id="subjects" scope="session"></jsp:useBean>  
        
     
                           <center>
                             
                                <div class="container">
                                    <div class="row">
                                        
                                            <div class="col col-md-10" style="position: fixed; bottom:200px;">
                                        <%if (request.getParameter("submit") != null) {
                                                 int subid = Integer.parseInt(request.getParameter("subid"));
                                                session.setAttribute("subid", subid);
                                                
                                        %>
                                        <jsp:setProperty name="tests" property="*"></jsp:setProperty>
                                            <form action="../TestController?op=add" method="post" > 
                                                <input type="hidden" name="tchrid" value="<%=teachrid%>"/>
                                       
                                            Select Subject :  <select onchange="submitForm();" name="subid" id="subid" class="dropdown dropdown-header form-control">
                                      <option value="0">Select SUBJECT FOR TEST </option>
                                      
       
                        <%
                            try {
                                ConnectionPool cp = ConnectionPool.getInstance();
                                cp.initialize();
                                Connection con = cp.getConnection();
               if (con != null) {
                String sql = "select * from subjects";
                PreparedStatement smt = con.prepareStatement(sql);

                ResultSet rs = smt.executeQuery();
                                  int i = 1;
                                  while (rs.next()) {%>
                                  <option value="<%=rs.getInt("subid")%>" > <%=rs.getString("subname")%> </option>
                        <br/>
                        <%}
                                  cp.putConnection(con);
                                  smt.close();
                                }
                            } catch (Exception e) {
                                System.out.println("Error " + e.getMessage());
                            }
                        %>
                    </select>
                                                <input type="submit" value="Click to Add Questions in the test " class="btn btn-primary" name="submit"/>
                                            </form>
                                        <%
                        }%>
                                    </div>
                                        
                                        
                                        
                                        
                                        
                                            <div class="col col-md-10" style="position: fixed;center:5px;">
                                                   
                                    
                                      
                                        <jsp:setProperty name="tests" property="*"></jsp:setProperty>
                                       <%-- <jsp:setProperty name="teacher" property="*"></jsp:setProperty> --%>
                                      <%--  <jsp:setProperty name="subjects" property="*"></jsp:setProperty>--%>
                                               <form method="post" class="form" >
                                                             <table class="table">
                                                <tr><th colspan="2"><center><h1> <b>CREATE TEST HERE</b> </h1></center></th></tr>
                                        <br>
         <br>
                                                <tr>
                                                    <td>Enter TEST NAME</td>
                                                    <td><input type="text" name="testname" class="form-control" value="${tests.testname}"/></td>
                                                </tr> 
                                             

                                                      <input type="hidden" name="subid" value="${subjects.subid}"/>
                                               
                                                
                                                <input type="hidden" name="status" value="Pending"/>
                                               
                                             

                                            </table> 
                                               <input type="submit" value="Save and Next" name="submit" id ="submit" class="form-control btn btn-primary"/>
                                        </form>        
                                    </div>
                                   



                                 


                                </div>
                            </div>
                        </center>

                    <!-- Column -->
                </div>
                
                
                
                    </div>
                    <!-- Column -->
                </div>
                <!-- Row -->
                <!-- ============================================================== -->
                <!-- End PAge Content -->
                <!-- ============================================================== -->
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
   
</body>

</html