<%@include file="config.jsp"%>

<%
	if(request.getParameter("signup")!=null) {
		String email = request.getParameter("email").trim().toLowerCase();
		String fname = request.getParameter("fname").trim();
		String lname = request.getParameter("lname").trim();
		String passwd = request.getParameter("passwd").trim();
		String address = request.getParameter("address").trim();
		String phone = request.getParameter("phone").trim();
	
		ResultSet rs = con.createStatement().executeQuery("select * from users where user_email='"+email+"'");
		if(rs.next()){
			session.setAttribute("message", "userEmail");
			response.sendRedirect("sign-up.jsp");
		}
		else{
	        String query = "INSERT INTO users (user_fname,user_lname,user_address,user_phone,user_email,user_password) VALUES('"+fname+"' ,'"+lname+"','"+address+"','"+phone+"','"+email+"','"+passwd+"')";
			con.createStatement().executeUpdate(query);
			rs = con.createStatement().executeQuery("SELECT user_id FROM users WHERE user_email='"+email+"'");
			rs.next();
			session.setAttribute("user_id", rs.getString("user_id"));
			response.sendRedirect("index.jsp");
		}
	}
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
                <div class="panel-title">Sign Up</div>
            </div>
            
                <%
                	if(session.getAttribute("message")!=null && session.getAttribute("message").toString().equals("usedEmail")){
                		session.setAttribute("message","");
                %>
                	<div class='alert alert-danger' role='alert'>This email is already used !!!</div>
                <% } %>
            <div class="panel-body">
                <form id="signupform" class="form-horizontal" role="form" method="post" action="sign-up.jsp">
                    <div class="form-group">
                        <label for="firstname" class="col-md-3 control-label">First Name</label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" name="fname" placeholder="First Name" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="lastname" class="col-md-3 control-label">Last Name</label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" name="lname" placeholder="Last Name" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="address" class="col-md-3 control-label">Address</label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" name="address" placeholder="Address" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="address" class="col-md-3 control-label">Phone</label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" name="phone" placeholder="Phone" required pattern="^[6789]\d{9}$">
                        </div>
                    </div>                   
                    <div class="form-group">
                        <label for="email" class="col-md-3 control-label">Email</label>
                        <div class="col-md-9">
                            <input type="email" class="form-control" name="email" placeholder="Email" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password" class="col-md-3 control-label">Password</label>
                        <div class="col-md-9">
                            <input type="password" class="form-control" name="passwd" placeholder="Password" required>
                        </div>
                    </div>
                  
                    <div class="form-group">
                        <div class="col-sm-12 controls">
                            <input id="btn-login" class="btn btn-success" type="submit" value="Sign Up" name="signup" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-12 control">
                            <div style="border-top: 1px solid#888; padding-top:15px; font-size:85%">
                                You already have an account?!
                                <a href="login.jsp">
                                    Sign In Here
                                </a>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>