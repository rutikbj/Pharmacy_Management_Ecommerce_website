<%@page import="java.util.*"%>
<%@include file="head.jsp"%>
<%@include file="config.jsp"%>

<%
	if(request.getParameter("delete")!=null){
		Vector prodlist = (Vector)session.getAttribute("prodlist");
		prodlist.remove(Integer.parseInt(request.getParameter("delete")));
		session.setAttribute("prodlist", prodlist);
	}
%>

<body>

  <div class="site-wrap">

	<%@include file="header.jsp"%>

    <div class="bg-light py-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0">
            <a href="index.jsp">Home</a> <span class="mx-2 mb-0">/</span>
            <strong class="text-black">Cart</strong>
          </div>
        </div>
      </div>
    </div>

    <div class="site-section">
      <div class="container">
        <div class="row mb-5">
          <form action="cart.jsp" class="col-md-12" method="post">
            <div class="site-blocks-table">
              <table class="table table-bordered">
                <thead>
                  <tr>
                    <th class="product-thumbnail">Image</th>
                    <th class="product-name">Product</th>
                    <th class="product-price">Mfg/Exp Date</th>
                    <th class="product-price">Price</th>
                    <th class="product-quantity">Quantity</th>
                    <th class="product-total">Total</th>
                    <th class="product-remove">Remove</th>
                  </tr>
                </thead>
                <tbody>
                  <%
                  if (session.getAttribute("prodlist")!=null) {
                	  Vector prodlist = (Vector)session.getAttribute("prodlist");
                	  int tot = 0;
                	  
                    for (int i = 0; i < prodlist.size(); i++) {
                    	Vector rec = (Vector)prodlist.get(i);
                    	ResultSet rs = con.createStatement().executeQuery("SELECT medicine_id, medicine_image,medicine_title,medicine_quantity,medicine_price,medicine_brand, mfg_date, exp_date FROM medicine WHERE medicine_id="+rec.get(1));
              			rs.next();
              			
              			int amt = rs.getInt("medicine_price") * Integer.parseInt(rec.get(2).toString());
              			tot += amt;
                  %>
                        <tr>
                          <td class="product-thumbnail">
                            <img src="images/<%=rs.getString(2)%>" alt="Image" class="img-fluid">
                          </td>
                          <td class="product-name">
                            <h2 class="h5 text-black"><%=rs.getString(3)%></h2>
                          </td>
                          <td><%=rs.getString(7)+"/"+rs.getString(8)%></td>
                          <td>&#8377; <%=rs.getString(5)%></td>
                          <td><%=rec.get(2)%></td>
                          <td>&#8377; <%=amt%></td>
                          <td><a href="cart.jsp?delete=<%=i%>" class="btn btn-primary height-auto btn-sm" onclick="return confirm('Delete from cart?')">Delete</a></td>
                        </tr>
                        <%} %>
                </tbody>
              </table>
            </div>
          </form>
        </div>

        <div class="row">
          <div class="col pl-5">
            <div class="row justify-content-end">
              <div class="col">
                <div class="row">
                  <div class="col-md-12 text-center border-bottom mb-5">
                    <h3 class="text-black h4 text-uppercase">Cart Totals</h3>
                  </div>
                </div>
                <div class="row mb-3">
                  <div class="col-md-6">
                    <span class="text-black"></span>
                  </div>

                  <div class="col-md-6 text-right">
                    <%
                    	for (int i = 0; i < prodlist.size(); i++) {
                        	Vector rec = (Vector)prodlist.get(i);
                        	ResultSet rs = con.createStatement().executeQuery("SELECT medicine_id, medicine_image,medicine_title,medicine_quantity,medicine_price,medicine_brand FROM medicine WHERE medicine_id="+rec.get(1));
                  			rs.next();
                  			
                  			int amt = rs.getInt("medicine_price") * Integer.parseInt(rec.get(2).toString());
                    		
                    %>
                        <strong class="text-black">&#8377; <%=amt%></strong> <br>
                    <%
                      }
                    %>
                  </div>

                </div>
                <div class="row mb-5">
                  <div class="col-md-6">
                    <span class="text-black font-weight-bold">Total</span>
                  </div>
                  <div class="col-md-6 text-right font-weight-bold">
                    <strong class="text-black">&#8377; <%=tot%></strong>
                  </div>
                </div>

                <div class="row">
                  <div class="col-md-6">
                    <button class="btn btn-outline-primary btn-lg btn-block" onclick="window.location='store.jsp'">Continue Shopping</button>
                  </div>
                  <br> <br>
                  <div class="col-md-6">
                    <button class="btn btn-primary btn-lg btn-block" onclick="window.location='checkout.jsp'">Proceed To
                      Checkout</button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  <%


                  } else {
  %>
    <h1 style="text-align: center; color:black; ">Your Cart is empty</h1>
  <%
                  }
  %>
  <%@include file="footer.jsp"%>
  </div>
</body>

</html>