package com.TravelGuru.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.TravelGuru.beans.Customer;
import com.TravelGuru.utils.CustomerUtils;
import com.TravelGuru.utils.CustomerUtilsImp;

@WebServlet("/regCust")
public class regCust extends HttpServlet {

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		boolean success;
		HttpSession session ;
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String mobile = request.getParameter("mobile");
		String address = request.getParameter("address");
		String password = request.getParameter("password");
		Customer c = new Customer();
		c.set_c_name(name);
		c.set_c_email(email);
		c.set_c_mobile(mobile);
		c.set_c_address(address);
		c.set_c_password(password);
		CustomerUtils cu = new CustomerUtilsImp();
		try {
			success = cu.signupCustomer(c);
			if (success == true)
			{
				String regSuccess = "Registered Successfully !! Login to Continue...";
				session = request.getSession();
				session.setAttribute("regSuccess", regSuccess);
				response.sendRedirect("login.jsp");
			}
		} catch (NullPointerException e) {
			response.sendRedirect("error.jsp");
		}
		

	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("register.jsp");
	}
}
