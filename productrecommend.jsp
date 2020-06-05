<%@page import="java.util.Iterator"%>
<%@page import="controller.CnnAlgo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dbconnect.DatabaseConnection"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Online Grocery</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="css/animate.css">
    
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">

    <link rel="stylesheet" href="css/aos.css">

    <link rel="stylesheet" href="css/ionicons.min.css">

    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/icomoon.css">
    <link rel="stylesheet" href="css/style.css">
  </head>
  <body class="goto-here">
		<div class="py-1 bg-primary">
    	<div class="container">
    		<div class="row no-gutters d-flex align-items-start align-items-center px-md-0">
	    		<div class="col-lg-12 d-block">
		    		<div class="row d-flex">
		    			<div class="col-md pr-4 d-flex topper align-items-center">
					    	<div class="icon mr-2 d-flex justify-content-center align-items-center"><span class="icon-phone2"></span></div>
						    <span class="text">+ 1235 2355 98</span>
					    </div>
					    <div class="col-md pr-4 d-flex topper align-items-center">
					    	<div class="icon mr-2 d-flex justify-content-center align-items-center"><span class="icon-paper-plane"></span></div>
						    <span class="text">youremail@email.com</span>
					    </div>
					    <div class="col-md-5 pr-4 d-flex topper align-items-center text-lg-right">
						    <span class="text">3-5 Business days delivery &amp; Free Returns</span>
					    </div>
				    </div>
			    </div>
		    </div>
		  </div>
    </div>
    <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container">
	      <a class="navbar-brand" href="index.html">Online Grocery</a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>

	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	          <li class="nav-item active"><a href="customerhome.jsp" class="nav-link">Home</a></li>
	          <li class="nav-item"><a href="#" class="nav-link">View Retailers Recommendation</a></li>
	          
	          <li class="nav-item"><a href="CustomerLogout" class="nav-link">Logout</a></li>
	         
	        

	        </ul>
	      </div>
	    </div>
	  </nav>
    <!-- END nav -->
  
    
   <%
Blob image = null;
Connection conn = null;
byte[ ] imgData = null ;


String Pid=(String)session.getAttribute("Productid");
String ProductName=(String)session.getAttribute("ProductName");
String RetailerEmail=(String)session.getAttribute("RetailerEmail");

try
{
	
Connection cc=DatabaseConnection.getConnection();
String queryy="select *  from product where productname='"+ProductName+"' and quantity >0 ";
PreparedStatement pss=cc.prepareStatement(queryy);
ResultSet rs=pss.executeQuery();
while(rs.next())
{
String Retailemail=rs.getString(8);
System.out.print(Retailemail);

ArrayList<String>Collaborative=new ArrayList<String>();


conn=DatabaseConnection.getConnection();
String query="select * from retailerregister where email ='"+Retailemail+"'";

Statement st = conn.createStatement();
ResultSet rs1 = st.executeQuery(query);



%>
  
    <section id="home-section" class="hero">
		  <div class="home-slider owl-carousel">
	      <div class="slider-item" style="background-image: url(images/grocery.jpg);">
	      	<div class="overlay"></div>
	        <div class="container">
	          <div class="row slider-text justify-content-center align-items-center" data-scrollax-parent="true">

	            <div class="col-md-12 ftco-animate text-center">
	             <table class="table table-bordered table-striped" style="background-color: white">
    <thead style="background-color: yellow">
      <tr >
     <th >Store Id</th>
      <th>Store Address</th>
      <th>Shop Name</th>
      <th>Email</th>
      <th>Contact</th>
      <!--  <th>Latitude</th>
        <th>Longitude</th> -->
       <!--  <th>Click for Shop</th> -->
        
        
      </tr>
    </thead>
    
    <tbody id="myTable">
    <% 			
   while(rs1.next())
	 
	 {
	 
	   Collaborative.add(rs1.getString(1));
	   Collaborative.add(rs1.getString(2));
	   Collaborative.add(rs1.getString(3));
	   Collaborative.add(rs1.getString(4));
	   Collaborative.add(rs1.getString(6));
	   System.out.print(Collaborative.toString());
	 %>
    <tr>
      <th scope="row"><%=rs1.getString(1)%></th>
									<th><%=rs1.getString(2)%></th>
									
									
									
									<th><%=rs1.getString(3)%></th>
										
									<th><%=rs1.getString(4)%></th>
									
									<th><%=rs1.getString(6)%></th>
									
									
									
									<%}
}
}
catch (Exception e) {
	e.printStackTrace();
}%>
									</tr>
    </table>
	            </div>

	          </div>
	        </div>
	      </div>

	      
	    </div>
    </section>

    

		

   
		

 

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


  <script src="js/jquery.min.js"></script>
  <script src="js/jquery-migrate-3.0.1.min.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/jquery.easing.1.3.js"></script>
  <script src="js/jquery.waypoints.min.js"></script>
  <script src="js/jquery.stellar.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/aos.js"></script>
  <script src="js/jquery.animateNumber.min.js"></script>
  <script src="js/bootstrap-datepicker.js"></script>
  <script src="js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="js/google-map.js"></script>
  <script src="js/main.js"></script>
    
  </body>
</html>