<!DOCTYPE html>
<%@page import="com.TravelGuru.beans.*"%>
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
	if (session.getAttribute("customer") != null) {
		response.sendRedirect("deal.jsp");
	} else if (session.getAttribute("employee") != null) {
		Employee emp = (Employee) session.getAttribute("employee");
		if (emp.get_emp_role().equals("sales")) {
			response.sendRedirect("sales.jsp");
		} else if (emp.get_emp_role().equals("cs")) {
			response.sendRedirect("cs.jsp");
		} else if (emp.get_emp_role().equals("admin")) {
			response.sendRedirect("admin.jsp");
		}

	} else if (session.getAttribute("merchant") != null) {
		response.sendRedirect("merchant.jsp");
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
				<ul class="nav navbar-nav navbar-right">
					<li><a href="register.jsp"><span
							class="glyphicon glyphicon-user"></span> Sign Up</a></li>
					<li class="active"><a href="login.jsp"><span
							class="glyphicon glyphicon-log-in"></span> Login</a></li>
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
				<form name="form" role="form" method="POST"
					onsubmit="return validateForm()" action="login">
					<h2>Please Login</h2>
					<hr class="colorgraph">

					<%
						if (session.getAttribute("regSuccess") != null) {
					%>
					<p>
						<font size="3" color="green"><%=session.getAttribute("regSuccess")%></font>
					</p>
					<%
						session.removeAttribute("regSuccess");
						}
					%>
					<%
						if (session.getAttribute("e_message") != null) {
					%>
					<p>
						<font size="3" color="red"><%=session.getAttribute("e_message")%></font>
					</p>
					<%
						session.removeAttribute("e_message");
					%>
					<%
						}
					%>
					<div class="form-group">
						<input type="text" name="loginID" id="loginID"
							class="form-control input-lg" placeholder="Email or Login ID"
							tabindex="1">
					</div>
					<div class="form-group">
						<input type="password" name="password" id="password"
							class="form-control input-lg" placeholder="*******" tabindex="2">
					</div>
					<p align="justify">
						New to TravelGuru? Why don't you just <a href="register.jsp">register</a>
						with us !
					</p>

					<hr class="colorgraph">


					<div class="form-group">
						<input type="submit" value="Login"
							class="btn btn-primary btn-block btn-lg" tabindex="7">
					</div>



				</form>
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
