<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Rep Success</title>
</head>
<body>

<%@ page import ="java.sql.*" %>

<%
    if (session.getAttribute("user") == null) {
%>
    	You are currently logged out.
    	<br>
    	<a href="Login.jsp">Login here</a>
<%
    } else {
    	out.println("Hello " + session.getAttribute("user"));
%>		
		<h1>Respond To or Delete User Questions <a href="PickEditQuestions.jsp">Here</a>.</h1>
		<br>
		<h1>Edit or Delete Account Information <a href="PickEditAccount.jsp">Here</a>.</h1>
		<br>
		<h1>Delete Bids <a href="PickDeleteBid.jsp">Here</a>.</h1>
		<br>
        <h1>Delete Auctions <a href="PickDeleteAuction.jsp">Here</a>.</h1>
        <br>
        Or <a href='Logout.jsp'>Log Out</a>
<%
    }
%>

</body>
</html>