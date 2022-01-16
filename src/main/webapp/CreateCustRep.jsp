<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Create Customer Reps</title>
	</head>
	<body>
	<h1>Please enter Customer Representative account information:</h1>
		<form action="InsertCustRep.jsp" method="post">
		  StaffID: <input type="text" name="newRepStaffid"/> <br/>
		  Name: <input type="text" name="newRepName"/> <br/>
    	  Username: <input type="text" name="newRepUsername"/> <br/>
    	  Password:<input type="password" name="newRepPassword"/> <br/>
		  <input type="submit" value="Create"/>
		</form>
</body>
</html>