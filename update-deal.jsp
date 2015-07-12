<!DOCTYPE html>
<%@page import="com.TravelGuru.beans.*"%>
<%@page import="com.TravelGuru.utils.*"%>
<%@page import="java.util.List"%>
<%!Deal d = null;
	Employee e = null;
	List<Merchant> merchants = null;
	List<Deal> deals = null;
	List<Deal> c_deals = null;%>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Login - TravelGuru</title>
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
	if (session.getAttribute("employee") == null
			|| session.getAttribute("selectdeal") == null)
		response.sendRedirect("sales.jsp");
	d = (Deal) session.getAttribute("selectdeal");
	if (session.getAttribute("employee") != null) {
		e = (Employee) session.getAttribute("employee");
		SalespersonUtils sp = new SalespersonUtilsImp();
		merchants = sp.viewAllMerchant();
		c_deals = sp.getDeals(e.get_emp_id());
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
					<li><a href="sales.jsp">Sales</a></li>
					<li><a href="index.jsp#about">About Us</a></li>
					<li><a href="index.jsp#contact">Contact</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">

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
			<div
				class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
				<h5>
					<strong>Update Deal</strong>
				</h5>
				<hr class="colorgraph">
				<form role="form" method="POST" id="update" name="updateDeal"
					action="dealUpdated">

					<table>
						<tr>
							<%
								if (session.getAttribute("selectdeal") != null
											&& session.getAttribute("employee") != null) {
							%>
							<td width="35%"><div class="form-group">Deal</div></td>
							<td width="65%"><div class="form-group">
									<%=d.get_d_name()%>
								</div></td>
						</tr>
						<tr>
							<td width="35%"><div class="form-group">Description</div></td>
							<td width="65%"><div class="form-group">
									<input class="form-control" type="text" name="d_desc"
										value="<%=d.get_d_desc()%>" id="d_desc" size="35" tabindex="1">
								</div></td>
						</tr>
						<tr>
							<td width="35%"><div class="form-group">Merchant</div></td>
							<td width="65%"><div class="form-group">
									<select class="form-control" name="m_id" id="update"
										tabindex="2">
										<option value="<%=d.get_m_id()%>">Select Merchant</option>
										<%
											if (merchants != null) {
														for (Merchant merchant : merchants) {
										%>
										<option value="<%=merchant.get_m_id()%>"><%=merchant.get_m_name()%></option>
										<%
											}
													}
										%>

									</select>


								</div></td>
						</tr>
						<tr>
							<td width="35%"><div class="form-group">Price</div></td>
							<td width="65%"><div class="form-group">
									<input class="form-control" type="number" name="d_price"
										value=<%=d.get_d_price()%> id="d_price" size="35" tabindex="3"
										onkeypress="return isNumberKey(event)">
								</div></td>
						</tr>
						<tr>
							<td width="35%"><div class="form-group">Available</div></td>
							<td width="65%"><div class="form-group">
									<select class="form-control" name="d_avail" id="dealUpdated"
										tabindex="4">
										<option value="false">No</option>
										<option value="true">Yes</option>
									</select>

								</div></td>
						</tr>


					</table>
					<input type="hidden" name="d_name" value="<%=d.get_d_name()%>">
					<input type="hidden" name="d_id" value="<%=d.get_d_id()%>">
					<input type="hidden" name="emp_id" value="<%=e.get_emp_id()%>">
					<%
						}
						}
					%>
					<div align="right">
						<button tabindex="5" type="submit" class="btn btn-default">Update</button>
					</div>
				</form>
				<p></p>
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
