<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.auction.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Generate Report</title>
</head>
<body>

<%@ page import ="java.sql.*" %>

<%
try {
	String reportType = request.getParameter("reporttype");
	
	ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();
	double total = 0;
	int numItems = 0;
	double earningsPerItem = 0;
	double earningsGamingComputers = 0;
	double earningsDesktops = 0;
	double earningsLaptops = 0;
	int numUsers = 0;
	double earningsPerUser = 0;
	
	if (reportType.equals("totalearnings")) {
		String selection = "select sum(price) as total from auctions where winner is not NULL and auctionStatus <> 1";
        PreparedStatement preparedStatement = con.prepareStatement(selection);
        ResultSet set = preparedStatement.executeQuery();
        while (set.next()) {
        	total = set.getDouble("total");	
        }
        
        preparedStatement.close();
        con.close();
		%>
			<h2>Total Earnings:</h2>
			<h3>$<%=String.format("%.2f",total)%></h3>
		<%
		
	} else if (reportType.equals("earningsperitem")) {
		
		String selection = "select sum(price) as total from auctions where winner is not NULL and auctionStatus <> 1";
        PreparedStatement preparedStatement = con.prepareStatement(selection);
        ResultSet set = preparedStatement.executeQuery();
        while (set.next()) {
        	total = set.getDouble("total");	
        }
        
        selection = "select count(auctionid) as numitems from auctions where winner is not NULL and auctionStatus <> 1";
        preparedStatement = con.prepareStatement(selection);
        set = preparedStatement.executeQuery();
        while (set.next()) {
        	numItems = set.getInt("numitems");
        }
        
        earningsPerItem = total / numItems;
        
        preparedStatement.close();
        con.close();
		%>
			<h2>Earnings per Item:</h2>
			<h3>$<%=String.format("%.2f",earningsPerItem)%> Per Item</h3>
		<%
		
	} else if (reportType.equals("earningsperitemtype")) {
		
		String selection = "select sum(price) as total from auctions where winner is not NULL and auctionStatus <> 1 and productType='Gaming Computer'";
        PreparedStatement preparedStatement = con.prepareStatement(selection);
        ResultSet set = preparedStatement.executeQuery();
        while (set.next()) {
        	earningsGamingComputers = set.getDouble("total");	
        }
		%>
			<h1>Earnings Per Item Type</h1>
			<br>
			<h2>Earnings For Gaming Computers:</h2>
			<h3>$<%=String.format("%.2f",earningsGamingComputers)%></h3>
		<%
		
		selection = "select sum(price) as total from auctions where winner is not NULL and auctionStatus <> 1 and productType='Desktop'";
        preparedStatement = con.prepareStatement(selection);
        set = preparedStatement.executeQuery();
        while (set.next()) {
        	earningsDesktops = set.getDouble("total");	
        }
		%>
			<br>
			<h2>Earnings For Desktops:</h2>
			<h3>$<%=String.format("%.2f",earningsDesktops)%></h3>
		<%
		
		selection = "select sum(price) as total from auctions where winner is not NULL and auctionStatus <> 1 and productType='Laptop'";
        preparedStatement = con.prepareStatement(selection);
        set = preparedStatement.executeQuery();
        while (set.next()) {
        	earningsLaptops = set.getDouble("total");	
        }
        preparedStatement.close();
        con.close();
		%>
			<br>
			<h2>Earnings For Laptops:</h2>
			<h3>$<%=String.format("%.2f",earningsLaptops)%></h3>
		<%
		
	} else if (reportType.equals("earningsperenduser")) {
		
		String selection = "select sum(price) as total from auctions where winner is not NULL and auctionStatus <> 1";
        PreparedStatement preparedStatement = con.prepareStatement(selection);
        ResultSet set = preparedStatement.executeQuery();
        while (set.next()) {
        	total = set.getDouble("total");	
        }
        
        selection = "select count(userid) as numusers from users";
        preparedStatement = con.prepareStatement(selection);
        set = preparedStatement.executeQuery();
        while (set.next()) {
        	numUsers = set.getInt("numusers");
        }
        
        earningsPerUser = total / numUsers;
        preparedStatement.close();
        con.close();
		%>
			<h2>Earnings per User:</h2>
			<h3>$<%=String.format("%.2f",earningsPerUser)%> Per User</h3>
		<%
		
	} else if (reportType.equals("bestsellingitems")) {
		
		String selection = "select productname, productID, productType, sum(price) as total from auctions where winner is not NULL and auctionStatus <> 1 group by productID order by total desc";
		PreparedStatement preparedStatement = con.prepareStatement(selection);
		ResultSet set = preparedStatement.executeQuery();
		%>
			<h2>Best Selling Items:</h2>
			<table border="1">
			<tr>
				<td>Rank</td>
				<td>Product Name</td>
				<td>Revenue</td>
				<td>Product ID</td>
				<td>Product Type</td>
			</tr>
		<%
		int i = 1;
        while (set.next()) {
        %>
        	<tr>
        		<td><%= i%></td>
				<td><%= set.getString("productname")%></td>
				<td>$<%= set.getString("total")%></td>
				<td><%= set.getString("productID")%></td>
				<td><%= set.getString("productType")%></td>
			</tr>
			<br>
       	<%
       	i++;
        }
		%></table><%
        
        preparedStatement.close();
        con.close();
        
	} else if (reportType.equals("bestbuyers")) {
		
		String selection = "select winner, sum(price) as total from auctions where winner is not NULL and auctionStatus <> 1 group by winner order by total desc";
		PreparedStatement preparedStatement = con.prepareStatement(selection);
		ResultSet set = preparedStatement.executeQuery();
		%>
			<h2>Best Buyers:</h2>
			<table border="1">
			<tr>
				<td>Rank</td>
				<td>UserID</td>
				<td>Total Amount Spent</td>
			</tr>
		<%
		int i = 1;
        while (set.next()) {
        %>
        	<tr>
        		<td><%= i%></td>
				<td><%= set.getString("winner")%></td>
				<td><%= set.getString("total")%></td>
			</tr>
			<br>
       	<%
       	i++;
        }
		%></table><%
        
        preparedStatement.close();
        con.close();	
	}
	
} catch (Exception e) {
	out.print(e);
}
%>
</body>
</html>