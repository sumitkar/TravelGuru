package com.TravelGuru.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.TravelGuru.utils.MerchantUtils;
import com.TravelGuru.utils.MerchantUtilsImp;

/**
 * Servlet implementation class ConfirmBooking
 */
@WebServlet("/ConfirmBooking")
public class ConfirmBooking extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConfirmBooking() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.sendRedirect("merchant.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int b_id = Integer.parseInt(request.getParameter("b_id"));
		MerchantUtils mu = new MerchantUtilsImp();
		if(mu.confirmBooking(b_id))
		{
			String conf_msg ="Confirmed Successfully! ";
			HttpSession session= request.getSession();
			session.setAttribute("conf_msg", conf_msg);
			response.sendRedirect("merchant.jsp");
		}else
			response.sendRedirect("error.jsp");	
		
	}

}
