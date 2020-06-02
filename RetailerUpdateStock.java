package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbconnect.DatabaseConnection;

@WebServlet("/RetailerUpdateStock")
public class RetailerUpdateStock extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		response.setContentType("text/html");

		String id = request.getParameter("id");
		String quantity = request.getParameter("quantity");
		System.out.println("id" + id);
		System.out.println("quantity" + quantity);
		try {

			Connection con1 = DatabaseConnection.getConnection();
			String query = "update product set id=?,quantity=? where id=?";
			PreparedStatement ps = con1.prepareStatement(query);
			ps.setString(1, id);
			ps.setString(2, quantity);
			ps.setString(3, id);

			ps.executeUpdate();

			out.println("<script type=\"text/javascript\">");
			out.println("alert('Stock update sucessfully');");
			out.println("location='retailerhomepage.jsp';");
			out.println("</script>");

			System.out.println("hiiiiiiiiiiiiiiiii");

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
