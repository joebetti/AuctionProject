<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.auction.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>User Ask Question</title>
</head>
	<body>
	<%@ page import ="java.sql.*" %>
		
		<h1>Questions and Answers</h1>
	<%  
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		String selection = "select requestID, UserRequest, RepResponse from support_request";
        PreparedStatement preparedStatement = con.prepareStatement(selection);
        ResultSet set = preparedStatement.executeQuery();
        while (set.next()) {
        	%>	
        		<h2>QID: <%= set.getString("requestID") %></h2>
        		<h2>Q: <%= set.getString("UserRequest")%></h2>
        		<h2>A: <%= set.getString("RepResponse")%></h2>
	        	<br>
       		<%
        }
        
        preparedStatement.close();
        con.close();
	%>
	<h3>Or ask a question below</h3>
	<br>
	<h1>Please enter your question below:</h1>
		<form action="InsertQuestion.jsp" method="post">
		  Question:
		  <br>
		  <br>
		  <textarea name="supportrequest" cols="40" rows="15"></textarea>
		  <br>
		  <input type="submit" value="Post"/>
		</form>
</body>
</html>