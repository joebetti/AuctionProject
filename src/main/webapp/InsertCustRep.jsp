<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.auction.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Insert Customer Reps</title>
	</head>
	<body>
	<%
		try {
		    String custStaffID = request.getParameter("newRepStaffid");
		    String custName = request.getParameter("newRepName");
		    String custUsername = request.getParameter("newRepUsername");
		    String custPassword = request.getParameter("newRepPassword");
	
		    ApplicationDB db = new ApplicationDB();
			Connection con = db.getConnection();
		    Statement st = con.createStatement();
		    
		    ResultSet checkRep;
		    
		    checkRep = st.executeQuery("select * from customerreps where name='" + custUsername + "'");
		    
		    if (checkRep.next()){
		    	out.println("That rep username already exists, please <a href='CreateCustRep.jsp'>try again</a>");
		    } else {
		    	st.executeUpdate("insert into staff values('" + custStaffID + "','" + custName + "')");
		    	st.executeUpdate("insert into customerreps values('" + custStaffID + "','" + custUsername + "','" + custPassword + "')");
		    	%>
		    		<h1>Customer Rep Account Created.</h1>
		        	<br>
		        	<a href='AdminSuccess.jsp'>Back</a>
		        <%
		    }
		    db.closeConnection(con);
		} catch (Exception e) {
			out.print(e);
		}
	%>
</body>
</html>