<%@include file="config.jsp"%>

<%
	if(request.getParameter("login")!=null) {
		String adminEmail = request.getParameter("adminEmail").toString().trim();
		String adminPassword = request.getParameter("adminPassword").toString().trim();
		
		ResultSet rs = con.createStatement().executeQuery("SELECT * FROM admin WHERE admin_email= '"+adminEmail+"' and admin_password='"+adminPassword+"'");
		if(rs.next()){
						session.setAttribute("admin_id", rs.getString("admin_id"));
			response.sendRedirect("admin-index.jsp");
			return;
		}
		else{
			session.setAttribute("message", "loginErr");
			response.sendRedirect("admin-login.jsp");
			return;
		}
	}
%>
<head>
    <title>
        Evergreen Medico
    </title>
    <link rel="icon" href="images/logo.png" type="image/icon type">
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>
<div class="container">
    <div id="loginbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
        <div class="panel panel-info">
            <div class="panel-heading">
                <div class="panel-title">Admin Sign In</div>
                <div style="float:right; font-size: 80%; position: relative; top:-10px"><a href="#">Forgot password?</a></div>
            </div>

            <div style="padding-top:30px" class="panel-body">

                <%
                	if(session.getAttribute("message")!=null && session.getAttribute("message").toString().equals("loginErr")){
                		session.setAttribute("message","");
                %>
                	<div class='alert alert-danger' role='alert'>The email or the password is incorrect !!!</div>
                <% } %>
                
                <form id="loginform" class="form-horizontal" role="form" method="post">

                    <div style="margin-bottom: 25px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                        <input id="login-username" type="text" class="form-control" name="adminEmail" value="" placeholder="Email">
                    </div>

                    <div style="margin-bottom: 25px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                        <input id="login-password" type="password" class="form-control" name="adminPassword" placeholder="Password">
                    </div>

                    <div style="margin-top:10px" class="form-group">
                        <div class="col-sm-12 controls">
                            <input id="btn-login" class="btn btn-success" type="submit" value="Login" name="login" />
                        </div>
                    </div>


                    <div class="form-group">
                        <div class="col-md-12 control">
                            <div style="border-top: 1px solid#888; padding-top:15px; font-size:85%">
                                Regular user?
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
</div>