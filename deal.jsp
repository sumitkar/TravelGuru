<!DOCTYPE html>
<%@page import="com.TravelGuru.beans.Deal"%>
<%@page import="com.TravelGuru.utils.CustomerUtilsImp"%>
<%@page import="com.TravelGuru.utils.CustomerUtils"%>
<%@page import="com.TravelGuru.beans.Customer"%>
<%@page import="com.TravelGuru.beans.Employee"%>
<%@page import="com.TravelGuru.beans.Merchant"%>
<%@ page import="java.io.*,java.util.*"%>
<%!Employee emp = null;%>
<%!Customer c = null;%>
<%!Merchant m = null;%>
<%!String uname = "";%>
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
	if (session.getAttribute("employee") != null) {
		emp = (Employee) session.getAttribute("employee");
	} else if (session.getAttribute("customer") != null) {
		c = (Customer) session.getAttribute("customer");
	} else if (session.getAttribute("merchant") != null) {
		m = (Merchant) session.getAttribute("merchant");
	}
	CustomerUtils u = new CustomerUtilsImp();
	List<Deal> deals = u.viewAllDeals();
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
					<li class="active"><a href="deal.jsp">Travel Deals</a></li>
					<%
						if (session.getAttribute("employee") != null
								&& emp.get_emp_role().equals("sales")) {
					%>
					<li><a href="sales.jsp">Sales</a></li>
					<%
						} else if (session.getAttribute("employee") != null
								&& emp.get_emp_role().equals("admin")) {
					%>
					<li><a href="admin.jsp">Admin Panel</a></li>
					<%
						} else if (session.getAttribute("employee") != null
								&& emp.get_emp_role().equals("cs")) {
					%>
					<li><a href="cs.jsp">Customer Support</a></li>
					<%
						} else if (session.getAttribute("customer") != null) {
					%>
					<li><a href="booking.jsp">Booking</a></li>
					<%
						} else if (session.getAttribute("merchant") != null) {
					%>
					<li><a href="merchant.jsp">Merchant Panel</a></li>
					<%
						}
					%>
					<li><a href="index.jsp#about">About Us</a></li>
					<li><a href="index.jsp#contact">Contact</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<%
						if (session.getAttribute("employee") == null
								&& session.getAttribute("merchant") == null
								&& session.getAttribute("customer") == null) {
					%>
					<li><a href="register.jsp"><span
							class="glyphicon glyphicon-user"></span> Sign Up</a></li>
					<li><a href="login.jsp"><span
							class="glyphicon glyphicon-log-in"></span> Login</a></li>
					<%
						} else {

							if (session.getAttribute("customer") != null) {
								session.setAttribute("uname", c.get_c_name());
							}
							if (session.getAttribute("uname") != null) {
								String uname = (String) session.getAttribute("uname");
					%>

					<li><a> <span class="glyphicon glyphicon-user"></span><%=uname%></a></li>
					<li><a href="logout"><span
							class="glyphicon glyphicon-log-out"></span> Logout</a></li>
					<%
						}
						}
					%>
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
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<p align="justify">Our company provides a large variety of
						Travel deals to choose from. We provide the largest number of
						Travel deals all over India. You get a huge variety of premium
						travel packages to choose from !</p>
					<div style="width: 100%; max-height: 400px; overflow: auto">

						<table class="table table-hover">
							<thead>
								<tr>
									<th>Deal Name</th>
									<th>Description</th>
									<th>Price (&#x20B9;)</th>
									<%
										if (session.getAttribute("customer") != null) {
									%>
									<th>Book</th>
									<%
										}
									%>
								</tr>
							</thead>
							<tbody>
								<%
									for (Deal deal : deals) {
								%>
								<tr>
									<td><%=deal.get_d_name()%></td>
									<td><%=deal.get_d_desc()%></td>
									<td>&#x20B9;&nbsp;&nbsp;<%=deal.get_d_price()%></td>
									<%
										if (session.getAttribute("customer") != null) {
									%>
									<td><form role="form" method="POST" action="booking">
											<input type="hidden" name="c_id" value="<%=c.get_c_id()%>">
											<input type="hidden" name="d_id" value="<%=deal.get_d_id()%>">
											<button type="submit" class="btn btn-default">Book</button>
										</form></td>
									<%
										}
									%>
								</tr>
								<%
									}
								%>
							</tbody>
						</table>
					</div>
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
