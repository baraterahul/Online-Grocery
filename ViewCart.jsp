<%@page import="dbconnect.DatabaseConnection"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
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
	          <li class="nav-item active"><a href="index.jsp" class="nav-link">Home</a></li>
	          <li class="nav-item"><a href="viewRetailer.jsp" class="nav-link">View Retailers</a></li>
	           <li class="nav-item"><a href="retailerlogin.jsp" class="nav-link">View Offers</a></li>
	          <li class="nav-item"><a href="retailerlogin.jsp" class="nav-link">Logout</a></li>
	         
	        

	        </ul>
	      </div>
	    </div>
	  </nav>
    <!-- END nav -->
    
   <%
Blob image = null;
Connection conn = null;
byte[ ] imgData = null ;



 conn=DatabaseConnection.getConnection();
String query="select * from cart";

Statement st = conn.createStatement();
ResultSet rs = st.executeQuery(query);




%>

  
    <section id="home-section" class="hero">
		  <div class="home-slider owl-carousel">
	      <div class="slider-item" style="background-image: url(">
	      	<div class="overlay"></div>
	        <div class="container">
	          <div class="row slider-text justify-content-center align-items-center" data-scrollax-parent="true">

	            <div class="">
	             <table class="table table-bordered table-striped" style="background-color: white">
    <thead style="background-color: yellow">
      <tr >
     <th >ProductName</th>
      <th>ProductBrand</th>
      
      <th>Price</th>
      <th>Quantity</th>
      <th>TotalPrice</th>
       <th>Remove Item</th>
      
       
        
       <!--  id, Pid, ProductName, ProductBrand, Quantity, Price, 
        TotalPrice, RetailerEmail, CustomerEmail, Datee -->
      </tr>
     
    </thead>
    
    <tbody id="myTable">
    
    <% 			
   while(rs.next())
	 {%>
    <tr>
      <th scope="row"><%=rs.getString(3)%></th>
									<th><%=rs.getString(4)%></th>
									
									
									
									<th><%=rs.getString(5)%></th>
										
									<th><%=rs.getString(6)%></th>
									
									<th><%=rs.getString(7)%></th>
									<td><a href="update.jsp?id=<%=rs.getString(1)%>">Remove</a></td>
									
									<%} %>
									</tr>
									
    </table>
    <% 
    HttpSession session1=request.getSession(false);
    String RetailerEmail=(String)session.getAttribute("RetailerEmail");
    String CustomerEmail=(String)session1.getAttribute("CustLogin");
    
    Date date = new Date();  
	  SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");  
	  String Datee = formatter.format(date);  
	  System.out.println(Datee); 
	  
    Connection con=DatabaseConnection.getConnection();
    String sql="select sum(TotalPrice) from cart where RetailerEmail='"+RetailerEmail+"' and CustomerEmail='"+CustomerEmail+"' and Datee='"+Datee+"' ";
    PreparedStatement pst=con.prepareStatement(sql);
    ResultSet rr=pst.executeQuery();
    while(rr.next())
    {
    %>
    <form action="Address.jsp" method="post">
     <input type="hidden" name="RetailEmail" value="<%=RetailerEmail%>">
      <input type="hidden" name="CustMail" value="<%=CustomerEmail%>">
   <label>Grand Total=</label><input type="text" name="grandTotal" value="<%=rr.getString(1)%>" disabled="disabled"><br></br>
   <input type="hidden" name="grandTotal1" value="<%=rr.getString(1)%>">
   <%HttpSession ss=request.getSession();
    ss.setAttribute("TotalPrice",rr.getString(1));
   %>
    <input type="submit" value="Place Order">
    <%} %>
     </form>
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