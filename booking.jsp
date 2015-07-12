<!DOCTYPE html>
<%@page import="com.TravelGuru.beans.Deal"%>
<%@page import="com.TravelGuru.beans.Booking"%>
<%@page import="com.TravelGuru.utils.CustomerUtilsImp"%>
<%@page import="com.TravelGuru.utils.CustomerUtils"%>
<%@page import="com.TravelGuru.beans.Customer"%>
<%@page import="com.TravelGuru.beans.Employee"%>
<%@page import="com.TravelGuru.beans.Merchant"%>
<%@ page import="java.io.*,java.util.*,java.text.*"%>
<%!Employee emp = null;%>
<%!Customer c = null;%>
<%!Merchant m = null;%>
<%!Deal d = null;%>
<%!List<Booking> booking = null;%>
<%!int i = 0;%>
<%!Date dNow = new Date();
	Calendar cal = Calendar.getInstance();
	SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");%>
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
	if (session.getAttribute("customer") == null) {
		response.sendRedirect("deal.jsp");
	} else if (session.getAttribute("customer") != null) {
		c = (Customer) session.getAttribute("customer");
		CustomerUtils cu = new CustomerUtilsImp();
		booking = cu.viewBooking(c.get_c_id());
		if (session.getAttribute("deal") != null)
			d = (Deal) session.getAttribute("deal");
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
					<li class="active"><a href="booking.jsp">Booking</a></li>
					<li><a href="index.jsp#about">About Us</a></li>
					<li><a href="index.jsp#contact">Contact</a></li>
				</ul>
				<%
					if (session.getAttribute("customer") != null) {
							session.setAttribute("uname", c.get_c_name());
				%>
				<ul class="nav navbar-nav navbar-right">
					<li><a> <span class="glyphicon glyphicon-user"></span><%=c.get_c_name()%></a></li>
					<li><a href="logout"><span
							class="glyphicon glyphicon-log-out"></span> Logout</a></li>
				</ul>
				<%
					}
				%>
			</div>
		</div>
	</nav>
	<div class="container">
		<p></p>
		<p></p>
		</br>
		<p></p>
		<div class="row">

			<div class="row-fluid">
				<div class="col-md-1"></div>
				<div class="col-md-10">
					<div>
						<%
							if (!booking.isEmpty()) {
						%>
						<div align="center">
							<h1>Previous Booking</h1>
							<hr class="colorgraph">

							<div align="center"
								style="width: 75%; max-height: 210px; overflow: auto">
								<table class="table borderless">
									<thead>
										<tr>
											<th width="15%">Booking ID</th>
											<th width="30%">Deal</th>
											<th width="20%">Booking Date</th>
											<th width="15%">Quantity</th>
											<th>Status</th>
											<th></th>
										</tr>
									</thead>
									<tbody>

										<%
											if (session.getAttribute("customer") != null) {
														for (Booking b : booking) {
										%>
										<tr>
											<td><%=b.get_b_id()%></td>
											<td><%=b.get_d_name()%></td>
											<td><%=b.get_b_date()%></td>
											<td><%=b.get_b_qty()%></td>
											<td><%=b.is_b_status() ? "<font color=\"green\">Confirmed</font>"
									: "<font color=\"red\">Pending</font>"%></td>
											<td>
												<div>
													<form role="form" method="POST" id="book"
														action="CancelBooking">
														<input type="hidden" name="b_id" value="<%=b.get_b_id()%>">
														<button type="submit" class="btn btn-default" onclick="return confirm('Are you sure you want to cancel Booking?')" >Cancel</button>
													</form>
												</div>
											</td>
										</tr>
										<%
											}
													}
										%>

									</tbody>
								</table>
								<%
									}
								%>



							</div>
						</div>
					</div>
					<div align="center">
						</br> </br>
						<%
							if (session.getAttribute("b_msg") != null) {
						%>
						<p>
							<%=session.getAttribute("b_msg")%>
						</p>
						<%
							session.removeAttribute("b_msg");
								}
						%>
						<%
							if (session.getAttribute("e_msg") != null) {
						%>
						<p>
							<font size="3" color="red"><%=session.getAttribute("e_msg")%></font>
						</p>
						<%
							session.removeAttribute("e_msg");
								}
						%>
					</div>
					<%
						if (session.getAttribute("customer") != null) {
								if (session.getAttribute("deal") != null) {
					%>
					<div align="center">
						<h1>New Booking</h1>
						<hr class="colorgraph">
					</div>
					<div style="width: 100%; max-height: 400px; overflow: auto">
						<form role="form" method="POST" id="book" action="book"
							onsubmit="return validateBookingForm()">
							<table class="table borderless">
								<thead>
									<tr>
										<th width="20%">Deal</th>
										<th width="30%">Description</th>
										<th width="15%">Price (&#x20B9;)</th>
										<th width="15%">Quantity</th>
										<th width="15%">Date</th>
										<th width="5%"></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<%
											if (session.getAttribute("deal") != null
																&& session.getAttribute("customer") != null) {
										%>
										<td><%=d.get_d_name()%></td>
										<td><%=d.get_d_desc()%></td>
										<td>&#x20B9;&nbsp;&nbsp;<%=d.get_d_price()%></td>

										<td><select class="form-control" name="b_qty" id="book">

												<%
													for (i = 1; i <= 5; i++) {
												%>
												<option value="<%=i%>"><%=i%></option>
												<%
													}
												%>
										</select></td>
										<td><div class=" form-control">
												<input type="date" name="b_date" min="<%=ft.format(dNow)%>"><br>
												<input type="hidden" name="c_id" value="<%=c.get_c_id()%>">
												<input type="hidden" name="d_id" value="<%=d.get_d_id()%>">
												<%
													}
												%>
												<br>
											</div></td>

										<td>
											<div align="right">
												<button type="submit" class="btn btn-default">Book
													Now</button>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</form>


					</div>
					<%
						} else {
					%>
					<div id="book">
						<p align="center">
							</br> </br> Select a <a href="deal.jsp">Deal</a> to Book Now !!
						</p>

					</div>
					<%
						}
							}
						}
					%>
				</div>

			</div>

			<p></p>
			<p></p>
		</div>
	</div>

	<footer>
		<p align="center">
			&copy; <a>TravelGuru</a>
		</p>
	</footer>
</body>
</html>
