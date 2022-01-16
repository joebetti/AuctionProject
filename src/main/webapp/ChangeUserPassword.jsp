<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.auction.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Change User Password</title>
	</head>
	<body>
	<%
		try {
		    String userID = request.getParameter("userID");
		    String psswrd = request.getParameter("psswrd");
	
		    ApplicationDB db = new ApplicationDB();
			Connection con = db.getConnection();
		    Statement st = con.createStatement();
		    
		    ResultSet checkRep;
		    
		    checkRep = st.executeQuery("select * from users where userID='" + userID + "';");
		    
		    if (checkRep.next()) {
		    	PreparedStatement ps = con.prepareStatement("update users set password='" + psswrd + "' where userid='" + userID + "';");
		    	ps.executeUpdate();
		    	ps.close();
		    	%>
		    		<h1>User Successfully Updated.</h1>
		        	<br>
		        	<a href='RepSuccess.jsp'>Back</a>
		        <%
		    } else {
		    	out.println("User with that ID does not exist, please <a href='PickEditAccount.jsp'>try again</a>");
		    }
		    db.closeConnection(con);
		} catch (Exception e) {
			out.print(e);
		}
	%>
</body>
</html>