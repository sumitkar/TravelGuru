package com.TravelGuru.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.TravelGuru.utils.BookingUtils;
import com.TravelGuru.utils.BookingUtilsImp;
import com.TravelGuru.utils.CustomerUtils;
import com.TravelGuru.utils.CustomerUtilsImp;

/**
 * Servlet implementation class CancelBooking
 */
@WebServlet("/CancelBooking")
public class CancelBooking extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CancelBooking() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("booking.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		int b_id = Integer.parseInt(request.getParameter("b_id"));
		String msg = null;
		BookingUtils bu = new BookingUtilsImp();
		if (bu.cancelBooking(b_id))
			msg = "Removed";
		else
			msg = "Please Try Again!";
		HttpSession session = request.getSession();
		session.setAttribute("e_msg", msg);
		response.sendRedirect("booking.jsp");
	}

}
