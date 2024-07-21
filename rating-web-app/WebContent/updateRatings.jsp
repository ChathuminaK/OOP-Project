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
<title>Update Rating</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-image: url('picture/hotel7.jpg'); /* Replace background image */
        background-size: cover;
        background-repeat: no-repeat;
        background-attachment: fixed;
        background-position: center;
        margin-top: 120px;
        padding: 0;
    }

    h1 {
        color: #F5F5F5;
        margin-top: 20px;
        text-align: center;
    }

    form {
    	text-align: center;
        max-width: 400px;
        margin: 20px auto;
        background-color: rgba(255, 255, 255, 0.55);
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    }

    label {
    	text-align: center;
        font-weight: bold;
        display: block;
        margin-bottom: 10px;
       
        
    }

    input[type="text"] {
        width: 90%;
        padding: 20px;
        margin-bottom: 20px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }

    select {
        width: 100%;
        padding: 10px;
        margin-bottom: 20px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }

    input[type="submit"] {
        background-color: #007BFF;
        color: #fff;
        padding: 12px 25px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        margin-right: 120px;
    }
   input[type="button"] {
        background-color: #ad1133;
        color: #fff;
        padding: 12px 25px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    input[type="submit"]:hover {
        background-color: #0056b3;
    }
    input[type="button"]:hover {
        background-color: #9a1616;
    }
</style>
</head>
<body>

<h1>CHANGE YOUR RATING</h1>

<%
    String ratingId = (String) request.getAttribute("ratingId");
    IRatingService iRatingService = new RatingServiceImpl();
    ArrayList<Rating> ratingList = iRatingService.getRatingById(ratingId);
%>

<%
    for (Rating ratings : ratingList) {
%>    
    <form action="<%= request.getContextPath()%>/updateRatingServlet" method="post">
        <input type="hidden" name="ratingId" value="<%= ratings.getRatingId() %>">
        
        <label for="starno">Star</label>
        <select id="starno" name="starno" required>
            <option value="1" <%= ratings.getStarno().equals("1") ? "selected" : "" %>>1</option>
            <option value="2" <%= ratings.getStarno().equals("2") ? "selected" : "" %>>2</option>
            <option value="3" <%= ratings.getStarno().equals("3") ? "selected" : "" %>>3</option>
            <option value="4" <%= ratings.getStarno().equals("4") ? "selected" : "" %>>4</option>
            <option value="5" <%= ratings.getStarno().equals("5") ? "selected" : "" %>>5</option>
        </select>
        
        <label for="comment">Review</label>
        <input type="text" id="comment" name="comment" value="<%= ratings.getComment() %>" required>
        
        <input type="submit" value="Update">
        <input type="button" value="Cancel" onclick="location.href='<%= request.getContextPath()%>/allRatings.jsp'">
    </form>    

<%        
    }
%>

</body>
</html>
