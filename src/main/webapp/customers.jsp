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
                    <h2>Customer details</h2>
                    <br>
                </div>
                <div class="col">
                </div>
                <div class="col">
                    <br>
                    <form class="d-flex" method="POST" action="customers.jsp">
                        <input class="form-control me-2 col" type="search" name="search_user_email" placeholder="Search for user (email)" aria-label="Search" required>
                        <button class="btn btn-outline-secondary" type="submit" name="search_user" value="search">Search</button>
                    </form>
                    <br>
                </div>
            </div>
        </div>

        <div class="table-responsive">
            <table class="table table-striped table-sm">
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">First Name</th>
                        <th scope="col">Last Name</th>
                        <th scope="col">Email</th>
						<th scope="col">Phone</th>	
                        <th scope="col">Address</th>
						<th scope="col"></th>
                </thead>

                <tbody>
                    <%
ResultSet rs = null;

if(request.getParameter("delete")!=null){
	con.createStatement().executeUpdate("delete from users where user_id="+request.getParameter("delete"));
	response.sendRedirect("customers.jsp");
	return;
}						
if(request.getParameter("search_user")!=null) {
	String email = request.getParameter("search_user_email");
	rs = con.createStatement().executeQuery("SELECT * FROM users WHERE user_email='"+email+"'");
}
else{
	rs = con.createStatement().executeQuery("select * from users order by user_id");
}
                    while(rs.next()) {
                    %>
                        <tr>
                            <td><%=rs.getString("user_id")%></td>
                            <td><%=rs.getString("user_fname")%></td>
                            <td><%=rs.getString("user_lname")%></td>
                            <td><%=rs.getString("user_email")%></td>
                            <td><%=rs.getString("user_phone")%></td>
                            <td><%=rs.getString("user_address")%></td>
                            <td>
                                <button type="button" class="btn pull-left btn-outline-danger"><a style="text-decoration: none; color:black;" href="customers.jsp?delete=<%=rs.getInt(1)%>" onclick="return confirm('Delete customer?')">Delete</a></button>
                            </td>
                        </tr>
                    <%} %>
                </tbody>
            </table>
        </div>

    </main>
    </div>
    </div>
    <%@include file="admin-footer.jsp"%>
    
</body>