<%@page import="java.util.*" %>
<%@include file="head.jsp" %>
<%@include file="config.jsp" %>

<body>

  <div class="site-wrap">

<%@include file="header.jsp"%>

    <%
		ResultSet rs = con.createStatement().executeQuery("select count(*) from orders");
    	rs.next();
    	int oid = rs.getInt(1)+1;
    	con.createStatement().executeUpdate("insert into orders values("+oid+",current_date,"+session.getAttribute("user_id")+","+session.getAttribute("tot")+","+session.getAttribute("delivery")+",0)");
    	Vector prodlist = (Vector)session.getAttribute("prodlist");
    	for(int i=0; i<prodlist.size(); i++){
    		Vector rec = (Vector)prodlist.get(i);
    		con.createStatement().executeUpdate("insert into orders_details values("+oid+","+rec.get(1)+","+rec.get(2)+")");
    		con.createStatement().executeUpdate("UPDATE medicine SET medicine_quantity=medicine_quantity-"+rec.get(2)+" WHERE medicine_id = "+rec.get(1));
    	}
    	session.removeAttribute("prodlist");
    	session.removeAttribute("tot");
    	session.removeAttribute("delivery");
    	
    %>

    <div class="bg-light py-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0"><a href="index.jsp">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Thank You</strong></div>
        </div>
      </div>
    </div>

    <div class="site-section">
      <div class="container">
        <div class="row">
          <div class="col-md-12 text-center">
            <span class="icon-check_circle display-3 text-success"></span>
            <h2 class="display-3 text-black">Thank you!</h2>
            <p class="lead mb-5">You order is place successfully.</p>
            <p class="lead mb-5">Order #<%=oid%></p>
            <p><a href="store.jsp" class="btn btn-md height-auto px-4 py-3 btn-primary">Back to store</a></p>
          </div>
        </div>
      </div>
    </div>


    <%@include file="footer.jsp"%>
  </div>
</body>

</html>