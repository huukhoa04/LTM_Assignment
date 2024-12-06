<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 12/6/2024
  Time: 4:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>

  <title>Update user info</title>
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
          rel="stylesheet"
  />
</head>
<body>
<%--navbar--%>
<%@include file="../_layout/header.jsp"%>
<div class="container mt-5">
  <h2>Update User's info</h2>
  <form action="/submit" method="post" class="mb-3">
    <div class="form-group">
      <label for="username">Username:</label>
      <input
              type="text"
              class="form-control"
              id="username"
              name="username"
              placeholder="Enter username"
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
              placeholder="Enter email"
              required
      />
    </div>
    <div class="form-group">
      <label for="job">Job:</label>
      <input
              type="text"
              class="form-control"
              id="job"
              name="job"
              placeholder="Enter job"
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
              placeholder="Enter workplace"
              required
      />
    </div>
    <div class="form-group">
      <label for="about-me">About Me</label>
      <textarea
              class="form-control"
              id="about-me"
              rows="3"
              placeholder="Tell us about yourself"
              name="bio"
      ></textarea>
    </div>
    <div class="form-group">
      <label for="address">Address:</label>
      <input
              type="text"
              class="form-control"
              id="address"
              name="address"
              placeholder="Enter address"
              required
      />
    </div>
    <button type="submit" class="btn btn-primary">Update User</button>
  </form>
  <a href="./index.html" class="link-primary mt-5"
  >Back to Admin main page</a
  >
</div>
</body>
</html>

