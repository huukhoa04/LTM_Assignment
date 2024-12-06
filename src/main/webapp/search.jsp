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
  <title>Search</title>
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

<div class="container mt-5">
  <h2 class="text-center">
    <strong>User</strong>
  </h2>
  <form id="searchForm" class="row align-items-center">
    <div class="form-group col-md-10 mb-0">
      <input
              type="text"
              class="form-control"
              id="searchInput"
              placeholder="Enter username"
              style="height: 100%"
      />
    </div>
    <button
            type="submit"
            class="btn btn-primary col-md-2"
            style="height: 100%"
    >
      Search
    </button>
  </form>
  <!-- case: no result -->
  <div class="mt-4">
    <h3>Search Result</h3>
    <p id="userDetail">No result.</p>
  </div>
  <!-- case: no result -->

  <!-- case: search -->
  <div class="mt-4">
    <h3>Search Result</h3>
    <div class="card">
      <div class="card-body row">
        <div class="col-md-9">
          <h5 class="card-title">Username</h5>
          <p class="card-text">User's bio</p>
          <a href="user/detail.html" class="btn btn-primary"
          >View Profile</a
          >
        </div>
        <div
                class="col-md-3 d-flex align-items-center justify-content-center"
        >
          <img
                  src="../assets/img/GcvF9MHbcAA8jvb.jpg"
                  class="img-fluid rounded-circle shadow-sm"
                  style="max-width: 100px"
                  alt="Profile Picture"
          />
        </div>
      </div>
    </div>
  </div>
  <!-- case: search -->
</div>
</body>
</html>

