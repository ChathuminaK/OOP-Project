<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="https://kit.fontawesome.com/a5ea36088f.js"
	crossorigin="anonymous"></script>

<title>Insert Rating</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-image: url('picture/hotel4.jpg');
	/* Add the background image */
	background-size: cover; /* Adjust preference */
	background-repeat: no-repeat;
	margin: 0;
	padding: 0;
}
/*Header*/
.logo {
	width: 250px;
	height: 50px;
	margin-right: 60px;
	position: absolute;
	vertical-align: middle;
	top: 30px;
	left: 25px;
}

.fix {
	width: 100%;
	z-index: 100;
	margin-bottom: 100px;
}

.logo-container {
	background-color: #f9f9ff;
	padding: 8px 0;
	box-shadow: 0px 3px 0px #ececec;
	display: flex;
	align-items: center;
	justify-content: space-between;
	/* To align logo to the left and navigation to the right */
}

.center {
	text-align: center;
}

section {
	padding-bottom: 10px; /* Adjust this value to control spacing */
}

nav {
	margin: left;
	background: #f9f9ff;
	padding: 8px 0;
	box-shadow: 0px 3px 0px #ececec;
}

nav ul {
	list-style: none;
	text-align: right;
}

nav ul li {
	display: inline-block;
	margin-right: 5px; /* Add some spacing between navigation links */
}

nav ul li a {
	display: block;
	padding: 5px;
	text-decoration: none;
	color: #000000;
	font-weight: 800;
	font-size: 17.5px;
	font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande',
		'Lucida Sans', Arial, sans-serif;
	text-transform: uppercase;
	margin: 8px 8px 8px 5px;
}

nav ul li a, nav ul li a:after, nav ul li a:before {
	position: relative;
	transition: all .5s;
}

nav ul li a:hover {
	color: #555;
}

nav.stroke ul li a, nav.fill ul li a {
	position: relative;
}

nav.stroke ul li a:after, nav.fill ul li a:after {
	position: absolute;
	bottom: 0;
	left: 0;
	right: 0;
	margin: auto;
	width: 0%;
	content: '.';
	color: transparent;
	background: #333;
	height: 1px;
}

nav.stroke ul li a:hover:after {
	width: 100%;
}

nav.fill ul li a {
	transition: all 2s;
}

#bn {
	background-color: #3b49e6;
	border-radius: 7px;
}
/*End header*/
h1 {
	color: #F5F5F5; /* Adjust text color */
	font-size: 36px; /* Increase font size for emphasis */
	margin: 20px 0; /* Add margin for spacing */
	text-align: center; /* Center the text horizontally */
}

form {
	max-width: 400px;
	margin: 20px auto 200px;
	background-color: #EBFFFF;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
}

label {
	font-weight: bold;
	display: block;
	margin-bottom: 10px;
	color: #333;
}

.rating {
	display: flex;
	align-items: center;
	margin-bottom: 20px;
	justify-content: left; /* Center the stars horizontally */
}

.rating input[type="radio"] {
	display: none;
}

.rating label {
	font-size: 36px; /* Change the size of the stars */
	color: #ccc;
	cursor: pointer;
	margin: 0 10px; /* Add margin stars */
}

.rating label:hover, .rating label:hover ~ label, .rating input[type="radio"]:checked 
	~ label {
	color: #ffdb58; /* Change the color  rating color */
}

.rating-reverse {
	flex-direction: row-reverse; /* Reverse the direction */
}

input[type="text"] {
	width: 95%;
	height: 50px;
	padding: 10px;
	margin-bottom: 20px;
	border: 1px solid #ccc;
	border-radius: 4px;
	font-size: 16px;
}

input[type="submit"] {
	background-color: #007BFF;
	color: #fff;
	padding: 12px 24px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-size: 18px;
	transition: background-color 0.3s;
}

input[type="submit"]:hover {
	background-color: #0056b3;
}
/*Footer*/
footer {
	position: absolute;
	width: 100%;
	margin: 0px;
	padding: 0px;
	box-sizing: border-box;
	font-family: sans-serif;
	font-size: 15px;
}

footer a {
	text-decoration: none;
	color: inherit;
}

/*specific styles*/
.footer-outer-container {
	background-color: #010c80;
	color: white;
	padding: 40px;
	margin: 0px;
}

.footer-inner-container {
	display: flex;
	flex-wrap: wrap;
}

.footer-col {
	display: flex;
	width: auto;
	padding: 10px;
	align-items: center;
}

