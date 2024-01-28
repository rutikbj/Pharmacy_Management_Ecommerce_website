<%@include file="admin-head.jsp"%>
<%@include file="config.jsp"%>

<body>
	<%@include file="admin-header.jsp"%>


	<%@include file="admin-sidebar.jsp"%>

<%
	if(request.getParameter("admin_update")!=null){
        String fname = request.getParameter("admin_fname").toString();
        String lname = request.getParameter("admin_lname").toString();
        String email = request.getParameter("admin_email").toString();
        String password = request.getParameter("admin_password").toString();
        
		con.createStatement().executeUpdate("UPDATE admin SET admin_email='"+email+"' ,admin_fname='"+fname+"' ,admin_lname='"+lname+"' ,admin_password='"+password+"'  WHERE admin_id="+session.getAttribute("admin_id"));
		out.print("<script>alert('Admin profile updated successfully.'); location.href='admin-index.jsp';</script>");
	}
%>

    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
        <%
        	ResultSet rs = con.createStatement().executeQuery("select * from admin where admin_id="+session.getAttribute("admin_id"));
        	rs.next();
        %>
            <br>
            <h2>Edit Admin Details</h2>
            <form action="admin.jsp" method="POST">
                <div class="form-group">
                    <label>First name</label>
                    <input pattern="[A-Za-z_]{1,30}" type="text" class="form-control" value='<%=rs.getString("admin_fname")%>' name="admin_fname" required>
                    <div class="form-text">Please enter the first name in range(1-30) character/s , special character & numbers not allowed !</div>
                </div>
                <br>
                <div class="form-group">
                    <label for="validationTooltip01">Last name</label>
                    <input pattern="[A-Za-z_]{1,30}" id="validationTooltip01" type="text" class="form-control" value='<%=rs.getString("admin_lname")%>' name="admin_lname" required>
                    <div class="form-text">Please enter the last name in range(1-30) character/s , special character & numbers not allowed !</div>
                </div>
                <br>
                <div class="form-group">
                    <label for="exampleInputEmail1">Email address</label>
                    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" value='<%=rs.getString("admin_email")%>' name="admin_email" required>
                    <div class="form-text">Please enter the email in format : example@gmail.com.</div>
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">Password</label>               
                </div>
                <br>
                <button type="submit" class="btn btn-outline-primary" value="update" name="admin_update">Submit</button>
                <button type="submit" class="btn btn-outline-danger" value="cancel" name="admin_cancel">Cancel</button>
                <br> <br>
        </div>
    </main>
    </div>
    </div>
    <%@include file="admin-footer.jsp"%>
</body>