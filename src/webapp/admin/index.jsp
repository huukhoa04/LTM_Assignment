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
  <title>Admin Landing</title>
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

<!-- main -->
<div class="container mt-5 pt-5">
  <h1 class="mb-4">User Management</h1>
  <table class="table table-bordered">
    <thead>
    <tr>
      <th>UserID</th>
      <th>Username</th>
      <th>Email</th>
      <th>More</th>
    </tr>
    </thead>
    <tbody>
    <tr>
      <td>1</td>
      <td>JohnDoe</td>
      <td>john@example.com</td>
      <td>
        <button class="btn btn-info btn-sm">Detail</button>
        <button class="btn btn-warning btn-sm">Update</button>
      </td>
    </tr>
    <tr>
      <td>2</td>
      <td>JaneDoe</td>
      <td>jane@example.com</td>
      <td>
        <button class="btn btn-info btn-sm">Detail</button>
        <button class="btn btn-warning btn-sm">Update</button>
      </td>
    </tr>
    </tbody>
  </table>
  <div class="mt-3">
    <button class="btn btn-success">Create new user</button>
    <button class="btn btn-danger">Delete users</button>
  </div>
</div>
</body>
</html>

