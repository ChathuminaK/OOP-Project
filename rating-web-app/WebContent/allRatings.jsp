<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="com.rating.model.Rating" %>  
<%@ page import="com.rating.service.IRatingService" %>  
<%@ page import="com.rating.service.RatingServiceImpl" %>
<%@ page import="java.util.ArrayList" %>  
 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="https://kit.fontawesome.com/a5ea36088f.js" crossorigin="anonymous"></script>

<title>ALL RATING</title>
<style>
    body {
            font-family: Arial, sans-serif;
            background-image: url('picture/hotel5.jpg'); /* Add the URL of background image */
            background-size: cover; /* Adjust to preference */
            background-repeat: no-repeat;
            margin: 0;
            
            padding: 0;
            
        }
    /*header*/
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
  margin-bottom:100px;
}

.logo-container {
  background-color: #f9f9ff;
  padding: 8px 0;
  box-shadow: 0px 3px 0px #ececec;
  display: flex;
  align-items: center;
  justify-content: space-between; /* To align logo to the left and navigation to the right */
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
  font-family:'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
  text-transform: uppercase;
  margin: 8px 8px 8px 5px;
}
nav ul li a,
nav ul li a:after,
nav ul li a:before {
  position: relative;
  transition: all .5s;
}
nav ul li a:hover {
  color: #555;
}


nav.stroke ul li a,
nav.fill ul li a {
  position: relative;
}
nav.stroke ul li a:after,
nav.fill ul li a:after {
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
    /*End Header*/
     #addFeedbackButton {
      position:relative;
      left:45%;
      bottom:180px;
      background-color: #0074D9;
      color: #fff;
      padding: 10px 20px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      font-size: 16px;
    }

    #addFeedbackButton:hover {
      background-color: #0056A6;
    }

    h1 {
        color: #333;
    }

    table {
        width: 80%;
        
        margin: 20px auto 200px;
        border-collapse: collapse;
        background-color: #fff;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    }

    th, td {
        padding: 12px; /* Increased padding for better spacing */
        text-align: left;
        border-bottom: 1px solid #aee8ec;
    }

    th {
        background-color: #007BFF;
        color: #fff;
        text-transform: uppercase; /* Uppercase column headers */
    }

    tr:hover {
        background-color: #aee8ec;
    }

    .button-cell {
        text-align: center;
    }

    .edit-button {
        background-color: #77C3EC;
        color: #fff;
        padding: 8px 16px; /* Increased padding for better button appearance */
        border: none;
        border-radius: 4px;
        cursor: pointer;
        transition: background-color 0.3s;
    }
    .delete-button {
        background-color: #E3242B;
        color: #fff;
        padding: 8px 16px; /* Increased padding for better button appearance */
        border: none;
        border-radius: 4px;
        cursor: pointer;
        transition: background-color 0.3s;
    }

    .edit-button:hover{
        background-color: #0056b3;
    }
    .delete-button:hover {
        background-color: #ff0000;
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

footer a{
    text-decoration: none;
    color: inherit;
}

/*specific styles*/

.footer-outer-container{
    background-color: #010c80;
    color: white;
    padding: 40px;
    margin: 0px;
}

.footer-inner-container{
    display: flex;
    flex-wrap: wrap;
    
}

.footer-col{
    display: flex;
    width: auto;
    padding: 10px;
    align-items: center;
}

.footer-col-qlinks{
    
    width: 200px;
    height: 150px;
}

.footer-col-follow{
    
    width: 200px;
    height: 150px;
}

.footer-col-phone{
    display:flex;
    flex-direction: column;
    width: 200px;
    height: 115px;
}

.footer-col-address{
    display:flex;
    flex-direction: column;
    width: 200px;
    height: 115px;
}

.footer-col-email{
    display:flex;
    flex-direction: column;
    width: 200px;
    height: 115px;
}

.img{
position: absolute;
top: 60px;
right: 50px;
width: 250px;
height:50px;


}



#text-icons{
    display: flex;
    align-items: top;
}

.footer-col i{
    margin: 10px 10px 10px 0px;
}
    /*End Footer*/
    
</style>

</head>
<body>
<!-- header -->
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
  <!-- end header -->
  

<table>
    <thead>
    <tr>
        <th>Rating ID</th>
        <th>Star</th>
        <th>Review</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    </thead>
    
    <tbody>
        
        <%
            IRatingService iratingService = new RatingServiceImpl();
            ArrayList<Rating> ratingList = iratingService.getRatings();
        %>
        <%
            for(Rating ratings: ratingList){
        %>  
            <tr>
                <td><%= ratings.getRatingId() %></td>
                <td><%= ratings.getStarno() %></td>
                <td><%= ratings.getComment() %></td>
                
                <td class="button-cell">
                    <form action="<%= request.getContextPath()%>/GetRatingServlet" method="post">
                        <input type="hidden" name="ratingId" value="<%= ratings.getRatingId() %>">
                        <input class="edit-button" type="submit" value="Edit">
                    </form>
                </td>
                
                <td class="button-cell">
                    <form action="<%= request.getContextPath()%>/DeleteRatingServlet" method="post">
                        <input type="hidden" name="ratingId" value="<%= ratings.getRatingId() %>">
                        <input class="delete-button" type="submit" value="Delete">
                    </form>
                </td>
                
            </tr>   
        
        <%      
            }
        %>
        
    </tbody>
    
</table>
<button id="addFeedbackButton" onclick="location.href='index.jsp'">ADD FEEDBACK</button>


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
                                      <a href="#"><i class="fab fa-facebook fa-lg"></i></a>
                                      <a href="#"><i class="fab fa-instagram fa-lg"></i></a>
                                      <a href="#"><i class="fab fa-twitter fa-lg"></i></a>
                              </div>
                      </div>
                      <div class="footer-col" id="text-icons">
                              <div class="footer-col-phone">
                                    <span>
                                      <i  class="fas fa-square-phone fa-lg"></i>
                                      <section><p>091-7617899<br>091-7617899</p></section>
                                    </span>
                              </div>
                      </div>
                      <div class="footer-col" id="text-icons">
                              <div class="footer-col-address">
                                      <span>
                                      <i class="fas fa-location-dot fa-lg"></i><br>
                                      <span>No.234,FlowerLane,<br>Galle Road,<br>Unawatuna, Sri Lanka</span>
                                      </span>
                              </div>
                      </div>
                      <div class="footer-col" id="text-icons">
                              <div class="footer-col-email">
                                      <span>
                                      <i class="fas fa-envelope fa-lg"></i>
                                      <span>oceanglow31@gmail.com</span></span>
                              </div>
                      </div>

                      <div class="img"><img src = "picture/logowhite2.png" class="img"></div>
                      
                     
              </div>
      </div>
</footer>
<!--End Footer -->
</body>
</html>
