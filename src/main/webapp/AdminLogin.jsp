<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.auction.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Admin Login</title>
</head>
<body>

<%@ page import ="java.sql.*" %>

<%
try {
    String userid = request.getParameter("adminname");   
    String userpw = request.getParameter("adminpassword");

    ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();
    Statement st = con.createStatement();
    
    ResultSet checkUser;
    ResultSet goodUserid;
    
    checkUser = st.executeQuery("select * from admin where name='" + userid + "'");
    
    
    if (checkUser.next()){
    	goodUserid = st.executeQuery("select * from admin where name='" + userid + "' and password='" + userpw + "'");
    	if (goodUserid.next()) {
        	session.setAttribute("user", userid);
        	out.println("welcome " + userid);
        	out.println("<a href='logout.jsp'>Log out</a>");
        	response.sendRedirect("AdminSuccess.jsp");
    	} else {
        	out.println("Invalid password <a href='Login.jsp'>try again</a>");
    	}
    } else {
   		out.println("Unknown user, please <a href='Login.jsp'>try again</a>");
    }
    db.closeConnection(con);
   				
} catch (Exception e) {
	out.print(e);
}
%>
</body>
</html>