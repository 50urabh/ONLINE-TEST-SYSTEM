<%@page import="com.beans.Questions"%>
<%@page import="com.daos.QuesDaos"%>
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
        if (session.getAttribute("stud")==null){
            response.sendRedirect("../loginjsp.jsp");
            return;
        }
        
        com.beans.Stud student1 = (com.beans.Stud)session.getAttribute("stud");
        int studid =student1.getId();
        System.out.println("Logged In Student : " + student1.getName() + ", " + student1.getId());
        
  
   
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

                           <center>
                               <script type="text/javascript">
                                   function countDown(secs,elem)
                                   {
                                       var element = document.getElementById(elem);
                                       element.innerHTML="Time left "+secs+" seconds";
                                       if(secs<1)
                                        {
                                            clearTimeout(timer);
                                            element.innerHTML ='<h2>MOVE TO NEXT QUESTION</h2>';
                                        }
                                        secs--;
                                       var timer=setTimeout('countDown('+secs+',"'+elem+'")',1000);
                                   }
                               </script>
                               
                               <div id="status"></div>
       	
	 <script type="text/javascript">countDown(60,"status");
                                   
                               </script>
                               
                               
	<section id="contact-page">
        <div class="container">
            <div class="center">        
                               <font size="20" color="#0080ff" face="Courier New">   <b><u>TEST </u></b></font>
                <hr> <h2 align="center">
                    <p><b>Select Your Option And Click Next To Proceed</b></p><h2></hr>
            </div> 
            <div class="row contact-wrap"> 
                <div class="status alert alert-success" style="display: none"></div>
                <div class="col-md-10 col-md-offset-3">
                    <div id="sendmessage"></div>
                    <div id="errormessage"></div>
                <% int marks= request.getParameter("marks")!=null? Integer.parseInt(request.getParameter("marks")) :0;%>

                    
	<%
             HttpSession sessionObj=request.getSession(false);
           //  int testid=(Integer)sessionObj.getAttribute("testid");
           int testid = Integer.parseInt(request.getParameter("testid"));
             ArrayList<Questions> questions=new QuesDaos().getById(testid);
             int sno = request.getParameter("sno")!=null? Integer.parseInt(request.getParameter("sno")) :0;
              System.out.print(questions);
       
              if(request.getParameter("submit")!=null){
                  String userAns = request.getParameter("ans");
                  if(userAns.equalsIgnoreCase(questions.get(sno-1).getCorrectop())){
                    marks++;  
                  }
                      
              }
        
        
        %>				
					
                    <form  method="get" role="form" class="contactForm">
                        <%
                           if(questions.size()>0) { 
                            Questions ques = questions.get(sno);
                        %>
                            <br/>
                            <div class="row bg-light-info" align="left" style="border-style: solid; border-radius: 10px; border-width:3px">
                                 
                              <div class ="col"> 
                              <h2><%=ques.getQues()%></h2>
                              <span><h4><input type="radio" name="ans"  class="form-control" value="<%=ques.getOp1()%>"/> <label> <b><%=ques.getOp1()%> </b> </h4> </span>
                       <br>  <span><h4><input type="radio" name="ans"  class="form-control" value="<%=ques.getOp2()%>"/> <label> <b><%=ques.getOp2()%> </b> </h4> </span>
                       <br>  <span><h4><input type="radio" name="ans"  class="form-control" value="<%=ques.getOp3()%>"/> <label> <b><%=ques.getOp3()%> </b> </h4> </span>
                       <br>  <span><h4><input type="radio" name="ans"  class="form-control" value="<%=ques.getOp4()%>"/> <label> <b><%=ques.getOp4()%> </b>  </h4> </span>
                       </div>
                            </div>
			<%}%>				
                        <br><br>		
                        <div class="text-center">
                                                    <div class="text-center">
                                                    <% if(sno<questions.size()-1){ sno++; %>
                                                    <button type="submit" class="btn btn-primary btn-lg" name="submit" required="required">Save and Next</button>
                                                <%}
else {%>                                                
<button type="submit" formmethod="get" class="btn btn-primary btn-lg" name="btn_submittest" required="required" formaction="submitTest.jsp">Submit Test</button>
       <%}%> 
       
                                                    <input type="hidden" name="sno" value="<%=sno%>"/>
                                                    <input type="hidden" name="testid" value="<%=testid%>"/>
                                                    <input type="hidden" name="marks" value="<%=marks%>"/>
                                                    <input type="hidden" name="attempt" value="<%=questions.size()%>"/>
                                                    
                                                </div>
                    </form>                       
                </div>
            </div><!--/.row-->
        </div><!--/.container-->
    </section><!--/#contact-page-->
	
                               
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

</html>