<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.auction.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Delete Auction</title>
	</head>
	<body>
	<%
		try {
		    String aucID = request.getParameter("aucID");
	
		    ApplicationDB db = new ApplicationDB();
			Connection con = db.getConnection();
		    Statement st = con.createStatement();
		    
		    ResultSet checkRep;
		    
		    checkRep = st.executeQuery("select * from auctions where auctionid=" + Integer.parseInt(aucID) + ";");
		    
		    if (checkRep.next()) {
		    	PreparedStatement ps = con.prepareStatement("delete from auctions where auctionid=" + Integer.parseInt(aucID) + ";");
		    	ps.executeUpdate();
		    	ps.close();
		    	%>
		    		<h1>Auction Successfully Deleted.</h1>
		        	<br>
		        	<a href='RepSuccess.jsp'>Back</a>
		        <%
		    } else {
		    	out.println("Auction with that ID does not exist, please <a href='PickDeleteAuction.jsp'>try again</a>");
		    }
		    db.closeConnection(con);
		} catch (Exception e) {
			out.print(e);
		}
	%>
</body>
</html>