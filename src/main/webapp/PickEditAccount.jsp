<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Pick Edit Account</title>
	</head>
	<body>
	<h1>Please enter the userID of the user you would like to delete:</h1>
		<form action="DeleteUser.jsp" method="post">
		  UserID: <input type="text" name="userID"/> <br/>
		  <input type="submit" value="Delete"/>
		</form>
	<br>
	<h2>Or</h2>
	<br>
	<h1>Please enter the userID of the user you would like to edit:</h1>
		<form action="PickAccountPassword.jsp" method="post">
		  UserID: <input type="text" name="userID"/> <br/>
		  <input type="submit" value="Edit"/>
		</form>
</body>
</html>