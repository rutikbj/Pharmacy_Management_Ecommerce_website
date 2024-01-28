<%@page import="java.util.*"%>
<%@include file="head.jsp"%>

<body>

  <div class="site-wrap">
  <%@include file="header.jsp" %>
  <%@include file="config.jsp" %>
  <%
  	if(session.getAttribute("user_id")==null){
  		response.sendRedirect("login.jsp");
  		return;
  	}
  	
  	if(request.getParameter("cart")!=null){
  		Vector prodlist = null;
  		
  		if(session.getAttribute("prodlist")==null)
  			prodlist = new Vector();
  		else
  			prodlist = (Vector)session.getAttribute("prodlist");
  		
  		Vector rec = new Vector();
  		rec.add(session.getAttribute("user_id"));
  		rec.add(session.getAttribute("medicine_id"));
  		rec.add(request.getParameter("quantity"));
  		prodlist.add(rec);
  		session.setAttribute("prodlist", prodlist);
  		response.sendRedirect("cart.jsp");
  		return;
  	}
  	session.setAttribute("medicine_id", request.getParameter("product_id"));
  	ResultSet rs = con.createStatement().executeQuery("select * from medicine where medicine_id="+request.getParameter("product_id"));
  	rs.next();
  %>

    <div class="bg-light py-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0"><a href="index.jsp">Home</a> <span class="mx-2 mb-0">/</span> <a href="store.jsp">Store</a> <span class="mx-2 mb-0">/</span> <strong class="text-black"><?php echo $data[0]['item_title'] ?></strong></div>
        </div>
      </div>
    </div>

    <div class="site-section">
      <div class="container">
        <div class="row">
          <div class="col-md-5 mr-auto">
            <div class="border text-center">
              <img src="images/<%=rs.getString(7)%>" alt="Image" class="img-fluid p-5">
            </div>
          </div>
          <div class="col-md-6">
            <h2 class="text-black"><%=rs.getString(2)%></h2>
            <p><%=rs.getString(5)%></p>


            <p><strong class="text-primary h4">&#8377;<%=rs.getString(9)%></strong></p>
            <%
            if (rs.getInt(8)>0) {
            %>
              <h6 style="color: rgb(58, 211, 58);">In Stock</h6>
              <form action="product.jsp" method="POST">
                <div class="mb-5">
                  <div class="input-group mb-3" style="max-width: 220px;">

                    <input type="number" min="1" max="<%=rs.getInt(8)%>" name="quantity" class="form-control text-center" value="1" placeholder="" aria-label="Example text with button addon" aria-describedby="button-addon1">

                  </div>
                  <br>
                  <button name="cart" type="submit" class="btn btn-primary btn-lg">Add To Cart</button>
              </form>
            <% 
            } else {
            %>
              <small style="color: red;">Out Of Stock</small>
              <form action="product.jsp" method="POST">
                <div class="mb-5">
                  <div class="input-group mb-3" style="max-width: 220px;">

                    <input disabled type="number" name="quantity" class="form-control text-center" value="0" placeholder="" aria-label="Example text with button addon" aria-describedby="button-addon1">

                  </div>
                  <br>
                  <p style="color: black;"><a disabled type="submit" value="" class="buy-now btn btn-sm height-auto px-4 py-3 btn-primary">Add To Cart</a></p>

              </form>
            <% 
            }
            %>


          </div>

          <div class="mt-5">
            <ul class="nav nav-pills mb-3 custom-pill" id="pills-tab" role="tablist">
              <li class="nav-item">
                <a class="nav-link active" id="pills-home-tab" data-toggle="pill" href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true">Delivery Information</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" id="pills-profile-tab" data-toggle="pill" href="#pills-profile" role="tab" aria-controls="pills-profile" aria-selected="false">Specifications</a>
              </li>

            </ul>
            <div class="tab-content" id="pills-tabContent">
              <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
              <p>
                <% 
                	if(session.getAttribute("user_id")!=null){
                		ResultSet rs1 = con.createStatement().executeQuery("select * from users where user_id="+session.getAttribute("user_id"));
                		rs1.next();
                		out.print(rs1.getString("user_address"));
                	}
                	else{
                		out.print("Shivaji Chauk, Hinjawadi Phase-2 Pune, Maharashtra, INDIA - 411033");
                	}
                %>
                </p>
              </div>
              <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">

                <table class="table custom-table">

                  <tbody>
                    <tr>
                      <td>BRAND NAME</td>
                      <td class="bg-light"><%=rs.getString("medicine_brand")%></td>
                    </tr>
                    <tr>
                      <td>CATEGORY</td>
                      <td class="bg-light"><%=rs.getString("medicine_cat").toUpperCase()%></td>
                    </tr>
                    <tr>
                      <td>MFG DATE</td>
                      <td class="bg-light"><%=rs.getString("mfg_date")%></td>
                    </tr>
                    <tr>
                      <td>EXP DATE</td>
                      <td class="bg-light"><%=rs.getString("exp_date").toUpperCase()%></td>
                    </tr>
                    <tr>
                      <td>DELIVERY FEES</td>
                      <%
                      	if(rs.getInt("medicine_price")>=200){
                        out.print("<td class='bg-light'>FREE</td>");
                      } else {
                        out.print("<td class='bg-light'>&#8377; 40</td>");
                      }
                      %>
                    </tr>
                </table>

              </div>

            </div>
          </div>


        </div>
      </div>
    </div>
  </div>
  <%@include file="footer.jsp" %>
  </div>
</body>

</html>