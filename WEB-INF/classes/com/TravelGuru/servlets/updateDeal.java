package com.TravelGuru.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.TravelGuru.beans.Deal;
import com.TravelGuru.utils.CustExecUtilsImp;
import com.TravelGuru.utils.CustomerUtils;
import com.TravelGuru.utils.CustomerUtilsImp;

/**
 * Servlet implementation class updateDeal
 */
@WebServlet("/updateDeal")
public class updateDeal extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateDeal() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("sales.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Deal d=null;
		int d_id = Integer.parseInt(request.getParameter("d_id"));
		CustomerUtils cu = new CustomerUtilsImp();
		d= cu.viewDeal(d_id);
		HttpSession session = request.getSession();
		session.setAttribute("selectdeal", d);
		response.sendRedirect("update-deal.jsp");
	}

}
