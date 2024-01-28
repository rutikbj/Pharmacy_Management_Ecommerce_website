<%@include file="head.jsp"%>

<body>

  <div class="site-wrap">
	<%@include file="header.jsp"%>
    <div class="site-blocks-cover" style="background-image: url('images/hero_1.jpg');">
      <div class="container">
        <div class="row">
          <div class="col-lg-7 mx-auto order-lg-2 align-self-center">
            <div class="site-block-cover-content text-center">
              <h2 class="sub-title">Effective Medicine, New Medicine Everyday</h2>
              <h1>Welcome To Evergreen Medico</h1>
              <p>
                <a href="store.jsp" class="btn btn-primary px-5 py-3">Shop Now</a>
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="site-section">
      <div class="container">
        <div class="row align-items-stretch section-overlap">
          <div class="col-md-6 col-lg-4 mb-4 mb-lg-0">
            <div class="banner-wrap bg-primary h-100">
          
        </div>
      </div>
    </div>
    
    <div class="site-section">
      <div class="container">
        <div class="row">
          <div class="title-section text-center col-12">
            <h2 class="text-uppercase">Products You Might Like</h2>
          </div>
        </div>

        <div class="row">
        	<%@include file="config.jsp"%>
        	
        	<%
        		ResultSet rs = con.createStatement().executeQuery("select * from medicine order by medicine_id");
               int i=0;
                while(rs.next()){
        	%>
            <div class="col-sm-6 col-lg-4 text-center item mb-4">
              <a href="product.jsp?product_id=<%=rs.getInt(1)%>"> <img class="rounded mx-auto d-block" style="width:20vw ; height:40vh ;" src="images/<%=rs.getString(7)%>" alt="Image"></a>
              <% if (rs.getString(2).length()<=20) { %>
                <h3 class="text-dark"><a href="product.jsp?product_id=<%=rs.getInt(1)%>"><%=rs.getString(2)%></a></h3>
              <% 
              } else {
              %>
                <h3 class="text-dark"><a href="product.jsp?product_id=<%=rs.getInt(1)%>"><%=rs.getString(2).substring(0, 20) + "..." %></a></h3>
              <%
              }
              %>
              <p class="price">&#8377;<%=rs.getString(9)%></p>
            </div>
          <% 
            if (i == 5) {
              break;
            }
          	i++;
          }
          %>
        </div>
        <div class="row mt-5">
          <div class="col-12 text-center">
            <a href="store.jsp" class="btn btn-primary px-4 py-3">View All Products</a>
          </div>
        </div>
      </div>
    </div>


    <div class="site-section bg-light">
      <div class="container">
        <div class="row">
          <div class="title-section text-center col-12">
            <h2 class="text-uppercase">New Products</h2>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12 block-3 products-wrap">
            <div class="nonloop-block-3 owl-carousel">
        	<%
        		rs = con.createStatement().executeQuery("select * from medicine order by medicine_id desc");
               i=0;
                while(rs.next()){
        	%>
            <div class="col-sm-6 col-lg-4 text-center item mb-4">
              <a href="product.jsp?product_id=<%=rs.getInt(1)%>"> <img class="rounded mx-auto d-block" style="width:20vw ; height:40vh ;" src="images/<%=rs.getString(7)%>" alt="Image"></a>
              <% if (rs.getString(2).length()<=20) { %>
                <h3 class="text-dark"><a href="product.jsp?product_id=<%=rs.getInt(1)%>"><%=rs.getString(2)%></a></h3>
              <% 
              } else {
              %>
                <h3 class="text-dark"><a href="product.jsp?product_id=<%=rs.getInt(1)%>"><%=rs.getString(2).substring(0, 20) + "..." %></a></h3>
              <%
              }
              %>
              <p class="price">&#8377;<%=rs.getString(9)%></p>
            </div>
          <% 
            if (i == 5) {
              break;
            }
          	i++;
          }
          %>
            </div>
          </div>
        </div>
      </div>
    </div>

   

<%@include file="footer.jsp"%>
  </div>



</body>

</html>