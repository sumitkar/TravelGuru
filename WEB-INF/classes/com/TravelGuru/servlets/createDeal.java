package com.TravelGuru.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.TravelGuru.beans.Deal;
import com.TravelGuru.utils.SalespersonUtils;
import com.TravelGuru.utils.SalespersonUtilsImp;

@WebServlet("/createDeal")
public class createDeal extends HttpServlet {

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		boolean success;
		HttpSession session = request.getSession();
		String d_name = request.getParameter("d_name");
		String d_desc = request.getParameter("d_desc");
		int emp_id = Integer.parseInt(request.getParameter("emp_id"));
		int m_id = Integer.parseInt(request.getParameter("m_id"));
		int d_price = Integer.parseInt(request.getParameter("d_price"));
		boolean d_avail = Boolean.parseBoolean(request.getParameter("d_avail"));
		
		Deal d = new Deal();
		d.set_d_name(d_name);
		d.set_d_desc(d_desc);
		d.set_emp_id(emp_id);
		d.set_m_id(m_id);
		d.set_d_price(d_price);
		d.set_d_avail(d_avail);
		
		SalespersonUtils su = new SalespersonUtilsImp();
		try {
			success = su.createDeal(d);
			if (success) {
				String created = "New Deal Added !";
				session.setAttribute("message", created);
				response.sendRedirect("sales.jsp");
			} else
				response.sendRedirect("error.jsp");
		} catch (NullPointerException e) {
			response.sendRedirect("error.jsp");
		}

	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("sales.jsp");

	}

}
