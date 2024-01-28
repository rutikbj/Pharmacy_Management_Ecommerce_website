<%@include file="config.jsp"%>

<%
	if(request.getParameter("signup")!=null) {
		String id = session.getAttribute("user_id").toString();
		String email = request.getParameter("email").trim().toLowerCase();
		String fname = request.getParameter("fname").trim();
		String lname = request.getParameter("lname").trim();
		String passwd = request.getParameter("passwd").trim();
		String address = request.getParameter("address").trim();
		String phone = request.getParameter("phone").trim();
	
		ResultSet rs = con.createStatement().executeQuery("select * from users where user_email='"+email+"' and user_id<>"+id);
		if(rs.next()){
			session.setAttribute("message", "userEmail");
			response.sendRedirect("view-profile.jsp");
		}
		else{
	        String query = "update users set user_fname='"+fname+"',user_lname='"+lname+"',user_address='"+address+"',user_phone='"+phone+"',user_email='"+email+"',user_password='"+passwd+"' where user_id="+id;
			con.createStatement().executeUpdate(query);
			out.print("<script>alert('User profile updated successfully.'); location.href='index.jsp';</script>");
		}
	}

	ResultSet rs = con.createStatement().executeQuery("select * from users where user_id="+session.getAttribute("user_id"));
	rs.next();
%>

<head>
    <title>EvergreenMedico</title>
    <link rel="icon" href="images/logo.png" type="image/icon type">
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>
<div class="container">
    <div id="signupbox" style=" margin-top:50px" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
        <div class="panel panel-info">
            <div class="panel-heading">
                <div class="panel-title">Profile</div>
            </div>
            
                <%
                	if(session.getAttribute("message")!=null && session.getAttribute("message").toString().equals("usedEmail")){
                		session.setAttribute("message","");
                %>
                	<div class='alert alert-danger' role='alert'>This email is already used !!!</div>
                <% } %>
            <div class="panel-body">
                <form id="signupform" class="form-horizontal" role="form" method="post">
                    <div class="form-group">
                        <label for="firstname" class="col-md-3 control-label">First Name</label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" name="fname" placeholder="First Name" value='<%=rs.getString("user_fname")%>' required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="lastname" class="col-md-3 control-label">Last Name</label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" name="lname" placeholder="Last Name" value='<%=rs.getString("user_lname")%>' required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="address" class="col-md-3 control-label">Address</label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" name="address" placeholder="Address" value='<%=rs.getString("user_address")%>' required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="address" class="col-md-3 control-label">Phone</label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" name="phone" placeholder="Phone" value='<%=rs.getString("user_phone")%>' required pattern="^[6789]\d{9}$">
                        </div>
                    </div>                   
                    <div class="form-group">
                        <label for="email" class="col-md-3 control-label">Email</label>
                        <div class="col-md-9">
                            <input type="email" class="form-control" name="email" placeholder="Email" value='<%=rs.getString("user_email")%>' required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password" class="col-md-3 control-label">Password</label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" name="passwd" placeholder="Password" value='<%=rs.getString("user_password")%>' required>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <div class="col-sm-12 controls">
                            <input id="btn-login" class="btn btn-success" type="submit" value="Update" name="signup" />
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>