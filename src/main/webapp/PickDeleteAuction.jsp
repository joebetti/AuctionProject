<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Pick Delete Auction</title>
	</head>
	<body>
	<h1>Please enter the Auction ID of the auction you would like to delete:</h1>
		<form action="DeleteAuction.jsp" method="post">
		  AuctionID: <input type="text" name="aucID"/> <br/>
		  <input type="submit" value="Delete"/>
		</form>
</body>
</html>