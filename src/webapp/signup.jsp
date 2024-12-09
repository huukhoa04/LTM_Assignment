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
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"/>
  <script>
    function validateForm() {
      var password = document.getElementById("password").value;
      var confirmPassword = document.getElementById("confirm_password").value;
      var username = document.getElementById("username").value;
      var errorContainer = document.getElementById("error-container");
      
      // Hide error container initially
      errorContainer.style.display = "none";
      
      // Check if passwords match
      if (password !== confirmPassword) {
        errorContainer.innerHTML = "Passwords do not match!";
        errorContainer.style.display = "block";
        return false;
      }
      
      // Check password length
      if (password.length < 6) {
        errorContainer.innerHTML = "Password must be at least 6 characters long!";
        errorContainer.style.display = "block";
        return false;
      }
      
      // Check if username exists using AJAX
      var xhr = new XMLHttpRequest();
      xhr.open("POST", "UserController?action=checkUsername", false);
      xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
      xhr.send("username=" + username);
      
      if (xhr.responseText === "exists") {
        errorContainer.innerHTML = "Username already exists!";
        errorContainer.style.display = "block";
        return false;
      }
      
      return true;
    }
  </script>
</head>
<body>
  <div class="container mt-5">
    <div class="card">
      <div class="card-header">
        <h2>Sign Up</h2>
      </div>
      <div class="card-body">
        <form action="UserController?action=adduser" method="post" onsubmit="return validateForm()">
          <div class="form-group">
            <label for="username">Username:</label>
            <input type="text" class="form-control" id="username" name="Username" required />
          </div>
          
          <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" class="form-control" id="email" name="Email" required />
          </div>
          
          <div class="form-group">
            <label for="phoneNumber">Phone Number:</label>
            <input type="tel" class="form-control" id="phoneNumber" name="PhoneNumber" required />
          </div>
          
          <div class="form-group">
            <label for="work">Current Job:</label>
            <input type="text" class="form-control" id="work" name="Work" required />
          </div>
          
          <div class="form-group">
            <label for="workPlace">Workplace:</label>
            <input type="text" class="form-control" id="workPlace" name="WorkPlace" required />
          </div>
          
          <div class="form-group">
            <label for="aboutMe">About Me:</label>
            <textarea class="form-control" id="aboutMe" name="AboutMe" rows="3"></textarea>
          </div>
          
          <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" class="form-control" id="password" name="Password" required />
          </div>
          
          <div class="form-group">
            <label for="confirm_password">Confirm Password:</label>
            <input type="password" class="form-control" id="confirm_password" name="confirm_password" required />
          </div>
          
          <div id="error-container" class="alert alert-danger mt-3" style="display: none;">
          </div>
          
          <% if (request.getAttribute("error") != null) { %>
            <div class="alert alert-danger mt-3">
              <%= request.getAttribute("error") %>
            </div>
          <% } %>
          
          <button type="submit" class="btn btn-primary">Sign Up</button>
        </form>
        
        <div class="mt-3">
          <a href="login.jsp" class="link-primary">Already have an account? Login here</a>
        </div>
      </div>
    </div>
  </div>
</body>
</html>

