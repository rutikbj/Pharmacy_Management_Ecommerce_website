<%@page import="java.util.*"%>
<%@include file="head.jsp"%>
<%@include file="config.jsp"%>

<body>

  <div class="site-wrap">

	<%@include file="header.jsp"%>
    <%
    	ResultSet rs = con.createStatement().executeQuery("select * from users where user_id="+session.getAttribute("user_id"));
    	rs.next();
    %>

    <div class="bg-light py-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0">
            <a href="index.php">Home</a> <span class="mx-2 mb-0">/</span>
            <strong class="text-black">Checkout</strong>
          </div>
        </div>
      </div>
    </div>

    <div class="site-section">
      <div class="container">
        <div class="row">
          <div class="col-md-6">

            <div class="row mb-5">
              <div class="col-md-12">
                <h2 class="h3 mb-3 text-black">Delivery Details</h2>
                <div class="p-3 p-lg-5 border">
                  <table class="table site-block-order-table mb-5">
                    <thead>

                      <th>Customer Details</th>
                    </thead>
                    <tbody>
                      <tr>
                        <td>First Name </td>
                        <td><%=rs.getString("user_fname")%></td>
                      </tr>
                      <tr>
                        <td>Last Name </td>
                        <td><%=rs.getString("user_lname")%></td>
                      </tr>
                      <tr>
                        <td>Email </td>
                        <td><%=rs.getString("user_email")%></td>
                      </tr>
                      <tr>
                        <td>Phone </td>
                        <td><%=rs.getString("user_phone")%></td>
                      </tr>
                      <tr>
                        <td>Address </td>
                        <td><%=rs.getString("user_address")%></td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>

          </div>
          <div class="col-md-6">

            <div class="row mb-5">
              <div class="col-md-12">
                <h2 class="h3 mb-3 text-black">Your Order</h2>
                <div class="p-3 p-lg-5 border">
                  <table class="table site-block-order-table mb-5">
                    <thead>
                      <th>Product</th>
                      <th>Total</th>
                    </thead>
                    <tbody>
                      <%
                      	Vector prodlist = (Vector)session.getAttribute("prodlist");
                      	int tot=0, delivery=0;
                        for (int i = 0; i < prodlist.size(); i++) {
                        	Vector rec = (Vector)prodlist.get(i);
                        	rs = con.createStatement().executeQuery("SELECT medicine_id, medicine_image,medicine_title,medicine_quantity,medicine_price,medicine_brand FROM medicine WHERE medicine_id="+rec.get(1));
                  			rs.next();
                  			
                  			int amt = rs.getInt("medicine_price") * Integer.parseInt(rec.get(2).toString());
                        	tot+=amt;
                      %>
                            <tr>
                              <td><%=rs.getString("medicine_title")%><strong class="mx-2">x</strong><%=rec.get(2)%></td>
                              <td>&#8377; <%=amt%></td>
                            </tr>
                      <% 
                        }
                        if(tot<200){
                        	delivery = prodlist.size()*40;
                        }
                        session.setAttribute("tot", tot);
                        session.setAttribute("delivery", delivery);
                      %>
                      <tr>
                        <td class="text-black font-weight-bold"><strong>Cart Subtotal</strong></td>
                        <td class="text-black">&#8377; <%=tot%></td>
                      </tr>
                      <tr>
                        <td class="text-black font-weight-bold"><strong>Delivery Fees</strong></td>
                        <td class="text-black">&#8377; <%=delivery%></td>
                      </tr>
                      <tr>
                        <td class="text-black font-weight-bold"><strong>Order Total</strong></td>
                        <td class="text-black font-weight-bold"><strong>&#8377; <%=tot+delivery%></strong></td>
                      </tr>
                    </tbody>
                  </table>
                  <div class="form-group">
                    <button class="btn btn-primary btn-lg btn-block" onclick="location.href='thankyou.jsp'">Place
                      Order</button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <%@include file="footer.jsp"%>
  </div>
</body>

</html>