package com.TravelGuru.servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TravelGuru.utils.BookingUtils;
import com.TravelGuru.utils.BookingUtilsImp;

@WebServlet("/book")
public class book extends HttpServlet {

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("deal.jsp");
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String book = null;
		int c_id = Integer.parseInt(request.getParameter("c_id"));
		int d_id = Integer.parseInt(request.getParameter("d_id"));
		String b_date = request.getParameter("b_date");
		int b_qty = Integer.parseInt(request.getParameter("b_qty"));
		BookingUtils bu = new BookingUtilsImp();
		if (!b_date.equals("dd-mm-yyyy") && !b_date.equals("dd-mm-2015")
				&& !b_date.equals("")) {
			try {
				if (bu.createBooking(c_id, d_id, b_date, b_qty)) {

					book = "<font color=\"green\"> Booking Successful !</br> Date of Journey: "
							+ b_date
							+ "</br>Quantity: "
							+ b_qty
							+ ".</font><font color=\"red\"></br>Please Wait for Merchant Confirmation...</font>";
					request.getSession().removeAttribute("deal");
				} else {
					throw new SQLException();
				}
			} catch (SQLException e) {
				book = " <strong><font size=\"4\" color=\"red\">Please Try Again !</font></strong>";
			}
		} else {
			book = "<strong><font size=\"4\" color=\"red\">Please Select Date...</font></strong>";
		}
		request.getSession().setAttribute("b_msg", book);

		response.sendRedirect("booking.jsp");
	}
}
