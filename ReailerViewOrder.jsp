<%@page import="dbconnect.DatabaseConnection"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Online Shopping</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1">
<style>
a {
  text-decoration: none;
  display: inline-block;
  padding: 8px 16px;
}

a:hover {
  background-color: #ddd;
  color: black;
}

.previous {
  background-color: #f1f1f1;
  color: black;
}

.next {
  background-color: #4CAF50;
  color: white;
}

.round {
  border-radius: 50%;
}
</style>
</head>
<body>
<div class="container">
  <h2>Retailer View Order</h2>
  <p></p>  
 
   
  <input class="form-control" id="myInput" type="text" placeholder="Search..">
  <br>
  
 <a href="retailerhome.jsp" class="previous">&laquo; Back</a>

  <a href="retailerlogout" class="previous">&laquo; Logout</a>
  
  <%
Blob image = null;
Connection conn = null;
byte[ ] imgData = null ;

HttpSession ss=request.getSession(false);
String remail=(String)ss.getAttribute("retailemail");
System.out.print(remail);

 conn=DatabaseConnection.getConnection();
String query="select * from purchaseproduct where RetailEmail='"+remail+"'";

Statement st = conn.createStatement();
ResultSet rs = st.executeQuery(query);



%>
													
  <table class="table table-bordered table-striped">
    <thead>
      <tr>
     <th >Order Id</th>
      <th >Customer Email</th>
      <th>Retail Email</th>
      
      <th>Total Amount</th>
      <th>Discount Amount</th>
      <th>Final Amount</th>
       <th>Address</th>
        <th>Pincode</th>
        <th>Date</th>
      </tr>
    </thead>
   
    <tbody id="myTable">
       <% 			
   while(rs.next())
	 {%>
    <tr>
      <th scope="row"><%=rs.getString(1)%></th>
									<th><%=rs.getString(2)%></th>
									
									
									
									<th><%=rs.getString(3)%></th>
										
									<th><%=rs.getString(4)%></th>
									
									<th><%=rs.getString(5)%></th>
									<th><%=rs.getString(6)%></th>
									<th><%=rs.getString(7)%></th>
									<th><%=rs.getString(8)%></th>
									<th><%=rs.getString(9)%></th>
									
									
									<%} %>
									</tr>
    </tbody>
  </table>
 
  
</div>

<script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>
</body>
</html>