<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Pick Question Response</title>
	</head>
<body>
	<h1>Please enter the QID and the response to this question:</h1>
		<form action="InsertResponse.jsp" method="post">
		  QID: <input type="text" name="qid"/> <br/>
		  <br>
		  Answer:
		  <br>
		  <br>
		  <textarea name="supportanswer" cols="40" rows="15"></textarea>
		  <br>
		  <input type="submit" value="Post"/>
		</form>
</body>
</html>