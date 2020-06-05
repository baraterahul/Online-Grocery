<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="dbconnect.DatabaseConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Online Shopping</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Fonts -->
    <link rel="dns-prefetch" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Raleway:300,400,600" rel="stylesheet" type="text/css">

    <link rel="stylesheet" href="css/style.css">

    <link rel="icon" href="Favicon.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
</head>
<%
String f=(String)session.getAttribute("GrandT").toString();
String Discount=(String)session.getAttribute("fprice").toString();
String Total=(String)session.getAttribute("TotalPrice").toString();
System.out.print(f);

if(f==null && Discount==null && Total==null)
{
	 out.println("<script type=\"text/javascript\">");
	   out.println("alert('Please Purchase Product  Your Cart Is Empty..');");
	   out.println("location='buyproduct.jsp';");
	   out.println("</script>");	
}

%> 
<body>
<nav class="navbar navbar-expand-lg navbar-light navbar-laravel">
    <div class="container">
        <a class="navbar-brand" href="#">Enter Address</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto">
              
               
            </ul>

        </div>
    </div>
</nav>



  <%
  HttpSession ss1=request.getSession(false);
  String finalPrice=(String)ss1.getAttribute("GrandT").toString();
	  
  
 
    String CustEmail=(String)ss1.getAttribute("CustLogin");
   
   String TotalPrice=(String)ss1.getAttribute("TotalPrice").toString();
  
   String RetailerEmail=(String)ss1.getAttribute("RetailerEmail").toString();
   String DiscountAmount=(String)ss1.getAttribute("fprice").toString();
  
    %>
<main class="login-form">
    <div class="cotainer">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">Place Order</div>
                    <div class="card-body">
                        <form action="ProductPurchase" method="post">
                       
                         
                            <div class="form-group row">
                                <label for="email_address" class="col-md-4 col-form-label text-md-right">Total Price</label>
                                <div class="col-md-6">
                                    <input type="text" id="TotalAmount" value="<%=TotalPrice%>" class="form-control" name="TotalAmount" required autofocus>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="email_address" class="col-md-4 col-form-label text-md-right">DiscountAmount</label>
                                <div class="col-md-6">
                                    <input type="text" id="Discount" value="<%=DiscountAmount%>" class="form-control" name="Discount" required autofocus>
                                </div>
                            </div>
                            
                            
                           <input type="hidden" name="CustEmail" value="<%=CustEmail%>">
                            <input type="hidden" name="RetailEmail" value="<%=RetailerEmail%>">
                            
                             <div class="form-group row">
                                <label for="email_address" class="col-md-4 col-form-label text-md-right">Final Amount</label>
                                <div class="col-md-6">
                                    <input type="text" id="FinalAmount" value="<%=finalPrice%>" class="form-control" name="FinalAmount" required autofocus>
                                </div>
                            </div>
                           
                           
                            
                            

                            <div class="form-group row">
                                <label for="password" class="col-md-4 col-form-label text-md-right">Address</label>
                                <div class="col-md-6">
                                    <input type="text" id="password" class="form-control"  name="Address" required>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="password" class="col-md-4 col-form-label text-md-right">Pincode</label>
                                <div class="col-md-6">
                                    <input type="text" id="cpassword" class="form-control"  name="Pincode" required>
                                </div>
                            </div>
                               <div class="form-group row">
                                <label for="password" class="col-md-4 col-form-label text-md-right">Payment Mode</label>
                                <div class="col-md-6">
                                    <input type="text" id="cpassword" class="form-control" value="Only Cash On Delivery Available"  name="Pincode" disabled="disabled">
                                </div>
                            </div>
                            

                            <div class="col-md-6 offset-md-4">
                                <button type="submit" class="btn btn-primary">
                                    Order
                                </button>
                                
                            </div>
                            </form>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>
  

</main>
</body>
</html>