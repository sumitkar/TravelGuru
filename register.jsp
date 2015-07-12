<!DOCTYPE html>
<%@page import="java.lang.ProcessBuilder.Redirect"%>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Register - TravelGuru</title>
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
	if (session.getAttribute("customer") != null
			|| session.getAttribute("employee") != null
			|| session.getAttribute("merchant") != null){
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
					<li><a href="index.jsp#about">About Us</a></li>
					<li><a href="index.jsp#contact">Contact</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li class="active"><a href="register.jsp"><span
							class="glyphicon glyphicon-user"></span> Sign Up</a></li>
					<li><a href="login.jsp"><span
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
				<form name="RegForm" role="form" method="POST"
					onsubmit="return validateForm()" action="regCust">
					<h2>
						Please Sign Up <small>It's the first step for your dream
							tour.</small>
					</h2>
					<hr class="colorgraph">

					<div class="form-group">
						<input type="text" name="name" id="name"
							class="form-control input-lg" placeholder="Your Name *"
							tabindex="1">
					</div>
					<div class="form-group">
						<input type="email" name="email" id="email"
							class="form-control input-lg" placeholder="Your Email *"
							tabindex="2">
					</div>
					<div class="form-group">
						<input type="number" name="mobile" id="mobile"
							class="form-control input-lg" placeholder="Mobile Number *"
							onkeypress="return isNumberKey(event)" tabindex="3">
					</div>

					<div class="form-group">
						<input type="text" name="address" id="address"
							class="form-control input-lg" placeholder="Your Address *"
							tabindex="4">

					</div>
					<div class="row">
						<div class="col-xs-12 col-sm-6 col-md-6">
							<div class="form-group">
								<input type="password" name="password" id="password"
									class="form-control input-lg" placeholder="Password"
									tabindex="5">
							</div>
						</div>
						<div class="col-xs-12 col-sm-6 col-md-6">
							<div class="form-group">
								<input type="password" name="password_confirmation"
									id="password_confirmation" class="form-control input-lg"
									placeholder="Confirm Password" tabindex="6">
							</div>
						</div>
					</div>
					<p align="justify">
						Already registered? <a href="login.jsp">Click Here</a> to Login!
					</p>

					<hr class="colorgraph">


					<div class="form-group">
						<input type="submit" value="Register"
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
