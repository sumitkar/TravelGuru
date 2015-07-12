<!DOCTYPE html>
<%@page
	import="com.TravelGuru.beans.*, java.util.List , com.TravelGuru.utils.* , com.TravelGuru.beans.*"%>
<%!String c_email = null;
	List<Booking> booking = null;
	Customer c = null;%>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Customer Support - TravelGuru</title>
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
	if (session.getAttribute("employee") == null) {
		response.sendRedirect("login.jsp");
	} else {
		Employee emp = (Employee) session.getAttribute("employee");
		if (emp.get_emp_role().equals("sales")) {
			response.sendRedirect("login.jsp");
		} else if (emp.get_emp_role().equals("admin")) {
			response.sendRedirect("login.jsp");
		}
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
					<li class="active"><a href="cs.jsp">Customer Support</a></li>
					<li><a href="index.jsp#about">About Us</a></li>
					<li><a href="index.jsp#contact">Contact</a></li>

				</ul>
				<ul class="nav navbar-nav navbar-right">
					<%
						if (session.getAttribute("employee") != null) {
								session.setAttribute("uname", emp.get_emp_name());
					%>
					<li><a> <span class="glyphicon glyphicon-user"></span><%=emp.get_emp_name()%></a></li>
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
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div align="center">
					<form role="form" method="POST" action="cs">
						<table>
							<tr>
								<td><div class="form-group">Customer
										Email&nbsp;&nbsp;</div></td>
								<td><div class="form-group">

										<input class="form-control" type="email" name="c_email"
											id="c_email">
									</div></td>
								<td><div class="form-group">
										&nbsp;&nbsp;
										<button type="submit" class="btn btn-default">Search</button>
									</div></td>
								<td><div class="form-group">
										&nbsp;&nbsp; <input type="button" value="Clear"
											class="btn btn-default"
											onClick="window.location.href=window.location.href">
									</div></td>
							</tr>
						</table>

					</form>
				</div>

				<%
					if (session.getAttribute("c_email") != null
								&& session.getAttribute("employee") != null) {
							c_email = (String) session.getAttribute("c_email");

							CustExecUtils ceu = new CustExecUtilsImp();
							booking = ceu.viewBooking(c_email);
							c = ceu.viewCust(c_email);
				%>
				<fieldset>
					<legend>Customer Details</legend>
					<div align="center" style="width: 100%;">
						<%
							if (c != null) {
						%>

						<table border="0">
							<tr>
								<td width="20%"><b>Name&nbsp;&nbsp;</b></td>
								<td width="80%"><%=c.get_c_name()%></td>
							</tr>
							<tr>
								<td><b>Mobile&nbsp;&nbsp;</b></td>
								<td><%=c.get_c_mobile()%></td>
							</tr>
							<tr>
								<td><b>Address&nbsp;&nbsp;</b></td>
								<td><%=c.get_c_address()%></td>
							</tr>
						</table>
						<%
							}
						%>
					</div>
				</fieldset>
				<div align="center"
					style="width: 100%; max-height: 300px; overflow: auto">
					<%
						if (!booking.isEmpty()) {
					%>
					<fieldset>
					<legend>Bookings</legend>
						<table class="table borderless">
							<thead>
								<tr>
									<th width="15%">Booking ID</th>
									<th width="30%">Deal</th>
									<th width="20%">Booking Date</th>
									<th width="15%">Quantity</th>
									<th>Status</th>
								</tr>
							</thead>
							<tbody>
								<%
									for (Booking b : booking) {
								%>
								<tr>
									<td><%=b.get_b_id()%></td>
									<td><%=b.get_d_name()%></td>
									<td><%=b.get_b_date()%></td>
									<td><%=b.get_b_qty()%></td>
									<td><%=b.is_b_status() ? "<font color=\"green\">Confirmed</font>"
									: "<font color=\"red\">Pending</font>"%></td>
								</tr>
								<%
									}
								%>

							</tbody>
						</table>
					</fieldset>
					<%
						session.removeAttribute("c_email");
								} else {
					%>

					<strong>No Record Found...</strong>
					<%
						}
					%>

				</div>
				<%
					}
					}
				%>

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
