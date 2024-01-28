<div class="site-navbar py-2">

    <div class="search-wrap">
        <div class="container">
            <a href="#" class="search-close js-search-close"><span class="icon-close2"></span></a>
            <form action="store.jsp" method="GET">
                <input type="text" name="search" class="form-control" placeholder="Search keyword and hit enter...">
            </form>
        </div>
    </div>
    <div class="container">
        <div class="d-flex align-items-center justify-content-between">
            <div class="logo">
                <div class="site-logo">
                    <a href="index.jsp" class="js-logo-clone">Evergreen Medico</a>
                </div>
            </div>
            <div class="main-nav d-none d-lg-block">
                <nav class="site-navigation text-right text-md-center" role="navigation">
                    <ul class="site-menu js-clone-nav d-none d-lg-block">
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="store.jsp?store=all">Store</a></li>
                        <li class="has-children">
                            <a href="#">Categories</a>
                            <ul class="dropdown">
                                <li><a href="store.jsp?cat=medicine">Medicine</a></li>
                                <li><a href="store.jsp?cat=self-care">Self Care</a></li>
                                <li><a href="store.jsp?cat=machine">Machine</a></li>

                            </ul>
                        </li>
                        <li><a href="about.jsp">About</a></li>
                        <li><a href="admin-login.jsp">Admin</a></li>
                <% if(session.getAttribute("user_id")!=null){%>
		                <li><a href="view-profile.jsp">Profile</a></li>
		                <li><a href="track-orders.jsp">My Orders</a></li>
                <%}%>
                        
                    </ul>
                </nav>
            </div>
            <div class="icons">
                <a href="#" class="icons-btn d-inline-block js-search-open"><span class="icon-search"></span></a>
                <a href="cart.jsp" class="icons-btn d-inline-block bag">
                    <span class="icon-shopping-bag"></span>
                    <%
                    	if(session.getAttribute("prodlist")!=null){
                    %>
                        <span class="number">

                            <%=((java.util.Vector)session.getAttribute("prodlist")).size()%>

                        </span>
                    <%
                    	}
                    	else{
                    %>
                        <span class="number">0</span>
                    <%} %>
                </a>
                
                <%
                	if(session.getAttribute("user_id")==null){
                    	out.print("<a href='login.jsp' class=' icons-btn d-inline-block '><span class='icon-sign-in'></span></a>");
                	} 
                	else {
                        out.print("<a href='logout.jsp' class=' icons-btn d-inline-block '><span class='icon-sign-out'></span></a>");
                    } 
                %>
                <a href="" class="site-menu-toggle js-menu-toggle ml-3 d-inline-block d-lg-none"><span class="icon-menu"></span></a>
            </div>
        </div>
    </div>
</div>