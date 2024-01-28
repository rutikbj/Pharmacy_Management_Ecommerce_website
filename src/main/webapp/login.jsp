<%@include file="config.jsp"%>

<%
	if(request.getParameter("login")!=null) {
		String userEmail = request.getParameter("userEmail").trim();
	    String password = request.getParameter("password").trim();
	    ResultSet rs = con.createStatement().executeQuery("SELECT * FROM users WHERE user_email= '"+userEmail+"' and user_password='"+password+"'");
	    if (rs.next()) {
	    	session.setAttribute("user_id", rs.getString("user_id"));
	    	response.sendRedirect("index.jsp");
	    }
	    else{
	    	session.setAttribute("message", "loginErr");
	    	out.print("<script>document.getElementbyId('login-alert').style.display='block';</script>");
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
    <div id="loginbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
        <div class="panel panel-info">
            <div class="panel-heading">
                <div class="panel-title">Sign In</div>
                <div style="float:right; font-size: 80%; position: relative; top:-10px"><a href="#">Forgot password?</a></div>
            </div>

            <div style="padding-top:30px" class="panel-body">

                <div style="display:none" id="login-alert" class="alert alert-danger col-sm-12"></div>
                <%
                	if(session.getAttribute("message")!=null && session.getAttribute("message").toString().equals("loginErr")){
                		session.setAttribute("message","");
                %>
                	<div class='alert alert-danger' role='alert'>The email or the password is incorrect !!!</div>
                <% } %>
                
                <form id="loginform" class="form-horizontal" role="form" method="post" action="login.jsp">
                    <div style="margin-bottom: 25px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                        <input id="login-username" type="text" class="form-control" name="userEmail" value="" placeholder="Email" required>
                    </div>

                    <div style="margin-bottom: 25px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                        <input id="login-password" type="password" class="form-control" name="password" placeholder="password" required>
                    </div>

                    <div style="margin-top:10px" class="form-group">
                        <div class="col-sm-12 controls">
                            <input id="btn-login" class="btn btn-success" type="submit" value="Login" name="login" />
                        </div>
                    </div>


                    <div class="form-group">
                        <div class="col-md-12 control">
                            <div style="border-top: 1px solid#888; padding-top:15px; font-size:85%">
                                Don't have an account!
                                <a href="sign-up.jsp">
                                    Sign Up Here
                                </a>
                                <br>
                                <br>
                                <a href="admin-login.jsp">
                                    Sign In For Admin
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