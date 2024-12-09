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
  <% 
      UserBean userToUpdate = (UserBean) request.getAttribute("user");
      if (userToUpdate != null) {
  %>
  <form action="AdminController?action=updateuser" method="post" class="mb-3">
    <input type="hidden" name="UserId" value="<%= userToUpdate.getUserId() %>"/>
    <div class="form-group">
      <label for="username">Username:</label>
      <input type="text" class="form-control" id="username" name="Username" 
             value="<%= userToUpdate.getUsername() %>" required/>
    </div>
    <div class="form-group">
      <label for="email">Email:</label>
      <input type="email" class="form-control" id="email" name="Email" 
             value="<%= userToUpdate.getEmail() %>" required/>
    </div>
    <div class="form-group">
      <label for="job">Job:</label>
      <input type="text" class="form-control" id="job" name="Work" 
             value="<%= userToUpdate.getWork() %>" required/>
    </div>
    <div class="form-group">
      <label for="workplace">Workplace:</label>
      <input type="text" class="form-control" id="workplace" name="WorkPlace" 
             value="<%= userToUpdate.getWorkPlace() %>" required/>
    </div>
    <div class="form-group">
      <label for="about-me">About Me:</label>
      <textarea class="form-control" id="about-me" name="AboutMe" rows="3"><%= userToUpdate.getAboutMe() %></textarea>
    </div>
    <div class="form-group">
      <label for="phone">Phone:</label>
      <input type="text" class="form-control" id="phone" name="PhoneNumber" 
             value="<%= userToUpdate.getPhoneNumber() %>" required/>
    </div>
    <div class="mt-3">
      <button type="submit" class="btn btn-primary">Update User</button>
      <a href="AdminController?action=listuser" class="btn btn-secondary">Cancel</a>
    </div>
  </form>
  <% } else { %>
    <div class="alert alert-danger">User not found.</div>
    <a href="AdminController?action=listuser" class="btn btn-primary">Back to List</a>
  <% } %>
</div>
</body>
</html>

