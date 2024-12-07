<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 12/6/2024
  Time: 4:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Login</title>
</head>
<body>
<link
        href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
        rel="stylesheet"
/>

<div class="container">
  <div class="row justify-content-center">
    <div class="col-md-6">
      <div class="card mt-5">
        <div class="card-header text-center">
          <h3>Login</h3>
        </div>
        <div class="card-body">
          <form action="${pageContext.request.contextPath}/login" method="post">
            <div class="form-group">
              <label for="username">Username</label>
              <input
                      type="text"
                      class="form-control"
                      id="username"
                      name="username"
                      placeholder="Username"
                      required
              />
            </div>
            <div class="form-group">
              <label for="password">Password</label>
              <input
                      type="password"
                      class="form-control"
                      id="password"
                      name="password"
                      placeholder="Password"
                      required
              />
            </div>
            <% if (request.getAttribute("error") != null) { %>
            <div class="alert alert-danger mt-3">
              <%= request.getAttribute("error") %>
            </div>
            <% } %>
            <button type="submit" class="btn btn-primary btn-block">
              Login
            </button>
          </form>

          <div class="text-left mt-3">
            <a href="${pageContext.request.contextPath}/signup.jsp" class="link-primary">
              Don't have any account? Sign up here
            </a>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
