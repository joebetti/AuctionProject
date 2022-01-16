<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Pick Edit Questions</title>
	</head>
	<body>
	<h1>Please enter the QID of the question you would like to delete:</h1>
		<form action="DeleteQuestion.jsp" method="post">
		  QID: <input type="text" name="requestid"/> <br/>
		  <input type="submit" value="Delete"/>
		</form>
	<br>
	<h2>Or</h2>
	<br>
	<h1>Please enter the QID of the question you would like to answer:</h1>
		<form action="PickQuestionResponse.jsp" method="post">
		  QID: <input type="text" name="requestid"/> <br/>
		  <input type="submit" value="Respond"/>
		</form>
</body>
</html>