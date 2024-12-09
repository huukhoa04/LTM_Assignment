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
      <% 
          UserBean userDetail = (UserBean) request.getAttribute("userDetail");
          if (userDetail != null) {
      %>
      <div class="row">
        <div class="col-md-4 text-center">
          <img
                  src="../assets/img/avatar-guest.png"
                  class="img-fluid rounded-circle shadow-sm mb-3"
                  style="max-width: 200px"
                  alt="Profile Picture"
          />
          <h3 class="text-primary mb-3"><%= userDetail.getUsername() %></h3>
        </div>
        <div class="col-md-8">
          <div class="list-group">
            <div class="list-group-item">
              <i class="fas fa-envelope text-primary"></i>
              <strong>Email:</strong> <%= userDetail.getEmail() %>
            </div>
            <div class="list-group-item">
              <i class="fas fa-briefcase text-primary"></i>
              <strong>Job:</strong> <%= userDetail.getWork() %>
            </div>
            <div class="list-group-item">
              <i class="fas fa-building text-primary"></i>
              <strong>Workplace:</strong> <%= userDetail.getWorkPlace() %>
            </div>
            <div class="list-group-item">
              <i class="fas fa-phone text-primary"></i>
              <strong>Phone:</strong> <%= userDetail.getPhoneNumber() %>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col">
          <h3 class="text-primary mt-5">About Me</h3>
          <p><%= userDetail.getAboutMe() %></p>
        </div>
      </div>
      <div class="container">
        <div class="row mt-3">
          <div class="text-right">
            <a href="AdminController?action=updateuser&userId=<%= userDetail.getUserId() %>" class="btn btn-primary">Update this user</a>
            <button onclick="deleteUser('<%= userDetail.getUserId() %>')" class="btn btn-danger">Delete</button>
            <a href="AdminController?action=listuser" class="btn btn-success">Back to List</a>
          </div>
        </div>
      </div>
      <% } else { %>
          <div class="alert alert-danger">User not found.</div>
      <% } %>
    </div>
  </div>
</div>

<!-- Delete Confirmation Modal -->
<div class="modal fade" id="deleteModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Confirm Delete</h5>
                <button type="button" class="close" data-dismiss="modal">
                    <span>&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Are you sure you want to delete this user?
            </div>
            <div class="modal-footer">
                <form action="AdminController?action=deleteuser" method="post">
                    <input type="hidden" id="deleteUserId" name="selectedUser"/>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-danger">Delete</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    function deleteUser(userId) {
        document.getElementById('deleteUserId').value = userId;
        $('#deleteModal').modal('show');
    }
</script>
</body>
</html>

