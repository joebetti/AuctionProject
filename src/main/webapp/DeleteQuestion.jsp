<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.auction.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Delete Question</title>
	</head>
	<body>
	<%
		try {
		    String requestID = request.getParameter("requestid");
	
		    ApplicationDB db = new ApplicationDB();
			Connection con = db.getConnection();
		    Statement st = con.createStatement();
		    
		    ResultSet checkRep;
		    
		    checkRep = st.executeQuery("select * from support_request where requestID='" + requestID + "';");
		    
		    if (checkRep.next()) {
		    	PreparedStatement ps = con.prepareStatement("delete from support_request where requestID='" + requestID + "';");
		    	ps.executeUpdate();
		    	ps.close();
		    	%>
		    		<h1>Question Successfully Deleted.</h1>
		        	<br>
		        	<a href='RepSuccess.jsp'>Back</a>
		        <%
		    } else {
		    	out.println("Question with that ID does not exist, please <a href='PickEditQuestions.jsp'>try again</a>");
		    }
		    db.closeConnection(con);
		} catch (Exception e) {
			out.print(e);
		}
	%>
</body>
</html>