<!DOCTYPE html>
<%@page import="com.TravelGuru.utils.SalespersonUtilsImp"%>
<%@page import="com.TravelGuru.utils.SalespersonUtils"%>
<%@page import="com.TravelGuru.utils.MerchantUtilsImp"%>
<%@page import="com.TravelGuru.utils.MerchantUtils"%>
<%@page import="com.TravelGuru.beans.Deal"%>
<%@page import="java.util.List"%>
<%@page import="com.TravelGuru.utils.CustomerUtilsImp"%>
<%@page import="com.TravelGuru.utils.CustomerUtils"%>
<%@page import="com.TravelGuru.beans.Merchant"%>
<%@page import="com.TravelGuru.beans.Employee"%>
<%!Employee e = null;
	List<Merchant> merchants = null;
	List<Deal> deals = null;
	List<Deal> c_deals = null;%>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Sales Panel - TravelGuru</title>
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
		String error = "Please Login !";
		request.getSession().setAttribute("e_message", error);
		response.sendRedirect("login.jsp");
	} else {
		Employee emp = (Employee) session.getAttribute("employee");
		if (emp.get_emp_role().equals("cs")) {
			response.sendRedirect("login.jsp");
		} else if (emp.get_emp_role().equals("admin")) {
			response.sendRedirect("login.jsp");
		} else {
			e = (Employee) session.getAttribute("employee");
			CustomerUtils u = new CustomerUtilsImp();
			deals = u.viewAllDeals();
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
					<li class="active"><a href="sales.jsp">Sales</a></li>
					<li><a href="index.jsp#about">About Us</a></li>
					<li><a href="index.jsp#contact">Contact</a></li>
				</ul>
				<%
					if (session.getAttribute("employee") != null) {
								session.setAttribute("uname", e.get_emp_name());
				%>
				<ul class="nav navbar-nav navbar-right">

					<li><a> <span class="glyphicon glyphicon-user"></span><%=e.get_emp_name()%></a></li>
					<li><a href="logout"><span
							class="glyphicon glyphicon-log-out"></span> Logout</a></li>
					<%
						}
					%>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container">
		<p></p>
		<p></p>
		</br> </br> </br>

		<div class="row">

			<div class="row-fluid">
				<div class="col-md-5">
					<h3>Available Merchants</h3>
					<hr class="colorgraph">
					<div style="width: 100%; max-height: 400px; overflow: auto">

						<table class="table table-hover">
							<thead>
								<tr>
									<th>Merchant</th>
									<th>Services</th>
									<th>Price (&#x20B9;)</th>

								</tr>
							</thead>
							<tbody>

								<%
									if (merchants != null) {
												for (Merchant merchant : merchants) {
								%>
								<tr>
									<td width="37%"><%=merchant.get_m_name()%></td>
									<td width="45%"><%=merchant.get_m_service()%></td>
									<td width="18%">&#x20B9;&nbsp;&nbsp;<%=merchant.get_m_price()%></td>
								</tr>
								<%
									}
											}
								%>
							</tbody>

						</table>
					</div>
				</div>

				<div class="col-md-7">
					<h3>My Deals</h3>
					<hr class="colorgraph">

					<p align="center">
						<button title="Create" type="button" class="btn btn-default"
							onclick="if(document.getElementById('create').style.display=='none' && document.getElementById('update').style.display=='' || document.getElementById('create').style.display=='none' && document.getElementById('update').style.display=='none') {document.getElementById('create').style.display=''; document.getElementById('update').style.display='none';  }else{document.getElementById('create').style.display='none'; }document.getElementById('msg').style.display='none';">Create
							New Deal</button>
						<button title="Update" type="button" class="btn btn-default"
							onclick="if(document.getElementById('update').style.display=='none' && document.getElementById('create').style.display=='' || document.getElementById('update').style.display=='none' && document.getElementById('create').style.display=='none') {document.getElementById('update').style.display=''; document.getElementById('create').style.display='none';  }else{document.getElementById('update').style.display='none'; }document.getElementById('msg').style.display='none';">Update
							Existing Deal</button>
					</p>
					<%
						if (session.getAttribute("message") != null) {
					%>
					<div id="msg" align="center" style="display: block">
						<font color="green"><%=session.getAttribute("message")%></font>
					</div>
					<%
						session.removeAttribute("message");
								}
					%>

					<div id="create" style="display: none">
						<h5>
							<strong>Create New Deal</strong>
						</h5>
						<hr class="colorgraph">
						<form role="form" method="POST" id="create" name="create"
							action="createDeal">
							<table>
								<tr>
									<td width="35%"><div class="form-group">
											Deal<small>&nbsp;(Cannot be Changed)</small>
										</div></td>
									<td width="65%"><div class="form-group">
											<input class="form-control" type="text" name="d_name"
												id="d_name" size="35" tabindex="1">
										</div></td>
								</tr>
								<tr>
									<td width="35%"><div class="form-group">Description</div></td>
									<td width="65%"><div class="form-group">
											<input class="form-control" type="text" name="d_desc"
												id="d_desc" size="35" tabindex="2">
										</div></td>
								</tr>
								<tr>
									<td width="35%"><div class="form-group">Merchant</div></td>
									<td width="65%"><div class="form-group">
											<select class="form-control" name="m_id" id="create"
												tabindex="3">
												<option value="0">Select Merchant</option>
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
												id="d_price" size="35" tabindex="4"
												onkeypress="return isNumberKey(event)">
										</div></td>
								</tr>
								<tr>
									<td width="35%"><div class="form-group">Available</div></td>
									<td width="65%"><div class="form-group">
											<select class="form-control" name="d_avail" id="create"
												tabindex="5">
												<option value="false">No</option>
												<option value="true">Yes</option>
											</select>

										</div></td>
								</tr>


							</table>
							<input type="hidden" name="emp_id" value="<%=e.get_emp_id()%>">
							<div align="right">
								<button tabindex="5" type="submit" class="btn btn-default">Create</button>
							</div>
						</form>
						<p></p>
					</div>
					<div id="update" style="display: none">
						<h5>
							<strong>Update Existing Deal</strong>
						</h5>
						<hr class="colorgraph">
						<form role="form" method="POST" action="updateDeal">
							<table>
								<tr>
									<td width="35%"><div class="form-group">Deal</div></td>
									<td width="65%"><div class="form-group">
											<select class="form-control" name="d_id" id="create"
												tabindex="1">
												<option value="0">Select your Deal</option>
												<%
													if (c_deals != null) {
																for (Deal d : c_deals) {
												%>
												<option value="<%=d.get_d_id()%>"><%=d.get_d_name()%></option>
												<%
													}
															}
														}
													}
												%>

											</select>
										</div></td>
									<td>
										<div align="right">
											<button type="submit" class="btn btn-default" tabindex="2">Update</button>
										</div>
									</td>
								</tr>
							</table>

						</form>
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
