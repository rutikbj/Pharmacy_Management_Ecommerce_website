<%@include file="admin-head.jsp"%>

<body>

	<%@include file="admin-header.jsp"%>

  <div class=" container-fluid">

	<%@include file="admin-sidebar.jsp" %>

    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
      <br>
      <div class="row">
        <div class="card" style="width: 25rem;margin-bottom: 20px ;margin-right: 200px ;">
          <a href="orders.jsp">
            <img class="card-img-top" src="images/shopping-cart.svg" alt="Card image cap" style="width: 5rem;margin-top: 20px ;">
          </a>
          <div class="card-body">
            <h5 class="card-title">Orders</h5>
            <p class="card-text">Display and modify the orders details.</p>
            <a href="orders.jsp" class="btn btn-primary">Go to orders page</a>
          </div>
        </div>
        <div class="card" style="width: 25rem;margin-bottom: 20px ;">
          <a href="products.jsp">
            <img class="card-img-top" src="images/package.svg" alt="Card image cap" style="width: 5rem;margin-top: 20px ;">
          </a>
          <div class="card-body">
            <h5 class="card-title">Products</h5>
            <p class="card-text">Display and modify the products details.</p>
            <a href="products.jsp" class="btn btn-primary">Go to products page</a>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="card" style="width: 25rem;margin-top: 20px ;margin-right: 200px ;">
          <a href="customers.jsp">
            <img class="card-img-top" src="images/users.svg" alt="Card image cap" style="width: 5rem;margin-top: 20px ;">
          </a>
          <div class="card-body">
            <h5 class="card-title">Customers</h5>
            <p class="card-text">Display and modify the customers details.</p>
            <a href="customers.jsp" class="btn btn-primary">Go to customers page</a>
          </div>
        </div>
        <div class="card" style="width: 25rem;margin-top: 20px ;">
          <a href="admin.jsp">
            <img class="card-img-top" src="images/user.svg" alt="Card image cap" style="width: 5rem;margin-top: 20px ;">
          </a>
          <div class="card-body">
            <h5 class="card-title">Admin</h5>
            <p class="card-text">Display and modify the admin's details.</p>
            <a href="admin.jsp" class="btn btn-primary">Go to admin page</a>
          </div>
        </div>
      </div>
    </main>
  </div>

	<%@include file="admin-footer.jsp"%>
</body>

</html>