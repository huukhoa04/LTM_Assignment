<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title>My Profile</title>
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet"/>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet"/>
</head>
<body>
<%@include file="_layout/header.jsp"%>
<div class="container mt-5">
  <h2 class="text-center mb-5">
    <strong>My Profile</strong>
  </h2>
  <div class="card shadow">
    <div class="card-body">
      <% 
          UserBean currentUser = (UserBean) session.getAttribute("user");
          if (currentUser != null) {
      %>
      <div class="row">
        <div class="col-md-4 text-center">
          <img
                  src="assets/img/avatar-guest.png"
                  class="img-fluid rounded-circle shadow-sm mb-3"
                  style="max-width: 200px"
                  alt="Profile Picture"
          />
          <h3 class="text-primary mb-3"><%= currentUser.getUsername() %></h3>
        </div>
        <div class="col-md-8">
          <div class="list-group">
            <div class="list-group-item">
              <i class="fas fa-envelope text-primary"></i>
              <strong>Email:</strong> <%= currentUser.getEmail() %>
            </div>
            <div class="list-group-item">
              <i class="fas fa-briefcase text-primary"></i>
              <strong>Job:</strong> <%= currentUser.getWork() %>
            </div>
            <div class="list-group-item">
              <i class="fas fa-building text-primary"></i>
              <strong>Workplace:</strong> <%= currentUser.getWorkPlace() %>
            </div>
            <div class="list-group-item">
              <i class="fas fa-phone text-primary"></i>
              <strong>Phone:</strong> <%= currentUser.getPhoneNumber() %>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col">
          <h3 class="text-primary mt-5">About Me</h3>
          <p><%= currentUser.getAboutMe() %></p>
        </div>
      </div>
      <div class="container">
        <div class="row mt-3">
          <div class="text-right">
            <a href="settings.jsp" class="btn btn-primary">Edit Profile</a>
          </div>
        </div>
      </div>
      <% } else { %>
          <div class="alert alert-danger">Please login to view your profile.</div>
          <a href="login.jsp" class="btn btn-primary">Login</a>
      <% } %>
    </div>
  </div>
</div>
</body>
</html> 