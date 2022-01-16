<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Logout</title>
</head>
<body>

<%session.invalidate(); %>

<h1>You have logged out. <a href='Login.jsp'>Log in again</a>.</h1>
</body>
</html>