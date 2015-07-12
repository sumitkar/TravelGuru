<!DOCTYPE html>
<%@page import="com.TravelGuru.beans.Employee"%>
<html lang="en">
<head>
<meta charset="utf-8">
<title>404</title>
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
		} else if (emp.get_emp_role().equals("sales")) {
			response.sendRedirect("login.jsp");
		}
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
					<li><a href="index.jsp#about">About Us</a></li>
					<li><a href="index.jsp#contact">Contact</a></li>
				</ul>

			</div>
		</div>
	</nav>
	<div class="container">
		<p></p>
		<p></p>
		</br> </br>

		<div class="row">
			<div
				class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
				<p align="center">
				<h3>Yuhu !! It's great to see you here!!</h3>
				<hr>
				</p>
				</br>
				<h4></h4>

				<p align="justify">
					This Page will be implemented in the near Future !! </br> </br> </br>
				</p>

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
