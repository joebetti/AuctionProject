<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.auction.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Insert Response</title>
	</head>
	<body>
	<%
		try {
		    String qid = request.getParameter("qid");
		    String supportAnswer = request.getParameter("supportanswer");
	
		    ApplicationDB db = new ApplicationDB();
			Connection con = db.getConnection();
		    Statement st = con.createStatement();
		    
		    ResultSet checkRep;
		    
		    checkRep = st.executeQuery("select * from support_request where requestID='" + qid + "';");
		    
		    if (checkRep.next()) {
		    	PreparedStatement ps = con.prepareStatement("update support_request set RepResponse='" + supportAnswer + "' where requestID='" + qid + "';");
		    	ps.executeUpdate();
		    	ps.close();
		    	%>
		    		<h1>Response Posted.</h1>
		        	<br>
		        	<a href='RepSuccess.jsp'>Back</a>
		        <%
		    } else {
		    	out.println("Question with that ID does not exist, please <a href='PickQuestionResponse.jsp'>try again</a>");
		    }
		    db.closeConnection(con);
		} catch (Exception e) {
			out.print(e);
		}
	%>
</body>
</html>