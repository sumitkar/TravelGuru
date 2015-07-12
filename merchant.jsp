<!DOCTYPE html>
<%@page import="com.TravelGuru.utils.MerchantUtilsImp"%>
<%@page import="com.TravelGuru.utils.MerchantUtils"%>
<%@page import="com.TravelGuru.beans.Deal"%>
<%@page import="com.TravelGuru.utils.CustomerUtilsImp"%>
<%@page import="com.TravelGuru.beans.Booking"%>
<%@page import="com.TravelGuru.utils.CustomerUtils"%>
<%@page import="com.TravelGuru.beans.Customer"%>
<%@page import="com.TravelGuru.beans.Employee"%>
<%@page import="com.TravelGuru.beans.Merchant"%>
<%@ page import="java.io.*,java.util.*,java.text.*"%>
<%!Employee emp = null;%>
<%!Customer c = null;%>
<%!Merchant m = null;%>
<%!MerchantUtils mu = null;%>
<%!List<Booking> b_list = null;%>
<%!Deal d = null;%>
<%!int i = 0;%>

<html lang="en">
<head>
<meta charset="utf-8">
<title>Travel Deals - TravelGuru</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description"
	content="One of the best Travel Agencies in India">
<meta name="author" content="TravelGuru">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/custom.css">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/custom.js"></script>
</head>
<%
	if (session.getAttribute("merchant") == null) {
		response.sendRedirect("login.jsp");
	} else {
		m = (Merchant) session.getAttribute("merchant");
		mu = new MerchantUtilsImp();
		b_list = mu.viewBooking(m.get_m_id());
%>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.jsp">TravelGuru</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li><a href="index.jsp">Home</a></li>
					<li><a href="deal.jsp">Travel Deals</a></li>
					<li class="active"><a href="merchant.jsp">Merchant Panel</a></li>
					<li><a href="index.jsp#about">About Us</a></li>
					<li><a href="index.jsp#contact">Contact</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<%
						if (m != null) {
							session.setAttribute("uname",m.get_m_name() );
					%>
					<li><a> <span class="glyphicon glyphicon-user"></span><%=m.get_m_name()%></a></li>
					<%
						}
					%>
					<li><a href="logout"><span
							class="glyphicon glyphicon-log-out"></span> Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container">
		<p></p>
		<p></p>
		</br> </br>
		<p></p>
		</br> </br>
		<div class="row">

			<div class="row-fluid">

				<div class="col-md-1"></div>
				<div class="col-md-10">
					<div align="center">
						<%
							if (session.getAttribute("conf_msg") != null) {
						%>
						<p>
							<font color="green"><%=(String) (session.getAttribute("conf_msg"))%></font>
						</p>
						<%
							session.removeAttribute("conf_msg");
								}
						%>
					</div>

					<%
						if (session.getAttribute("merchant") != null) {
								if (!b_list.isEmpty()) {
					%>
					<div style="width: 100%; max-height: 400px; overflow: auto">

						<table class="table borderless">
							<thead>
								<tr>
									<th width="15%">Booking ID</th>
									<th width="30%">Deal</th>
									<th width="20%">Booking Date</th>
									<th width="15%">Quantity</th>
									<th width="20%">Confirm</th>
									<th></th>
								</tr>
							</thead>
							<tbody>

								<%
									for (Booking b : b_list) {
								%>
								<tr>
									<td><%=b.get_b_id()%></td>
									<td><%=b.get_d_name()%></td>
									<td><%=b.get_b_date()%></td>
									<td><%=b.get_b_qty()%></td>
									<td>
										<div>
											<form role="form" method="POST" action="ConfirmBooking">
												<input type="hidden" name="b_id" value="<%=b.get_b_id()%>">
												<button type="submit" class="btn btn-default">Confirm</button>
											</form>
										</div>
									</td>
								</tr>
								<%
									}
								%>

							</tbody>
						</table>



					</div>
					<%
						} else {
					%>
					<p align="center">No pending Deal to Confirm...!!</p>
					<%
						}
							}
						}
					%>
				</div>
			</div>
		</div>

		<p></p>
		<p></p>
	</div>

	<footer>
		<p align="center">
			&copy; <a>TravelGuru</a>
		</p>
	</footer>
</body>
</html>
