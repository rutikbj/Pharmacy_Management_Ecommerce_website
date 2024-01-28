<%@page import="java.sql.*"%>
<%
	Class.forName("org.postgresql.Driver");
	Connection con=DriverManager.getConnection("jdbc:postgresql:pharma","postgres","root");
%>
