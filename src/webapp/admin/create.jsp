<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 12/6/2024
  Time: 4:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
  <title>Create new user</title>
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
          rel="stylesheet"
  />
  <script>
    function validateForm() {
      var password = document.getElementById("password").value;
      var confirmPassword = document.getElementById("confirmPassword").value;
      
      if (password !== confirmPassword) {
        alert("Passwords do not match!");
        return false;
      }
      return true;
    }
  </script>
</head>
<body>
<%--navbar--%>
<%@include file="../_layout/header.jsp"%>
<div class="container mt-5">
  <div class="card">
    <div class="card-header">
      <h2>Create New User</h2>
    </div>
    <div class="card-body">
      <form action="AdminController?action=adduser" method="post" onsubmit="return validateForm()">
        <div class="form-group">
          <label for="username">Username:</label>
          <input
                  type="text"
                  class="form-control"
                  id="username"
                  name="Username"
                  required
          />
        </div>
        
        <div class="form-group">
          <label for="password">Password:</label>
          <input
                  type="password"
                  class="form-control"
                  id="password"
                  name="Password"
                  required
          />
        </div>
        
        <div class="form-group">
          <label for="confirmPassword">Confirm Password:</label>
          <input
                  type="password"
                  class="form-control"
                  id="confirmPassword"
                  required
          />
        </div>
        
        <div class="form-group">
          <label for="email">Email:</label>
          <input
                  type="email"
                  class="form-control"
                  id="email"
                  name="Email"
                  required
          />
        </div>
        
        <div class="form-group">
          <label for="phone">Phone:</label>
          <input
                  type="tel"
                  class="form-control"
                  id="phone"
                  name="PhoneNumber"
                  required
          />
        </div>
        
        <div class="form-group">
          <label for="work">Job:</label>
          <input
                  type="text"
                  class="form-control"
                  id="work"
                  name="Work"
                  required
          />
        </div>
        
        <div class="form-group">
          <label for="workplace">Workplace:</label>
          <input
                  type="text"
                  class="form-control"
                  id="workplace"
                  name="WorkPlace"
                  required
          />
        </div>
        
        <div class="form-group">
          <label for="aboutMe">About Me:</label>
          <textarea
                  class="form-control"
                  id="aboutMe"
                  name="AboutMe"
                  rows="3"
          ></textarea>
        </div>

        <% if (request.getAttribute("error") != null) { %>
          <div class="alert alert-danger">
            <%= request.getAttribute("error") %>
          </div>
        <% } %>
        
        <div class="mt-3">
          <button type="submit" class="btn btn-primary">Create User</button>
          <a href="AdminController?action=listuser" class="btn btn-secondary">Cancel</a>
        </div>
      </form>
    </div>
  </div>
</div>
</body>
</html>

