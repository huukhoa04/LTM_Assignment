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
  <title>User detail</title>
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
  <h2 class="text-center mb-5">
    <strong>User details</strong>
  </h2>
  <div class="card shadow">
    <div class="card-body">
      <div class="row">
        <div class="col-md-4 text-center">
          <img
                  src="../assets/img/avatar-guest.png"
                  class="img-fluid rounded-circle shadow-sm mb-3"
                  style="max-width: 200px"
                  alt="Profile Picture"
          />
          <h3 class="text-primary mb-3">Username</h3>
        </div>
        <div class="col-md-8">
          <div class="list-group">
            <div class="list-group-item">
              <i class="fas fa-envelope text-primary"></i>
              <strong>Email:</strong> user@example.com
            </div>
            <div class="list-group-item">
              <i class="fas fa-briefcase text-primary"></i>
              <strong>Job:</strong> Software Developer
            </div>
            <div class="list-group-item">
              <i class="fas fa-building text-primary"></i>
              <strong>Workplace:</strong> Tech Company
            </div>
            <div class="list-group-item">
              <i class="fas fa-map-marker-alt text-primary"></i>
              <strong>Address:</strong> 123 Main St, City, Country
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col">
          <h3 class="text-primary mt-5">About Me</h3>
          <p>
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed
            vitae nunc nec nunc ultricies fermentum. Nullam nec nunc
            ultricies, fermentum nunc nec, fermentum nunc. Nullam nec nunc
            ultricies, fermentum nunc nec, fermentum nunc.
          </p>
        </div>
      </div>
      <div class="container">
        <div class="row mt-3">
          <div class="text-right">
            <a href="#" class="btn btn-primary">Update this user</a>
            <a href="#" class="btn btn-danger">Delete</a>
            <a href="#" class="btn btn-success">Back to Homepage</a>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>

