<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.auction.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Create User</title>
</head>
<body>

<%@ page import ="java.sql.*" %>

<% 
try {
    String userid = request.getParameter("newuser");   
    String userpw = request.getParameter("newpassword");

    ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();
    Statement st = con.createStatement();
    
    ResultSet checkUser;
    
    checkUser = st.executeQuery("select * from users where userid='" + userid + "'");
    
    if (checkUser.next()){
    	out.println("User name already exists, please <a href='Login.jsp'>try again</a>");
    } else {
    	session.setAttribute("user", userid);
    	st.executeUpdate("insert into users values('" + userid + "','" + userpw + "')");
    	response.sendRedirect("UserSuccess.jsp");
    }
    db.closeConnection(con);
} catch (Exception e) {
	out.print(e);
}
%>

</body>
</html>