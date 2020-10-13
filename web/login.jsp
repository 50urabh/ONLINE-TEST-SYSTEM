
<%@page import="com.beans.Teacher"%>
<%@page import="com.daos.TeachDaos"%>

<!DOCTYPE html>



<%@page import="com.beans.Admin"%>
<%@page import="com.daos.AdminDaos"%>



<%@page import="com.beans.Stud"%>
<%@page import="com.daos.StudDaos"%>
<html lang="zxx">


<head>
	<title>Best Study an Education Category Bootstrap Responsive Website Template | Login :: w3layouts</title>
        <link rel="icon" href="images/graduate.png" type="image/x-icon"/>
	<!-- meta-tags -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="keywords" content="Soft Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
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
	<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
	<!-- font-awesome -->
	<link href="css/font-awesome.css" rel="stylesheet">
	<!-- fonts -->
	<link href="//fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"
	    rel="stylesheet">
	<link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">
</head>

<body>
    
    <%
          //Reading cookie 
           Cookie cookies[] = request.getCookies();
           String userid="",password="";
           
           for(Cookie c : cookies){
               if(c.getName().equals("userid"))
               {
                   userid=c.getValue();
               }
               if (c.getName().equals("password"))
               {
                   password = c.getValue();
               }
           }
       %>    
    
    
    
	<!-- header -->

        <jsp:include page="header.jsp"></jsp:include>
        
        
	<!-- banner -->
	<div class="inner_page_agile">

	</div>
	<!--//banner -->
	<!-- short-->
	<div class="services-breadcrumb">
		<div class="inner_breadcrumb">
			<ul class="short_ls">
				<li>
                                    <a href="joinus.jsp">STUDENTS REGISTRATION</a>
					<span>| |</span>
				</li>
				<li>
                                    <a href="joinust.jsp">TEACHERS REGISTRATION</a>
					
				</li>
			</ul>
		</div>
	</div>
	<!-- //short-->
	<div class="register-form-main">
		<div class="container">
                    
			<div class="title-div">
                             
				<h3 class="tittle">
					<span>L</span>ogin
                                        <span>A</span>s
                                        <br><br>
						</h3>
				<div class="tittle-style">

				</div>
			</div>
			<div class="login-form">
				 <form class="form-signin"  method="post">
					<div class="">
                                            <p><h3>User Name </h3></p>
						<input type="text" class="name" placeholder="userid"   name="userid" value="<%=userid%>"  autocomplete="off" required autofocus name="userid">
					</div>
					<div class="">
						<p><h3> Password </h3> </p>
						<input type="password" class="password" placeholder="Password"   value="<%=password%>" name="password" required>
					</div>
					<label class="anim">
						<input type="checkbox" name="remember" value="remember" class="checkbox"> 
						<span> Remember me ? </span>
					</label>
					<div class="login-agileits-bottom wthree">
						<h6>
							<a href="#">Forgot password?</a>
						</h6>
					</div>
<div style="border-style: solid; border-radius: 10px; border-width:3px"> 
    <BR>
    <h2> Select Role  :
    <input type="radio" name="role" id="role1"  class="form-control" value="stud"/>  <label for="role1"><b>Student </b></label>
    <input type="radio" name="role" id="role2" class="form-control" value="teacher"/> <label for="role2"><b>Teacher</b></label>  
    <input type="radio"  name="role" id="role3" class="form-control"  value="admin"/> <label for="role3"><b>Admin</b></label>  
<!--  <input type="radio" disabled name="role" id="role3" class="form-control"  value="admin"/> <label for="role3"><b>Admin</b></label>  -->
                    
                    </h2> 
  </div>
					
                                        <br><br>
                                      <button class="btn btn-lg btn-primary btn-block" type="submit" name="submit">Sign in</button>
                                      <br>
                                      <br>
                                       <div class="register-forming">
                                            <p><h2>To Register New Account --
                                                        <a href="joinus.jsp">Click Here</a>
                                                   </h2> </p>
                                                    
					</div>
                                      
                                      
				</form>
                                       
			</div>

		</div>
	</div>

	<!-- footer -->
        
        
        <jsp:include page="footer.jsp"></jsp:include>
        
	<!--/footer -->

	<!-- js files -->
	<!-- js -->
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
	<!-- //here ends scrolling icon -->
	<!-- smooth scrolling -->
	<!-- //js-files -->
        
        
      <%if(request.getParameter("submit")!=null){
           userid= request.getParameter("userid");
           password = request.getParameter("password");
           String role = request.getParameter("role");
           
        if(role==null){
            response.sendRedirect("login.jsp?msg=Please Select Any One Role");
            
            //return;
        }
       
    else if (role.equals("stud")){
           StudDaos rd = new StudDaos();
           int id = rd.isValid(userid, password);
           if(id!=-1)
           {
               Stud stud = rd.getById(id);
               session.setAttribute("stud", stud);
               response.sendRedirect("Student/dashboards.jsp");
           }
           else 
               response.sendRedirect("login.jsp?msg=Invalid Userid or password"); 
           }
        
        else if (role.equals("teacher")){
           TeachDaos td = new TeachDaos();
           int id = td.isValid(userid, password);
           if(id!=-1)
           {
               Teacher teacher = td.getById(id);
               session.setAttribute("teacher", teacher);
               response.sendRedirect("Teacher/dashboardt.jsp");
           }
           else 
               response.sendRedirect("login.jsp?msg=Invalid Userid or password"); 
           }
        
        else if(role.equals("admin")){
           // response.sendRedirect("loginjsp.jsp?msg=Please Select Any One Role");
             AdminDaos ad = new AdminDaos();
           int id = ad.isValid(userid, password);
           if(id!=-1)
           {
               Admin admin = ad.getById(id);
               session.setAttribute("admin", admin);
               response.sendRedirect("Admin/AdminPro.jsp");
           }
           else 
               response.sendRedirect("login.jsp?msg=Invalid Userid or password"); 
           }
        
        
        
        
           
           }
      %>
  
        

</body>

</html>