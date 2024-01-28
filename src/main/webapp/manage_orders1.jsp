<title>My Orders</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
<body>
<center><a href="index.jsp" class="btn btn-warning">Home</a></center>
<%@include file="config.jsp"%>
<%
	String oid = request.getParameter("oid");

	ResultSet rs1 = con.createStatement().executeQuery("select order_id, order_date, user_fname||' '||user_lname, user_address, user_phone, user_email, total_amt, delivery_fees, order_status from orders, users where orders.user_id = users.user_id and order_id="+oid);
	rs1.next();
%>
<div style="padding:100px;">
<table class="table table-bordered">
<tr>
	<td><b>Order ID:</b></td>
	<td><%=rs1.getString(1)%></td>
</tr>
<tr>
	<td><b>Order Date:</b></td>
	<td><%=rs1.getString(2)%></td>
</tr>
<tr>
	<td><b>Name:</b></td>
	<td><%=rs1.getString(3)%></td>
</tr>
<tr>
	<td><b>Address:</b></td>
	<td><%=rs1.getString(4)%></td>
</tr>
<tr>
	<td><b>Phone:</b></td>
	<td><%=rs1.getString(5)%></td>
</tr>
<tr>
	<td><b>Email:</b></td>
	<td><%=rs1.getString(6)%></td>
</tr>
<tr>
	<td><b>Total Amount:</b></td>
	<td>Rs.<%=rs1.getString(7)%>/-</td>
</tr>
<tr>
	<td><b>Delivery Fees:</b></td>
	<td><%=rs1.getString(8)%></td>
</tr>
<tr>
	<td><b>Status:</b></td>
	<td><%=rs1.getInt(9)==0?"Pending":"Dispatched"%></td>
</tr>	
</table>
<table class="table table-bordered">
<tr class="danger">
	<th>Sr.No.</th>
	<th>Product Name</th>
	<th>Mfg/Exp Date</th>
	<th>Rate</th>
	<th>Qty</th>
	<th>Amount</th>
</tr>
<%
	int i=1;
	
	ResultSet rs2 = con.createStatement().executeQuery("select medicine_title, medicine_price, orders_details.order_quantity, medicine_price*orders_details.order_quantity, mfg_date, exp_date from medicine,orders_details where medicine.medicine_id = orders_details.medicine_id and order_id="+rs1.getInt(1));

	while(rs2.next()){
%>
<tr> 
	<td><%=i++%></td>
	<td><%=rs2.getString(1)%></td>
	<td><%=rs2.getString(5)+"/"+rs2.getString(6)%></td>
	<td><%=rs2.getString(2)%></td>
	<td><%=rs2.getString(3)%></td>
	<td><%=rs2.getString(4)%></td>
</tr>
<%} %>
<tr>
	<td colspan=5 align='right'><b>Total:</b></td>
	<td><b>Rs. <%=rs1.getFloat(7)%>/-</td>
</tr>
<tr>
	<td colspan=5 align='right'><b>Delivery Fees:</b></td>
	<td><b>Rs. <%=rs1.getFloat(8)%>/-</td>
</tr>
</table>
</div>

