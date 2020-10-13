

<%@page import="com.daos.ResultDaos"%>
<%@page import="com.beans.Result"%>
<%@page import="com.daos.TeachDaos"%>
<%@page import="com.daos.TestDaos"%>
<%@page import="com.daos.SubjectDaos"%>
<%@page import="com.daos.QuesDaos"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.beans.Questions"%>
<%@page import="com.jdbc.ConnectionPool"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="com.beans.Tests,java.util.ArrayList"%>

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
        if (session.getAttribute("stud")==null){
            response.sendRedirect("../loginjsp.jsp");
            return;
        }
        
        com.beans.Stud student1 = (com.beans.Stud)session.getAttribute("stud");
        int studid =student1.getId();
        System.out.println("Logged In Student : " + student1.getName() + ", " + student1.getId());
        int subid =(Integer )session.getAttribute("subjectid");
       com.beans.Subjects subject1 = new SubjectDaos().getById(subid);
        %>
     
        <!-- header -->
       
    <!-- ============================================================== -->
    <!-- Preloader - style you can find in spinners.css -->
    <!-- ============================================================== -->
    <div class="preloader">
        <svg class="circular" viewBox="25 25 50 50">
            <circle class="path" cx="50" cy="50" r="25" fill="none" stroke-width="2" stroke-miterlimit="10" /> </svg>
    </div>
    <!-- =2============================================================= -->
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
     <form action="../ResultController?op=add" method="post" > 
                           <center>
                             
                               <font size="20" color="#0080ff" face="Courier New">   <b><u>Result of your Test </u></b></font>
          <br><br>
        <%
            int marks= request.getParameter("marks")!=null? Integer.parseInt(request.getParameter("marks")) :0; 

            int testid = Integer.parseInt(request.getParameter("testid"));
             Tests test = new TestDaos().getById(testid);
       
             ArrayList<Questions> questions=new QuesDaos().getById(testid);
             int sno = request.getParameter("sno")!=null? Integer.parseInt(request.getParameter("sno")) :0;
             String userAns = request.getParameter("ans");
                  int attempt = Integer.parseInt(request.getParameter("attempt"));
                  if(userAns.equalsIgnoreCase(questions.get(sno).getCorrectop()))
                      marks++;
              
      
            %>
               
            <div class="jumbotron">
                <h2>
                <table class="center" width="50%" border='5' cellspacing='0' class="table table-striped" >
                    <tr> <td><b>Student Name   </b></td> <td><%=student1.getName()%> <br/></tr>
                   <tr> <td><b>Test Name      </b></td> <td> <%=test.getTestname()%><br/></tr>
                  
                    <tr> <td><b> This Test is Develped By </b></td> <td>  <%=new TeachDaos().getById(test.getTchrid()).getName()%></tr>
                </h2>
        </table>
            </div>
            <font size="16" face="Courier New">   
            <table class="center" width="100%" border='5' cellspacing='0' class="table table-striped" >
            <tr>
                <th><b>Total Questions</b></th> <th><b>Correct Answers</b></th> <th><b>Wrong Answers</b></th> <th><b>Total Score</b></th>
            </tr>
         
            <tr>
                <td><%=attempt%></td> <td><%=marks%></td> <td><%=attempt- marks%></td> <td><%= marks*10%></td>
            </tr>
            
            </table></font>
            <br>
            <br>
            
           <input type="hidden" name="studid" value="<%=studid%>"/>
            <input type="hidden" name="subid" value="<%=subid%>"/>
             <input type="hidden" name="testid" value="<%=testid%>"/>
        
            
            </table>
	
                               
                        </center>
     </form>
                    <!-- Column -->
                </div>
                
     <%
         Result result = new Result();
         result.setAttempt(attempt);
         result.setCorrect(marks);
         int score = marks*10;
         int percentage = score*100/attempt*10;
         result.setScore(score);
         result.setWrong(attempt-marks);
         result.setStudid(studid);
         result.setSubid(subid);
         result.setTestid(testid);
         result.setResult(percentage>=40?"Pass":"Fail"); 
ResultDaos rds = new ResultDaos();
if(rds.add(result))
    out.println("<script> alert('Result Saved to Server ');</script>");
  %>
  <a href="givetest.jsp" class="btn btn-primary">Click Here to Give Another Text</a>    
  <a href="viewans.jsp" align="right" class="btn btn-primary">VIEW SUBMITTED ANSWERS</a> 
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