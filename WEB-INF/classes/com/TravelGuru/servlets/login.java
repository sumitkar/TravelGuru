package com.TravelGuru.servlets;

import java.io.IOException;
import com.TravelGuru.beans.Customer;
import com.TravelGuru.beans.Employee;
import com.TravelGuru.beans.Merchant;
import com.TravelGuru.utils.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class login extends HttpServlet {

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("login.jsp");
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String loginID = request.getParameter("loginID");
		String password = request.getParameter("password");	
		
		
		try {
			Customer c = null;
			CustomerUtils cu = new CustomerUtilsImp();
			c = cu.validate(loginID, password);

			if (c == null)
				throw new NullPointerException();
			else {
				HttpSession session = request.getSession();
				session.setAttribute("customer", c);
				response.sendRedirect("deal.jsp");
			}
		} catch (NullPointerException e) {
			try {
				Merchant m = null;
				MerchantUtils mu = new MerchantUtilsImp();
				m = mu.validateMerchant(loginID, password);

				if (m == null)
					throw new NullPointerException();
				else{
					HttpSession session = request.getSession();
					session.setAttribute("merchant", m);
					response.sendRedirect("merchant.jsp");
				}
			} catch (NullPointerException e1) {
				try {
					Employee emp = null;
					EmployeeLoginUtils eu = new EmployeeLoginUtilsImp();
					emp = eu.validate(loginID, password);
					if (emp == null) {
						throw new NullPointerException();
					} else {
						if (emp.get_emp_role().equals("sales")) {
							HttpSession session = request.getSession();
							session.setAttribute("employee", emp);
							response.sendRedirect("sales.jsp");
						} else if (emp.get_emp_role().equals("cs")) {
							HttpSession session = request.getSession();
							session.setAttribute("employee", emp);
							response.sendRedirect("cs.jsp");
						} else if (emp.get_emp_role().equals("admin")) {
							HttpSession session = request.getSession();
							session.setAttribute("employee", emp);
							response.sendRedirect("admin.jsp");
						}
					}
				} catch (NullPointerException e2) {
					String error = "Please check the Email or Login ID and Password and Try Again !";
					HttpSession session = request.getSession();
					session.setAttribute("e_message", error);
					response.sendRedirect("login.jsp");
				}
			}

		}

	}
}
