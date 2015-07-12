package com.TravelGuru.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.TravelGuru.beans.Deal;
import com.TravelGuru.utils.BookingUtils;
import com.TravelGuru.utils.BookingUtilsImp;
import com.TravelGuru.utils.CustExecUtilsImp;
import com.TravelGuru.utils.CustomerUtils;
import com.TravelGuru.utils.CustomerUtilsImp;

@WebServlet("/booking")
public class booking extends HttpServlet {

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("deal.jsp");
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int c_id = Integer.parseInt(request.getParameter("c_id"));
		int d_id = Integer.parseInt(request.getParameter("d_id"));
		CustomerUtils cu = new CustomerUtilsImp();
		Deal d = cu.viewDeal(d_id);
		if (d != null) {
			session.setAttribute("deal", d);
			session.setAttribute("c_id", c_id);
			response.sendRedirect("booking.jsp");
		} else
			response.sendRedirect("error.jsp");
	}
}
