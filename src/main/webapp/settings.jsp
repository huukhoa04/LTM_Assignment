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
    <!-- submit thanh cong -->
    <div class="alert alert-success">
        <strong>Success!</strong> Your changes have been saved.
    </div>
    <!-- submit that bai -->
    <div class="alert alert-danger">
        <strong>Error!</strong> *validation message*.
    </div>
    <!-- form thay doi thong tin -->
    <form class="mb-3">
        <h4 class="text-left mb-3">
            <b>Basic info</b>
        </h4>
        <div class="form-group">
            <label for="username">Username</label>
            <input
                    type="text"
                    class="form-control"
                    id="username"
                    name="username"
                    placeholder="Enter username"
            />
        </div>
        <div class="form-group">
            <label for="email">Email address</label>
            <input
                    type="email"
                    class="form-control"
                    id="email"
                    name="email"
                    placeholder="Enter email"
            />
        </div>
        <div class="form-group">
            <label for="phonenumber">Phone number</label>
            <input
                    type="text"
                    class="form-control"
                    id="phonenumber"
                    name="phonenumber"
                    placeholder="Enter your phonenumber"
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
        <h4 class="text-left mb-3">
            <b>Work</b>
        </h4>
        <div class="form-group">
            <label for="job">Current job</label>
            <input
                    type="text"
                    class="form-control"
                    id="job"
                    name="job"
                    placeholder="Enter your job title"
            />
        </div>
        <div class="form-group">
            <label for="workplace">Workplace</label>
            <input
                    type="text"
                    class="form-control"
                    id="workplace"
                    name="workplace"
                    placeholder="Enter your workplace"
            />
        </div>
        <button type="submit" class="btn btn-primary">Save Changes</button>
    </form>
    <h4 class="text-left mb-3">
        <b>Password settings</b>
    </h4>
    <!-- form thay doi password -->
    <form>
        <div class="form-group">
            <label for="current-password">Current password</label>
            <input
                    type="password"
                    class="form-control"
                    id="current-password"
                    name="current-password"
                    placeholder="Enter your current password"
            />
        </div>
        <div class="form-group">
            <label for="new-password">New password</label>
            <input
                    type="password"
                    class="form-control"
                    id="new-password"
                    name="new-password"
                    placeholder="Enter your new password"
            />
        </div>
        <div class="form-group">
            <label for="confirm-password">Confirm new password</label>
            <input
                    type="password"
                    class="form-control"
                    id="confirm-password"
                    name="confirm-password"
                    placeholder="Confirm your new password"
            />
        </div>
        <button type="submit" class="btn btn-primary">Change Password</button>
    </form>
</div>
</body>
</html>

