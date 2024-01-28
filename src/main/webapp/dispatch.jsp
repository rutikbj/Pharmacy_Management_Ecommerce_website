<%@include file="config.jsp"%>
<%
	String oid = request.getParameter("oid");
	con.createStatement().executeUpdate("update orders set order_status=1 where order_id="+oid);

	response.sendRedirect("orders.jsp");
%>
