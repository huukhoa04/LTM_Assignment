<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 12/6/2024
  Time: 4:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.assignment.model.bean.UserBean" %>
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
    <strong>Search Results</strong>
  </h2>
  <form action="UserController" method="GET" class="row align-items-center mb-4">
    <input type="hidden" name="action" value="search"/>
    <div class="form-group col-md-10 mb-0">
      <input type="text" class="form-control" name="searchValue" 
             value="<%= request.getParameter("searchValue") %>"
             placeholder="Enter username"/>
    </div>
    <button type="submit" class="btn btn-primary col-md-2">
      Search
    </button>
  </form>

  <div class="mt-4">
    <% 
        List<UserBean> searchResults = (List<UserBean>) request.getAttribute("searchResults");
        if (searchResults != null && !searchResults.isEmpty()) {
            for (UserBean searchUser : searchResults) {
    %>
        <div class="card mb-3">
          <div class="card-body row">
            <div class="col-md-9">
              <h5 class="card-title"><%= searchUser.getUsername() %></h5>
              <p class="card-text"><%= searchUser.getAboutMe() != null ? searchUser.getAboutMe() : "No bio available" %></p>
              <p class="card-text">
                <small class="text-muted">
                  <i class="fas fa-briefcase"></i> <%= searchUser.getWork() %> at <%= searchUser.getWorkPlace() %>
                </small>
              </p>
              <a href="UserController?action=viewProfile&userId=<%= searchUser.getUserId() %>" 
                 class="btn btn-primary">View Profile</a>
            </div>
            <div class="col-md-3 d-flex align-items-center justify-content-center">
              <img src="assets/img/avatar-guest.png" 
                   class="img-fluid rounded-circle shadow-sm"
                   style="max-width: 100px"
                   alt="Profile Picture"/>
            </div>
          </div>
        </div>
    <%
            }
        } else {
    %>
        <div class="alert alert-info">
            No results found for your search.
        </div>
    <% } %>
  </div>
</div>
</body>
</html>

