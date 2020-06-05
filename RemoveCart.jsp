
<%@page import="dbconnect.DatabaseConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%

String Pid=request.getParameter("id");
System.out.print(Pid);

try{
	Connection con=DatabaseConnection.getConnection();
	String query="Select * from cart where id='"+Pid+"'";
	PreparedStatement ps=con.prepareStatement(query);
	ResultSet rr=ps.executeQuery();
	while(rr.next())
	{
		
		String id=rr.getString(2);
		System.out.print(id);
		String quantity1=rr.getString(5);
		Double qq1=Double.parseDouble(rr.getString(5));
		
		System.out.print(qq1);
	
	
	



		Connection co=DatabaseConnection.getConnection();
		String QQ="select * from product where id='"+id+"'";
		PreparedStatement ss=co.prepareStatement(QQ);
		ResultSet pp=ss.executeQuery();
		while(pp.next())
		{
			
		String quantity2=pp.getString(4);
			Double qq2=Double.parseDouble(pp.getString(4));
		System.out.print(qq2);
		String quantity6=quantity1 + quantity2;
		Double quantity=qq1+qq2;
		System.out.print(quantity);
	
	
	




	Connection con1=DatabaseConnection.getConnection();
	String q1="update product set id=?,quantity=? where id=?";
	PreparedStatement ps1=con1.prepareStatement(q1);
	ps1.setString(1, id);
	ps1.setDouble(2, quantity);
	ps1.setString(3, id);
	int k=ps1.executeUpdate();
	
		}
		}
}
	catch(Exception e)
{
		e.printStackTrace();
		
}
	


	
	try
	{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/grocery", "root", "root");
Statement st=conn.createStatement();
int i=st.executeUpdate("DELETE FROM cart WHERE id="+Pid);
if(i>0)
{
	
	   out.println("<script type=\"text/javascript\">");
	   out.println("alert('Product Remove from cart......');");
	   out.println("location='CustomerViewCart.jsp';");
	   out.println("</script>");
}
else
{
out.print("data is not delete");
	}
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
