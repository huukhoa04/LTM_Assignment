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
    <title>Settings</title>
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
<%@include file="_layout/header.jsp"%>

<div class="container pt-5 pb-5">
    <h1 class="text-center p-3">
        <b>User Account Settings</b>
    </h1>
    <% if (session.getAttribute("success") != null) { %>
        <div class="alert alert-success alert-dismissible fade show">
            <strong>Success!</strong> <%= session.getAttribute("success") %>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <% session.removeAttribute("success"); %>
    <% } %>
    
    <% if (session.getAttribute("error") != null) { %>
        <div class="alert alert-danger alert-dismissible fade show">
            <strong>Error!</strong> <%= session.getAttribute("error") %>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <% session.removeAttribute("error"); %>
    <% } %>

    <!-- form thay doi thong tin -->
    <form action="UserController?action=updateProfile" method="post" class="mb-3">
        <input type="hidden" name="UserId" value="<%= user.getUserId() %>"/>
        <h4 class="text-left mb-3">
            <b>Basic info</b>
        </h4>
        <div class="form-group">
            <label for="username">Username</label>
            <input type="text" class="form-control" id="username" name="Username"
                  value="<%= user.getUsername() %>" required/>
        </div>
        <div class="form-group">
            <label for="email">Email address</label>
            <input type="email" class="form-control" id="email" name="Email"
                  value="<%= user.getEmail() %>" required/>
        </div>
        <div class="form-group">
            <label for="phonenumber">Phone number</label>
            <input type="text" class="form-control" id="phonenumber" name="PhoneNumber"
                  value="<%= user.getPhoneNumber() %>" required/>
        </div>
        <div class="form-group">
            <label for="about-me">About Me</label>
            <textarea class="form-control" id="about-me" name="AboutMe" rows="3"
                     ><%= user.getAboutMe() %></textarea>
        </div>
        <h4 class="text-left mb-3">
            <b>Work</b>
        </h4>
        <div class="form-group">
            <label for="job">Current job</label>
            <input type="text" class="form-control" id="job" name="Work"
                  value="<%= user.getWork() %>" required/>
        </div>
        <div class="form-group">
            <label for="workplace">Workplace</label>
            <input type="text" class="form-control" id="workplace" name="WorkPlace"
                  value="<%= user.getWorkPlace() %>" required/>
        </div>
        <button type="submit" class="btn btn-primary">Save Changes</button>
    </form>
    <h4 class="text-left mb-3">
        <b>Password settings</b>
    </h4>
    <!-- form thay doi password -->
    <form action="UserController?action=changePassword" method="post" onsubmit="return validatePassword()">
        <input type="hidden" name="UserId" value="<%= user.getUserId() %>"/>
        <div class="form-group">
            <label for="current-password">Current password</label>
            <input type="password" class="form-control" id="current-password" 
                   name="currentPassword" required/>
        </div>
        <div class="form-group">
            <label for="new-password">New password</label>
            <input type="password" class="form-control" id="new-password" 
                   name="newPassword" required/>
        </div>
        <div class="form-group">
            <label for="confirm-password">Confirm new password</label>
            <input type="password" class="form-control" id="confirm-password" 
                   name="confirmPassword" required/>
        </div>
        <button type="submit" class="btn btn-primary">Change Password</button>
    </form>
</div>

<script>
function validatePassword() {
    var newPass = document.getElementById("new-password").value;
    var confirmPass = document.getElementById("confirm-password").value;
    
    if (newPass !== confirmPass) {
        alert("New passwords do not match!");
        return false;
    }
    return true;
}
</script>
</body>
</html>

