<%@page import="java.io.InputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="dbconnect.DatabaseConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%
response.setHeader("Cache-Control", "no-cache, no-store");
response.setHeader("Pragma", "no-cache");
response.setHeader("Expires","0");
%>
</head>
<body>
<%
int id = Integer.parseInt(request.getParameter("id"));
String sql = "Select productimg from product where id=?";
PreparedStatement pstmt = DatabaseConnection.getConnection().prepareStatement(sql);
pstmt.setInt(1, id);
ResultSet rs = pstmt.executeQuery();
if(rs.next()){
    InputStream is = rs.getBinaryStream(1);
    
    byte[] profilePic = null;
       byte[] buffer = new byte[1024*1024*50];
    int bytesRead;        
    if(is!=null){
        while ((bytesRead =is.read(buffer)) != -1)
        {
            response.reset();
            response.setContentType("image/jpg");
            response.setHeader("Content-disposition","attachment; filename=" );
            response.getOutputStream().write(buffer, 0, bytesRead);
            response.getOutputStream().flush();
            response.getOutputStream().close();
         }
    }        

}         
        
%>
</body>
</html>