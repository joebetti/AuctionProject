<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Admin Success</title>
</head>
<body>

<%@ page import ="java.sql.*" %>

<%
    if (session.getAttribute("user") == null) {
%>
    	You are currently logged out.
    	<br>
    	<a href="Login.jsp">Login here</a>
<%
    } else {
    	out.println("Hello " + session.getAttribute("user"));
%>		
		<br>
        <h1>To Create Customer Representative Accounts, <a href="CreateCustRep.jsp">Click Here</a>.</h1>
        <br>
        <h1>To Generate Reports, <a href="PickReportType.jsp">Click Here</a>.</h1>
        <br>
        Or <a href='Logout.jsp'>Log Out</a>
<%
    }
%>

</body>
</html>