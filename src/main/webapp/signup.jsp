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
  <title>Signup</title>
</head>
<body>
<div class="container mt-5">
  <h2>Signup</h2>
  <form action="/submit_signup" method="post">
    <div class="form-group">
      <label for="username">Username:</label>
      <input
              type="text"
              class="form-control"
              id="username"
              name="username"
              required
      />
    </div>
    <div class="form-group">
      <label for="email">Email:</label>
      <input
              type="email"
              class="form-control"
              id="email"
              name="email"
              required
      />
    </div>
    <div class="form-group">
      <label for="current_job">Current Job:</label>
      <input
              type="text"
              class="form-control"
              id="current_job"
              name="current_job"
              required
      />
    </div>
    <div class="form-group">
      <label for="workplace">Workplace:</label>
      <input
              type="text"
              class="form-control"
              id="workplace"
              name="workplace"
              required
      />
    </div>
    <div class="form-group">
      <label for="address">Address:</label>
      <input
              type="text"
              class="form-control"
              id="address"
              name="address"
              required
      />
    </div>
    <div class="form-group">
      <label for="password">Password:</label>
      <input
              type="password"
              class="form-control"
              id="password"
              name="password"
              required
      />
    </div>
    <div class="form-group">
      <label for="confirm_password">Confirm Password:</label>
      <input
              type="password"
              class="form-control"
              id="confirm_password"
              name="confirm_password"
              required
      />
    </div>
    <div
            id="error-container"
            class="alert alert-danger mt-3"
            role="alert"
    >
      Validation check message
    </div>
    <button type="submit" class="btn btn-primary">Signup</button>
  </form>
  <a href="/login.html" class="link-primary">
    Already have an account? Login here
  </a>
</div>
<link
        rel="stylesheet"
        href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
/>
</body>
</html>

