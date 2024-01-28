<%@include file="config.jsp" %>

<%
	String uid = session.getAttribute("user_id").toString();
	ResultSet rs = con.createStatement().executeQuery("select order_id, order_date, user_fname||' '||user_lname, total_amt, delivery_fees, order_status from orders, users where orders.user_id = users.user_id and orders.user_id="+uid+" order by order_id");
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Customer</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css" />
  <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
  <script type="text/javascript" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
<style>
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 550px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      background-color: #f1f1f1;
      height: 100%;
    }
        
    /* On small screens, set height to 'auto' for the grid */
    @media screen and (max-width: 767px) {
      .row.content {height: auto;} 
    }
  </style>
</head>
<body>

<div class="container-fluid">
  <div class="row content">
  <br>
    
    <div class="col-sm-9">
      <div class="row" style="padding: 5px;">

        <h3>My Orders</h3>

        <table id="tableID" class="display" style="width:100%;" border=1>
<thead>
    <tr style="background-color: black; color: white;">
        <th>Order ID</th>
        <th>Order Date</th>
        <th>Customer Name</th>
        <th>Total Amount</th>
        <th>Delivery Fees</th>
        <th>Status</th>
        <th>Action</th>
    </tr>
</thead>
<tbody>
<% 
    int i=1;
    while(rs.next())
    {
%>
    <tr>
    	<th><%=rs.getString(1)%></th>
    	<th><%=rs.getString(2)%></th>
    	<th><%=rs.getString(3)%></th>
    	<th><%=rs.getString(4)%></th>
    	<th><%=rs.getString(5)%></th>
    	<th><%=rs.getInt(6)==0?"Pending":"Dispatched"%></th>
        <th><a href='manage_orders1.jsp?oid=<%=rs.getString(1)%>'>Detail View</a></th>
    </tr>
<%} %>
</tbody>
</table>
      </div>
    </div>
  </div>
</div>

<script>
	$(document).ready(function() {
		$('#tableID').DataTable({ });
	});
</script>

</body>
</html>
