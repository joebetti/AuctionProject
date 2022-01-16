<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="ISO-8859-1">
		<title>Pick Report Type</title>
	</head>
	<body>
	<h1>Please pick a sales report type to generate:</h1>
	<br>
	<form method="get" action="GenerateReport.jsp">
		<select name="reporttype" size=1>
			<option value="totalearnings">Total Earnings</option>
			<option value="earningsperitem">Earnings per Item</option>
			<option value="earningsperitemtype">Earnings per Item Type</option>
			<option value="earningsperenduser">Earnings per End User</option>
			<option value="bestsellingitems">Best Selling Items</option>
			<option value="bestbuyers">Best Buyers</option>
		</select>&nbsp;<br> 
		<br>
		<input type="submit" value="submit">
	</form>
	<br>
</body>
</html>