<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<%@page contentType="text/html" pageEncoding="UTF-8" import="com.beans.Teacher" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
	<title>Best Study an Education Category Bootstrap Responsive Website Template | Join Us :: w3layouts</title>
        <link rel="icon" href="images/graduate.png" type="image/x-icon"/>
	<!-- meta-tags -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
        
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="keywords" content="Soft Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<a href="joinust.jsp"></a>
	
        <script>
             function readURL(input) {
                    if (input.files && input.files[0]) {
                        var reader = new FileReader();

                        reader.onload = function (e) {
                            preview.src = e.target.result;
                        };

                        reader.readAsDataURL(input.files[0]);
                    }
                }
                
   function matchPwd(x,y)
    {
        if(x===y)
            return true;
        else
        {
            alert('sorry! Password and Confirm Passsword not matched');
            return false;
        }
    }
    
    function checkValue(x,y)
    {
        if(x.checked==true)
        {
           y.disabled=false;
        }
        else
        {
            y.disabled=true;
        }
    }


  
            function checkUserid(x,y){
                ajax = new XMLHttpRequest();
                ajax.open("GET","TeachController?op=check_userid&userid="+x,true);
                ajax.send();
                
                ajax.onreadystatechange=function(){
                    if(this.readyState==4 && this.status==200){
                        y.innerHTML = this.responseText;
                    }
                }
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
        
           <!-- Page Heading -->
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
              <jsp:useBean id="teacher" class="com.beans.Teacher" scope="session"></jsp:useBean>
        <div class="container">
            <div class="row">
                
             
	<div class="register-form-main">
		<div class="container">
                 
	  <div class="col col-md-6">
                        <center>
                        <% if (request.getParameter("submit") != null) {%>

                    
                        <jsp:setProperty name="teacher" property="*"></jsp:setProperty>


                     <%--   <% String hobbies[] = request.getParameterValues("hobbies");
                            String hbs = "";
                            for (String s : hobbies) {
                                hbs += s + ",";
                            }
                            person.setHobbies(hbs); %>
                     --%>

                        <form action="TeachController?op=add" method="post" enctype="multipart/form-data" class="form">
                            <h4>Upload Profile Image </h4>
                            <img src="assets/images/nopic.jpg" style="width:300px;height: 300px" class="img img-thumbnail" id="preview"/> <br/>
                            <input type="file" name="image" class="form-control bg-dark" onchange="readURL(this);"/><br/>
                            <input type="submit" value="Register Me" class="btn btn-primary form-control"/>
                        </form>
                            <br/>
                            <a href="joinust.jsp" class="btn btn-success"> << Check Previous Data</a>
                        <%} else {
                                out.println("<b> Please Complete  Registration Page-1</b> <br/>"
                                        + "<a href='joinust.jsp'> Go To Register Page</a>");
                            }%>

                    </center>
                </div>
						</div>
					
					</div>
					
				
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
	<!-- Calendar -->
	<link rel="stylesheet" href="css/jquery-ui.css" />
	<script src="js/jquery-ui.js"></script>
	<script>
		$(function () {
			$("#datepicker,#datepicker1,#datepicker2,#datepicker3").datepicker();
		});
	</script>
	<!-- //Calendar -->
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

</body>

</html>