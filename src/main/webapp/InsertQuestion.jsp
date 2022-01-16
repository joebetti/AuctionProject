<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.auction.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Insert Question</title>
	</head>
	<body>
	<%
		try {
			String user = (String)session.getAttribute("user");
			String supportQuestion = request.getParameter("supportrequest");
			
			ApplicationDB db = new ApplicationDB();
			Connection con = db.getConnection();
		    Statement st = con.createStatement();
		    
			if (supportQuestion.equals("")) {
				out.println("Please enter a nonempty question. <a href='UserAskQuestion.jsp'>Try again</a>");
			} else {
				int requestID = 0;
				while(true) {
					Random rand = new Random();
					requestID = rand.nextInt(90000) + 10000;
					ResultSet checkRep = st.executeQuery("select * from support_request where RequestID='" + requestID + "'");
				    if (!checkRep.next()) {
				    	break;
				    }
				}
				
				st.executeUpdate("insert into support_request values('" + requestID + "','" + 0 + "','" + user + "','" + supportQuestion + "','" + " " + "');");
		    	%>
		    		<h1>Question Received.</h1>
		        	<br>
		        	<a href='UserSuccess.jsp'>Back</a>
		        <%
				db.closeConnection(con);
			}
		} catch (Exception e) {
			out.print(e);
		}
	%>
</body>
</html>