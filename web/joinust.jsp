<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
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
                    <div class="title-div">
                       <h2 align="middle">
                            <span>
                                <b>PLEASE NOTE ONCE REGISTERED YOU WILL BE ABLE TO LOGIN AS A TEACHER ONLY IF APPROVED BY ADMIN
                                WHICH MAY TAKE 24Hours</b>
                            </span>
                      
                        </h2>
                       
                        <br><br>
                        
				<h3 class="tittle">
					<span>A</span>dmission
					<span>F</span>orm
                                        <span>F</span>or
                                        <span>T</span>eachers
				</h3>
				<div class="tittle-style">

				</div>
			</div>
			<div class="register-form">
                              <form method="post" class="form" action="joinustp.jsp" id="form1" onsubmit="return matchPwd(password.value,cpassword.value);">
   <b> User Id : </b><input type="text" placeholder="User Id" name="userid"  class="form-control" value="${teacher.userid}" id="userid" onblur="checkUserid(this.value,sp1);">
                              <span id ="sp1"> </span>
    <br><br>
    <b>Name : </b><input type="text" placeholder="Your Name" name="name" class="form-control" value="${teacher.name}"/>
    <br><br>
    <b>Father Name :</b> <input type="text" placeholder="Father Name" name="fname" class="form-control" value="${teacher.fname}"/>
    <br><br>
    <b>Birth Date : </b><input type="date" placeholder="Birth Date" name="dob" class="form-control" value="${teacher.dob}"/>
    <br><br>
    <b>Gender : </b>
   
     <input type="radio" name="gender"  value="Male" ${teacher.gender eq "Male"? "checked":""} />Male
                                    
    <input type="radio" name="gender"  value="Female" ${teacher.gender eq "Female"? "checked":""} /> Female
    <br><br>
    <b>Your E-mail :</b> <input type="email" placeholder="Your E-mail" name="email" class="form-control" value="${teacher.email}"/>
    <br><br>
    <b>Phone Number : </b><input type="phone" placeholder="Phone Number" name="phone" class="form-control" value="${teacher.phone}"/>
    <br><br>
    <b>Address : </b><input type="text" name="address" placeholder="address" title="Please enter your Address" class="form-control" value="${teacher.address}"/>
    <br><br> 
    <b>City : </b><input type="text" name="city" placeholder="city" title="Please enter your City" class="form-control" value="${teacher.city}"/>
    <br><br>
    <b>Zip Code : </b><input type="text" name="zipcode" placeholder="Zip code" title="Please enter your Zip code" class="form-control" value="${teacher.zipcode}"/>
    <br><br>
    <b>Password : </b><input type="password" pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$" placeholder="password must be more than 8 char and combination of upper lower spcl crcter and no" name="password" id="password" class="form-control" value="${teacher.password}"/>
    <b>Confirm Password : </b><input type="password" name="cpassword" id="cpassword" class="form-control" value="${teacher.password}"/>
    <br><br><br>
    <input type="checkbox" value="accept" name="accept" id="accept" onchange="checkValue(this,submit);" />  <span><B>I Accept Terms & Conditions</B></span>
    
   <input type="hidden" name="status" value="pending"/>
   <input type="submit" value="Save and Next" name="submit" id ="submit" class="form-control btn btn-primary" disabled="disabled"/> 
    
             </form>
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