.footer-col-qlinks {
	width: 200px;
	height: 150px;
}

.footer-col-follow {
	width: 200px;
	height: 150px;
}

.footer-col-phone {
	display: flex;
	flex-direction: column;
	width: 200px;
	height: 115px;
}

.footer-col-address {
	display: flex;
	flex-direction: column;
	width: 200px;
	height: 115px;
}

.footer-col-email {
	display: flex;
	flex-direction: column;
	width: 200px;
	height: 115px;
}

.img {
	position: absolute;
	top: 60px;
	right: 50px;
	width: 250px;
	height: 50px;
}

#text-icons {
	display: flex;
	align-items: top;
}

.footer-col i {
	margin: 10px 10px 10px 0px;
}
/*End Footer*/
</style>

<script type="text/javascript">
        // Define a function to show the success alert
        function showSuccessAlert() {
            alert("Review Added Successfully");
        }
    </script>
</head>
<body>
	<!-- Header -->
	<div class="fix">
		<section style="background: #ffffff; color: #000000;">
			<div class="logo-container">
				<img src="picture\download (3).png" alt="log" class="logo">
			</div>

			<nav class="stroke">
				<ul>
					<li><a href="index.html">Home</a></li>
					<li><a href="#">Gallery</a></li>
					<li><a href="aboutus.html">About</a></li>
					<li><a href="contactus.html">Contact Us</a></li>
					<li><a href="#">Log In</a></li>
					<li><a href="#">Sign Up</a></li>
					<li id="bn"><a href="#">Book Now</a></li>
				</ul>
			</nav>
		</section>
	</div>
	<!-- End Header -->
	<h1>GIVE YOUR FEEDBACK</h1>

	<form action="<%= request.getContextPath()%>/AddRatingServlet"
		method="post" onsubmit="showSuccessAlert()">
		<label for="starno">Rate This:</label>
		<div class="rating rating-reverse">
			<!-- Add the 'required' attribute to one of the radio buttons -->
			<input type="radio" id="star5" name="starno" value="5" required>
			<label for="star5">&#9733;</label> <input type="radio" id="star4"
				name="starno" value="4"> <label for="star4">&#9733;</label>
			<input type="radio" id="star3" name="starno" value="3"> <label
				for="star3">&#9733;</label> <input type="radio" id="star2"
				name="starno" value="2"> <label for="star2">&#9733;</label>
			<input type="radio" id="star1" name="starno" value="1"> <label
				for="star1">&#9733;</label>
		</div>

		<label for="comment">Your Review:</label> <input type="text"
			id="comment" name="comment" required><br> <input
			type="submit" value="Add Rating">
	</form>

	<!-- Footer -->
	<footer>
		<div class="footer-outer-container">
			<div class="footer-inner-container">
				<div class="footer-col">
					<div class="footer-col-qlinks">
						<h4>Quick Links</h4>
						<ul>
							<li><a href="index.html">Home</a></li>
							<li><a href="aboutus.html">About Us</a></li>
							<li><a href="#">Terms and Conditions</a></li>
							<li><a href="#">FAQ</a></li>
						</ul>
					</div>
				</div>
				<div class="footer-col">
					<div class="footer-col-follow">
						<h4>Follow Us</h4>
						<a href="#"><i class="fab fa-facebook fa-lg"></i></a> <a href="#"><i
							class="fab fa-instagram fa-lg"></i></a> <a href="#"><i
							class="fab fa-twitter fa-lg"></i></a>
					</div>
				</div>
				<div class="footer-col" id="text-icons">
					<div class="footer-col-phone">
						<span> <i class="fas fa-square-phone fa-lg"></i>
							<section>
								<p>
									091-7617899<br>091-7617899
								</p>
							</section>
						</span>
					</div>
				</div>
				<div class="footer-col" id="text-icons">
					<div class="footer-col-address">
						<span> <i class="fas fa-location-dot fa-lg"></i><br> <span>No.234,FlowerLane,<br>Galle
								Road,<br>Unawatuna, Sri Lanka
						</span>
						</span>
					</div>
				</div>
				<div class="footer-col" id="text-icons">
					<div class="footer-col-email">
						<span> <i class="fas fa-envelope fa-lg"></i> <span>oceanglow31@gmail.com</span></span>
					</div>
				</div>

				<div class="img">
					<img src="picture/logowhite2.png" class="img">
				</div>


			</div>
		</div>
	</footer>
	<!--End Footer -->


</body>
</html>
