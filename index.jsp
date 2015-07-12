 <!DOCTYPE html>
<%@page import="com.TravelGuru.beans.Deal"%>
<%@page import="java.util.List"%>
<%@page import="com.TravelGuru.utils.CustomerUtilsImp"%>
<%@page import="com.TravelGuru.utils.CustomerUtils"%>
<%@page import="com.TravelGuru.beans.Customer"%>
<%@page import="com.TravelGuru.beans.Employee"%>
<%@page import="com.TravelGuru.beans.Merchant"%>
<%!Employee emp = null;%>
<%!Customer c = null;%>
<%!Merchant m = null;%>
<%!String uname = "";%>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Home - TravelGuru</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description"
	content="One of the best Travel Agencies in India">
<meta name="author" content="TravelGuru">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/custom.css">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
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
					<li class="active"><a href="#">Home</a></li>
					<li><a href="deal.jsp">Travel Deals</a></li>
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
					<li><a href="#about">About Us</a></li>
					<li><a href="#contact">Contact</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<%
						if (session.getAttribute("customer") == null
								&& session.getAttribute("employee") == null
								&& session.getAttribute("merchant") == null) {
					%>

					<li><a href="register.jsp"><span
							class="glyphicon glyphicon-user"></span> Sign Up</a></li>
					<li><a href="login.jsp"><span
							class="glyphicon glyphicon-log-in"></span> Login</a></li>
					<%
						} else {
					%>
					<%
						if (session.getAttribute("uname") != null) {
								uname = (String) session.getAttribute("uname");
					%>
					<li><a> <span class="glyphicon glyphicon-user"></span><%=uname%></a></li>
					<%
						}
					%>
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
		<div class="row">
			<div class="col-md-12">
				<p></p>
				<p></p>
				</br> </br>
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
						<li data-target="#myCarousel" data-slide-to="3"></li>
						<li data-target="#myCarousel" data-slide-to="4"></li>
					</ol>

					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox">
						<div class="item active">
							<img src="img/1.jpg" alt="Kashmir" height="345">
						</div>

						<div class="item">
							<img src="img/2.jpg" alt="India Gate" height="345">
						</div>

						<div class="item">
							<img src="img/3.jpg" alt="Taj Mahal" height="345">
						</div>

						<div class="item">
							<img src="img/4.jpg" alt="KanyaKumari" height="345">
						</div>
						<div class="item">
							<img src="img/5.jpg" alt="Digha Sea Beach" height="345">
						</div>
					</div>
					<div class="item">

						<div class="carousel-caption">
							<h1>TravelGuru</h1>
							<h4>One of the best Travel Agencies in India</h4>
						</div>
					</div>

					<!-- Left and right controls -->
					<a class="left carousel-control" href="#myCarousel" role="button"
						data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#myCarousel" role="button"
						data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>

			</div>
		</div>

		<h1>TravelGuru</h1>
		<p align="justify">
			We Are Really Pleased To Introduce Ourselves As One Of The Pioneers
			Tour Organizations since 1947. From then we are one of the best
			Travel Agencies in India. Travel with us and get the best <b>travel
				deals</b> at an <b>affordable price</b>.
		</p>
		<hr class="colorgraph">
		<div class="row">
			<div class="col-sm-4">
				<h2>
					<p align="center">
						<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
					</p>
				</h2>
				<h3>
					<p align="center">Why Travel With Us?</p>
				</h3>
				<p align="justify">Why This 60 Years Old Tourist Organization
					Have Achieved The Earth Of Bengalees As Well As Foreign Countries
					As Their Only Dependable Family Tourist .</p>
			</div>

			<div class="col-sm-4">
				<p align="center">
				<h2>
					<p align="center">
						<span class="glyphicon glyphicon-camera" aria-hidden="true"></span>
					</p>
				</h2>

				<h3>
					<p align="center">Are you a Photographer?</p>
				</h3>

				<p align="justify">Yes!! You are at the right place. You will
					get to see unseen India and capture the moments in your camera. We
					also provide special offers for Photographers.</p>
			</div>

			<div class="col-sm-4">

				<h2>
					<p align="center">
						<span class="glyphicon glyphicon-pushpin" aria-hidden="true"></span>
					</p>
				</h2>

				<h3>
					<p align="center">Our Deals</p>
				</h3>

				<p align="justify">
					<marquee behavior="scroll" direction="up" height="60"
						scrollamount="2" onmouseover="this.stop();"
						onmouseout="this.start();">
						<div align="center">
							<%
								for (Deal deal : deals) {
							%>
							<span><%=deal.get_d_name()%><br /></span>

							<%
								}
							%>
						</div>
					</marquee>

				</p>
			</div>

			</br>
			<p></p>
			<p></p>
		</div>

		<hr class="colorgraph">
		<a class="anchor" id="about"></a>
		<h2>About Us</h2>
		<p align="justify">There Was A Time When People Used To Think
			Traveling Means Pilgrimage Only. At That Time There Was Only One Or
			Two Tourist Organization in India. In 1947, this Organization Which
			Is Really Old And Traditional Was Formed. Recently we completed our
			60th year. It Is Need Less To Mention That Without The Good Wishes,
			Blessings, Love, it is almost Impossible To Complete All These Years
			Successfully. The Flood Of 1978, India China War, India- Bangladesh
			War, Assassination Of Indira And Rajib Gandhi, Mondal Commission,
			Continued Kashmir Disturbances Since 1989 Etc. Along With So Many
			Unwanted Situations Which Were Boldly Confronted By Us Could Not Stop
			Us From Making Regular Tours With Our Valued Customer's Co-Operations
			Of Our Customers. Our Honesty And Hard Work As Well As Experience Had
			Helped Us In Crossing All These Hurdles.</p>
		<p align="justify">To-Day Tours Are Not Limited Within Pilgrimage
			Only. It Has Turned Into Pleasure Trips, Educational Trips As Well.
			Therefore, According To Time And Demand Of Our Customers We Provide
			Separate Good/Clean Rooms Family Wise In Standard Hotels/Lodging
			Houses And Thus Developed Pleasure Trips Etc Instead Of Pilgrim Tours
			Only With All Modern Amenities. To-Day Thousands And Thousands
			Families Who Are Living All Over West Bengal, Near By States All Over
			India, United States Of Amrica Or In Australia Etc As NRI Keeps Touch
			With Us And Tours With Us. Generation Wise And For Them We Are Their
			Family Tourist Organization And They Treat Us As One Of Our Family
			Members. We May Here That It Could Be Only Possible With The
			Blessings, Love And Co-Operations Of Our Valued Customers To Complete
			These Long Way Comfortably. On This Auspicious Golden Jubilee Year
			Keeping In View Of The Expectations, Depend Ness, Blessings As Well
			As Love We Would Live No Stone Unturned To Develop Further Tour
			Programmes With Comfort, Speciality And Above All Special Foreign
			Tour Programmes Within A Reasonable, Affordable Cost.</p>
		<p></p>
		<hr class="colorgraph">
		<div class="row">
			<div class="col-sm-5">
				<h2>
					<a name="contact"></a>Contact
				</h2>
				<p align="justify">
					<b>Head Office:</b> </br> 18, B.N. Mukherjee Road 1st Floor
					Kolkata-700033</br> (Near Kolkata Street and Trust Row crossing</br>Beside of
					I.C.I.C.I. Bank) </br>Phone No: 033 2213 9999/98,033 2262 7435,</br>033 3028
					5695/92, 033 3090 9578/79 </br>Fax: 033 30285690 </br>Email:
					info@travelguru.com.
				</p>
			</div>
			<div class="col-sm-4">
				<p align="right">
					</br> <img src="img/map.jpg" class="img-rounded" alt="Map" width="300">
				</p>
			</div>
		</div>
		<hr class="colorgraph">
	</div>

	<footer>
		<p align="center">
			&copy; <a>TravelGuru</a>
		</p>
	</footer>

</body>
</html>
