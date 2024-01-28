<%@include file="admin-head.jsp"%>
<%@include file="config.jsp"%>

<body>
	<%@include file="admin-header.jsp"%>


	<%@include file="admin-sidebar.jsp"%>

    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
       <div class="container">
            <div class="row align-items-start">
                <div class="col">
                    <br>
                    <h2>Products details</h2>
                    <br>
                </div>
                <div class="col">
                </div>
                <div class="col">
                    <br>
                    <form class="d-flex" method="POST" action="products.jsp">
                        <input class="form-control me-2 col" type="search" name="search_item_name" placeholder="Search for product" aria-label="Search">
                        <button class="btn btn-outline-secondary" type="submit" name="search_item" value="search">Search</button>
                    </form>
                    <br>
                </div>
            </div>
        </div>
        <%
        if (request.getParameter("edit")!=null) {
            ResultSet rs = con.createStatement().executeQuery("select * from medicine where medicine_id="+request.getParameter("edit"));
            rs.next();
        %>
            <br>
            <h2>Edit Product Details</h2>
            <form action="UpdateProductServlet" method="POST" enctype="multipart/form-data">
            	<input type="hidden" name="id" value='<%=rs.getInt(1)%>'>
                <div class=" form-group mb-3">
                    <label>Product name</label>
                    <input pattern="[-A-Za-z0-9_ ]{1,100}" id="exampleInputText1" type="text" class="form-control" value='<%=rs.getString("medicine_title")%>' name="name" required>
                    <div class="form-text">Please enter the product name in range(1-100) character/s , special character not allowed !</div>
                </div>
                <div class="form-group">
                    <label>Brand name</label>
                    <input pattern="[-A-Za-z0-9_ ]{1,25}" id="validationTooltip01" type="text" class="form-control" value='<%=rs.getString("medicine_brand")%>' name="brand" required>
                    <div class="form-text">Please enter the brand name in range(1-25) character/s , special character not allowed !</div>
                </div>
                <div class="input-group mb-3 form-group">
                    <label class="input-group-text" for="inputGroupSelect01">Category</label>
                    <select name="cat" class="form-select" id="inputGroupSelect01" required>
                    	<option value='<%=rs.getString("medicine_cat")%>'><%=rs.getString("medicine_cat")%></option>
                        <option value="">Choose...</option>
                        <option value="medicine">Medicine</option>
                        <option value="self-care">Self-care</option>
                        <option value="machine">Machine</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>Product tags</label>
                    <input pattern="^[#.0-9a-zA-Z\s,-]+$" id="validationTooltip01" type="text" class="form-control" value='<%=rs.getString("medicine_tags")%>' name="tags" required>
                    <div class="form-text">Please enter tags for the product in range(1-250) character/s , special character not allowed !</div>
                </div>
                <div class="form-group">
                    <label>Product image</label>
                    <input type="file" accept="image/*" class="form-control" value='<%=rs.getString("medicine_image")%>' name="image">
                    <div class="form-text">Please enter image for the product .</div>
                </div>
                <div class="form-group">
                    <label>Product quantity</label>
                    <input type="number" class="form-control" value='<%=rs.getString("medicine_quantity")%>' name="quantity" min="1" max="999" required>
                    <div class="form-text">Please enter the quantity of the product in range(1-999) .</div>
                </div>
                <div class="input-group mb-3 form-group">
                    <span class="input-group-text">&#8377;</span>
                    <input pattern="[0-9]+" id="validationTooltip01" type="text" class="form-control" aria-label="Amount (to the nearest dollar)" name="price" value='<%=rs.getString("medicine_price")%>' required>
                    <span class="input-group-text">.00</span>
                </div>
                <div class="form-text">Please enter the price of the product .</div>
                <div class="form-group">
                    <label for="inputAddress2">Product details</label>
                    <input type="text" class="form-control" value='<%=rs.getString("medicine_details")%>' name="details" required>
	                <div class="form-text">Please enter the product details .</div>
                </div>
                <div class="form-group">
                    <label for="mfg_date">Mfg Date</label>
                    <input type="date" class="form-control" value='<%=rs.getString("mfg_date")%>' name="mfg_date" required>
	                <div class="form-text">Please enter product manufacturing date.</div>
                </div>
                <div class="form-group">
                    <label for="exp_date">Exp Date</label>
                    <input type="date" class="form-control" value='<%=rs.getString("exp_date")%>' name="exp_date" required>
	                <div class="form-text">Please enter product expiry date.</div>
                </div>
                <button type="submit" class="btn btn-outline-primary" value="update" name="update">Submit</button>
                <button type="reset" class="btn btn-outline-danger" value="cancel" name="cancel">Cancel</button>
                <br> <br>
            </form>
        <% 
        }
        %>
        <%
        if (request.getParameter("add")!=null) {
        %>
            <br>
            <h2>Add Product</h2>
            <form action="AddProductServlet" method="POST" enctype="multipart/form-data">
                <div class=" form-group mb-3">
                    <label>Product name</label>
                    <input id="exampleInputText1" type="text" class="form-control" placeholder="Product name" name="name" required>
                    <div class="form-text">Please enter the product name in range(1-25) character/s , special character not allowed !</div>
                </div>
                <div class="form-group">
                    <label>Brand name</label>
                    <input id="validationTooltip01" type="text" class="form-control" placeholder="Product brand" name="brand" required>
                    <div class="form-text">Please enter the brand name in range(1-25) character/s , special character not allowed !</div>
                </div>
                <div class="input-group mb-3 form-group">
                    <label class="input-group-text" for="inputGroupSelect01">Category</label>
                    <select name="cat" class="form-select" id="inputGroupSelect01" required>
                        <option value="" selected>Choose...</option>
                        <option value="medicine">Medicine</option>
                        <option value="self-care">Self-care</option>
                        <option value="machine">Machine</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>Product tags</label>
                    <input id="validationTooltip01" type="text" class="form-control" placeholder="Product tags" name="tags" required>
                    <div class="form-text">Please enter tags for the product in range(1-250) character/s , special character not allowed !</div>
                </div>
                <div class="form-group">
                    <label>Product image</label>
                    <input type="file" accept="image/*" class="form-control" placeholder="Product Image" name="image" required>
                    <div class="form-text">Please enter image for the product .</div>
                </div>
                <div class="form-group">
                    <label>Product quantity</label>
                    <input type="number" class="form-control" placeholder="Product quantity" name="quantity" min="1" max="999" required>
                    <div class="form-text">Please enter the quantity of the product in range(1-999) .</div>
                </div>
                <div class="input-group mb-3 form-group">
                    <span class="input-group-text">&#8377;</span>
                    <input type="text" class="form-control" aria-label="Amount (to the nearest rupee)" name="price" placeholder="Product price" required>
                    <span class="input-group-text">.00</span>
                </div>
                <div class="form-text">Please enter the price of the product .</div>
                <div class="form-group">
                    <label for="inputAddress2">Product details</label>
                    <input type="text" class="form-control" placeholder="Product details" name="details" required>
	                <div class="form-text">Please enter the product details .</div>
                </div>
                <div class="form-group">
                    <label for="mfg_date">Mfg Date</label>
                    <input type="date" class="form-control" name="mfg_date" required>
	                <div class="form-text">Please enter product manufacturing date.</div>
                </div>
                <div class="form-group">
                    <label for="exp_date">Exp Date</label>
                    <input type="date" class="form-control" name="exp_date" required>
	                <div class="form-text">Please enter product expiry date.</div>
                </div>
                <button type="submit" class="btn btn-outline-primary" value="update" name="add_item">Submit</button>
                <button type="reset" class="btn btn-outline-danger" value="cancel" name="cancel">Cancel</button>
                <br> <br>
            </form>
        <% }%>

        <div class="table-responsive">
            <table class="table table-striped table-sm">
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Title</th>
                        <th scope="col">Brand</th>
                        <th scope="col">Category</th>
                        <th scope="col">Tags</th>
                        <th scope="col">Image</th>
                        <th scope="col">Quantity</th>
                        <th scope="col">Price</th>
                        <th scope="col">Details</th>
                        <th scope="col">Mfg/Exp Date</th>                   
                        <th scope="col" colspan=2>
                            <button type="button" class="btn btn-outline-primary"><a style="text-decoration: none; color:black;" href="products.jsp?add=1"> &nbsp;&nbsp;Add&nbsp;&nbsp;</a></button>
                        </th>
              
                </thead>
                <tbody>
                    <%
                    	ResultSet rs = null;
                    
                    	if(request.getParameter("delete")!=null){
                    		con.createStatement().executeUpdate("delete from medicine where medicine_id="+request.getParameter("delete"));
                    		response.sendRedirect("products.jsp");
                    		return;
                    	}
                    	
                    	if(request.getParameter("search_item")!=null){
                    		String name = request.getParameter("search_item_name").trim();
                    		rs = con.createStatement().executeQuery("SELECT * FROM medicine WHERE medicine_title LIKE '%"+name+"%'");
                    	}
                    	else{
                    		rs = con.createStatement().executeQuery("select * from medicine order by medicine_id");
                    	}
                        while(rs.next()) {
                    %>
                            <tr>
                                <td><%=rs.getString("medicine_id")%></td>
                                <td><%=rs.getString("medicine_title")%></td>
                                <td><%=rs.getString("medicine_brand")%></td>
                                <td><%=rs.getString("medicine_cat").toUpperCase()%></td>
                                <td><%=rs.getString("medicine_tags")%></td>
                                <td><img src='images/<%=rs.getString("medicine_image")%>' width="100" height="100"></td>
                                <td><%=rs.getString("medicine_quantity")%></td>
                                <td><%=rs.getString("medicine_price")%></td>
                                <td><%=rs.getString("medicine_details")%></td>
                                <td><%=rs.getString("mfg_date")+"/"+rs.getString("exp_date")%></td>
                                <td>
                                    <button type="button" class="btn pull-left btn-outline-warning"><a style="text-decoration: none; color:black;" href='products.jsp?edit=<%=rs.getString("medicine_id")%>'>Edit</a></button>
                                </td>
                                <td>
                                    <button type="button" class="btn pull-left btn-outline-danger"><a style="text-decoration: none; color:black;" href='products.jsp?delete=<%=rs.getString("medicine_id")%>' onclick="return confirm('Delete medicine?')">Delete</a></button>
                                </td>
                            </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
    </main>
    </div>
    </div>
    <%@include file="admin-footer.jsp"%>
</body>