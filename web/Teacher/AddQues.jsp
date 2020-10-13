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
            if (session.getAttribute("teacher") == null) {
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
                            <!-- Column -->

                            <!-- Column -->
                            <!-- Column -->
                            <div class="col col-md-10" style="position: fixed;center:5px;">

                            <%      if (session.getAttribute("tests") == null) {
                                    response.sendRedirect("../CreateTest.jsp");
                                    return;

                                }
                                com.beans.Tests test1 = (com.beans.Tests) session.getAttribute("tests");
                                int testsid = test1.getTestid();
                                System.out.println("TEST selected name and id : " + test1.getTestname() + ", " + test1.getTestid());
                            %>
                            
                             <%
                        if (request.getParameter("submit") != null) {
                            System.out.println("Form is submitted ");
                        
                    %>
                    <jsp:useBean id="question" class="com.beans.Questions" scope="session"></jsp:useBean>
                    <jsp:setProperty name="question" property="*"></jsp:setProperty>

                    <%
                           
                            question.setTestid(testsid);
                            System.out.println("tEST id : " + question.getTestid());
                            QuesDaos qd = new QuesDaos();
                            if (qd.add(question)) {
                                out.println("<script> alert('Question added Successfully !!');</script>");
                            }

                                
                    }%>

                            <form  method="post" >
                                <table class="table">
                                    <tr><th colspan="2"><center><h1> <b>Add Questions here</b> </h1></center></th></tr>

                                    <input type="hidden" name="testsid" value="<%=testsid%>"/>


                                    <tr>
                                        <td>Enter Question : </td>
                                        <td>
                                            <textarea name="ques" rows="5" cols="10" class="form-control">
                                                ${questios.ques}
                                            </textarea> 
                                        </td>
                                    </tr>  
                                    <tr>
                                        <td>Enter Option 1: </td>
                                        <td><input type="text" name="op1" class="form-control" value="${questions.op1}"/></td>
                                    </tr>  
                                    <tr>
                                        <td>Enter Option 2: </td>
                                        <td><input type="text" name="op2" class="form-control" value="${questions.op2}"/></td>
                                    </tr>  
                                    <tr>
                                        <td>Enter Option 3: </td>
                                        <td><input type="text" name="op3" class="form-control" value="${questions.op3}"/></td>
                                    </tr>  
                                    <tr>
                                        <td>Enter Option 4: </td>
                                        <td><input type="text" name="op4" class="form-control" value="${questions.op4}"/></td>
                                    </tr>  
                                    <tr>
                                        <td>Enter Correct Option: </td>
                                        <td><input type="text" name="correctop" class="form-control" value="${questions.correctop}"/></td>
                                    </tr>  
                                    <tr>
                                        <td>   
                                            <input type="submit" value="Add the Question" class="btn btn-primary" name="submit"/>
                                        </td>
                                    </tr> 
                                </table>

                            </form>
                                   
                                   <a href="ShowQues.jsp?testid=<%=testsid%>" class="btn btn-primary"> FORM TEST</a>
                                    
                        </div>
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