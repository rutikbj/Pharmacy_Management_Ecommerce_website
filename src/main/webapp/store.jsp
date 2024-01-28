<%@include file="head.jsp"%>
<body>
	<div class="site-wrap">
	<%@include file="header.jsp"%>
	<div class="bg-light py-3">
    	<div class="container">
        	<div class="row">
          		<div class="col-md-12 mb-0"><a href="index.jsp">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Store</strong></div>
        	</div>
      	</div>
    </div>
	<div class="site-section">
    	<div class="container">
        	<div class="row">
        		<%@include file="config.jsp"%>
          <%
          	ResultSet rs = null;
          
          	if (request.getParameter("search")!=null){
          		String search_text = request.getParameter("search");
          		rs = con.createStatement().executeQuery("SELECT * FROM medicine WHERE medicine_tags LIKE '%"+search_text+"%'");
			} 
          	else if (request.getParameter("cat")!=null) {
          		String cat = request.getParameter("cat");
          		rs = con.createStatement().executeQuery("SELECT * FROM medicine WHERE medicine_cat='"+cat+"' ORDER BY medicine_id");
			} 
          	else if (request.getParameter("store")!=null) {
        		 rs = rs = con.createStatement().executeQuery("SELECT * FROM medicine ORDER BY medicine_id");
			}
          	else{
          		rs = rs = con.createStatement().executeQuery("SELECT * FROM medicine ORDER BY medicine_id");
          	}
			int i = 0;
			
            if(rs.next()){
            	
            	do{
          %>
              <div class="col-sm-6 col-lg-4 text-center item mb-4">
                <a href="product.jsp?product_id=<%=rs.getInt(1)%>"> <img class="rounded mx-auto d-block" style="width:270px ; height:270px ;" src="images/<%=rs.getString(7)%>" alt="Image"></a>
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
            	i++;
            	}while(rs.next());
            
            if (i < 8) {
            	rs = rs = con.createStatement().executeQuery("SELECT * FROM medicine ORDER BY medicine_id");
            %>
              <div class="title-section text-center col-12">
                <h1 class="text-uppercase">Products You Might Like</h1>
                <br><br>
              </div>
              <%
              	i=0;
              	while(rs.next()){
              %>
                <div class="col-sm-6 col-lg-4 text-center item mb-4">
                <a href="product.jsp?product_id=<%=rs.getInt(1)%>"> <img class="rounded mx-auto d-block" style="width:270px ; height:270px ;" src="images/<%=rs.getString(7)%>" alt="Image"></a>
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
              	if(i==2) break;
              	i++;
              }
            }
           }
         	else {
         		rs = con.createStatement().executeQuery("select * from medicine order by medicine_id");
         		while(rs.next()){
              %>
              <div class="col-sm-6 col-lg-4 text-center item mb-4">
                <a href="product.jsp?product_id=<%=rs.getInt(1)%>"> <img class="rounded mx-auto d-block" style="width:270px ; height:270px ;" src="images/<%=rs.getString(7)%>" alt="Image"></a>
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
              if (i == 11) {
                break;
              }
            	i++;
            }
          } %>
        </div>

      </div>
    </div>

    <%@include file="footer.jsp"%>
  </div>
</body>
