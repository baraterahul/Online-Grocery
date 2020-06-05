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
  <h2>View Cart</h2>
  <p></p>  
 
   
  <input class="form-control" id="myInput" type="text" placeholder="Search..">
  <br>
  
 <a href="buyproduct.jsp" class="previous">&laquo; Back</a>

  <a href="CustomerLogout" class="previous">&laquo; Logout</a>
  
  <%
Blob image = null;
Connection conn = null;
byte[ ] imgData = null ;

String REmail=(String)session.getAttribute("RetailerEmail");
String CEmail=(String)session.getAttribute("CustLogin");
 conn=DatabaseConnection.getConnection();
String query="select * from cart where RetailerEmail='"+REmail+"' and CustomerEmail='"+CEmail+"' ";

Statement st = conn.createStatement();
ResultSet rs = st.executeQuery(query);




%>
													
  <table class="table table-bordered table-striped">
    <thead>
      <tr>
      <th >ProductName</th>
      <th>ProductBrand</th>
        <th>Quantity</th>
      <th>Price</th>
    
      <th>TotalPrice</th>
       <th>Remove Item</th>
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
									<td><a href="RemoveCart.jsp?id=<%=rs.getString(1)%>">Remove</a></td>
									
									<%} %>
									</tr>
    </tbody>
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
    String sql="select sum(TotalPrice) from cart where RetailerEmail='"+RetailerEmail+"' and CustomerEmail='"+CustomerEmail+"'";
    PreparedStatement pst=con.prepareStatement(sql);
    ResultSet rr=pst.executeQuery();
    while(rr.next())
    {
    	float total=rr.getFloat(1);
    %>
  
     <input type="hidden" name="RetailEmail" value="<%=RetailerEmail%>">
      <input type="hidden" name="CustMail" value="<%=CustomerEmail%>">
   <label>Grand Total=</label><input type="text" id="grandTotal1" name="grandTotal" value="<%=rr.getString(1)%>" disabled="disabled"><br></br>
   <input type="hidden" id="grandTotal1" name="grandTotal1" value="<%=rr.getString(1)%>">
   
   <%
   Double Gtotal=rr.getDouble(1);
   System.out.print("Empty Cart"+Gtotal);
   if(Gtotal==null)
   {
	   out.println("<script type=\"text/javascript\">");
	   out.println("alert('Cart is Empty ...Please purchase from product..');");
	   out.println("location='buyproduct.jsp';");
	   out.println("</script>"); 
   }
   
   %>
  
   <% 
                           
                            Connection con5=DatabaseConnection.getConnection();
                            String query5="select * from retaileroffer";
                                		PreparedStatement ps=con.prepareStatement(query5);
                                	/* 	ps.setString(1, RetailMail1); */
                                		ResultSet rs5=ps.executeQuery();
                                		
                                			
                            %>
                             <% while(rs5.next())
                                				{
                                				float discount1=rs5.getFloat(3);
                                				float amt=rs5.getFloat(2);
                                				%>
    <label>Offer-</label><input type="text" name="discount" value="<%=rs5.getString(5)%>" disabled="disabled"><br></br>
   
            
  
   <%
   Double tprice=rr.getDouble(1);
   if(tprice>0)
   {
	   HttpSession ss=request.getSession();
	   ss.setAttribute("TotalPrice",rr.getString(1)); 
   }
   else
   {
	   out.println("<script type=\"text/javascript\">");
	   out.println("alert('Please Purchase Product  Your Cart Is Empty..');");
	   out.println("location='buyproduct.jsp';");
	   out.println("</script>");	 
   }
   
    if(total > amt)
    {
    float finalprice=( discount1 * total ) /100;
    System.out.print(finalprice);
    float GrandTotal= total -finalprice;
    HttpSession ss1=request.getSession();
    ss1.setAttribute("fprice", finalprice);
   ss1.setAttribute("GrandT",GrandTotal);
   System.out.println(finalprice);
   System.out.println(GrandTotal);
   
    }
    else
    {
    	float finalprice=0;
    	 System.out.println(total);
    	 HttpSession s11=request.getSession();
    	 s11.setAttribute("GrandT", total);
    	 s11.setAttribute("fprice", finalprice);
    }
   %>
     <%} %>
   <a class="btn btn-primary"  href="EnterAddress.jsp"  role="button" onclick="required()">Place Order</a>
  
    <%} %>
   
  
</div>

<script>
function required()
{
var empt = document.forms["grandTotal"].value;
if (empt == 0.0)
{
alert("Please input a Value");
return false;
}
else 
{
alert('Code has accepted : you can try another');
return true; 
}
}

</script> 
<script>
function myFunction() {
 
  var grandTotal = document.getElementById("grandTotal1");
  if (grandTotal==0.0) {
    document.getElementById("grandTotal").innerHTML = "Empty Cart Please Purchase Product";
  }
}
</script>

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