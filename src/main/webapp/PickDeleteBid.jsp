<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Pick Delete Bid</title>
	</head>
	<body>
	<h1>Please enter the bidID of the bid you would like to delete:</h1>
		<form action="DeleteBid.jsp" method="post">
		  BidID: <input type="text" name="bidID"/> <br/>
		  <input type="submit" value="Delete"/>
		</form>
</body>
</html>