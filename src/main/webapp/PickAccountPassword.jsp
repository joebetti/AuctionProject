<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Pick Account Password</title>
	</head>
	<body>
	<h1>Please enter the userID and the new password for this user:</h1>
		<form action="ChangeUserPassword.jsp" method="post">
		  UserID: <input type="text" name="userID"/> <br/>
		  Password: <input type="password" name="psswrd"/> <br/>
		  <input type="submit" value="Submit"/>
		</form>
	<br>
</body>
</html>