<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>User Success</title>
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
		<br>
        <h1>Welcome to the Website!</h1>
        <br>
        <h2>To view or ask public questions for a customer representative to answer, <a href='UserAskQuestion.jsp'>click here.</a></h2>
        <br>
        <a href='Logout.jsp'>Log Out</a>
<%
    }
%>

</body>
</html>