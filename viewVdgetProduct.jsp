<%@page import="controller.BudgetShopping"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dbconnect.DatabaseConnection"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<style>
ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333;
}

li {
  float: left;
}

li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

li a:hover {
  background-color: #111;
}
</style>
<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
</style>
</head>
<body>
<ul>
  <li><a class="active" href="#home">Home</a></li>
 
  <li><a href="CustomerLogout">Logout</a></li>
</ul>

<%
HashMap<String, Integer>map=new HashMap<>();
ArrayList<Integer>al=new ArrayList<Integer>();
ArrayList<Integer>add=new ArrayList<>();
Connection con=DatabaseConnection.getConnection();
/*String query="SELECT DISTINCT productname from  product where (sum(price)) <'"+budget+"'";*/
String query="SELECT  *  FROM  product ";
PreparedStatement ps=con.prepareStatement(query);
ResultSet rs=ps.executeQuery();
while(rs.next())
{
	
	
	Integer productID=rs.getInt(1);
	String productname=rs.getString(2);
	Integer productsPrice=rs.getInt(6);
	
	System.out.print(productID);
	System.out.print(productname);
	System.out.println(productsPrice);
	al.add(productID);
	
	al.add(productsPrice);
	
	
	map.put(productname, productsPrice);
	

} %>
<h2>View Budget Product</h2>
<%


Map<String, Integer> hm1 = BudgetShopping.sortByValue(map); 
%>
<table>
  <tr>
    <th>Product</th>
    <th>Price</th>
    
  </tr>
 <% for (Map.Entry<String, Integer> en : hm1.entrySet()){ %>
  <tr>
    <td><%=en.getKey() %></td>
    <td><%=en.getValue() %></td>
  
  </tr>
  <%} %>
</table>

</body>
</html>
