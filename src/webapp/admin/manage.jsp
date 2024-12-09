<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.assignment.model.bean.UserBean" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>Manage Users</title>
    <style>
        body {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            margin: 0;
        }
        .container {
            flex: 1;
        }
    </style>
</head>
<body>
    <%@include file="../_layout/header.jsp"%>

    <!-- Main Content -->
    <div class="container mt-5">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2>User Management</h2>
            <a href="AdminController?action=adduser" class="btn btn-primary">Add New User</a>
        </div>

        <% if (session.getAttribute("success") != null) { %>
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                <%= session.getAttribute("success") %>
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <% session.removeAttribute("success"); %>
        <% } %>
        
        <% if (session.getAttribute("error") != null) { %>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <%= session.getAttribute("error") %>
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <% session.removeAttribute("error"); %>
        <% } %>

        <div class="card">
            <div class="card-body">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>User ID</th>
                            <th>Username</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Work</th>
                            <th>Workplace</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                            List<UserBean> userList = (List<UserBean>) request.getAttribute("userList");
                            if (userList != null) {
                                for (UserBean listUser : userList) {
                        %>
                            <tr>
                                <td><%= listUser.getUserId() %></td>
                                <td><%= listUser.getUsername() %></td>
                                <td><%= listUser.getEmail() %></td>
                                <td><%= listUser.getPhoneNumber() %></td>
                                <td><%= listUser.getWork() %></td>
                                <td><%= listUser.getWorkPlace() %></td>
                                <td>
                                    <a href="AdminController?action=detail&userId=<%= listUser.getUserId() %>" 
                                       class="btn btn-info btn-sm">View</a>
                                    <a href="AdminController?action=updateuser&userId=<%= listUser.getUserId() %>" 
                                       class="btn btn-warning btn-sm">Edit</a>
                                    <button onclick="deleteUser('<%= listUser.getUserId() %>')" 
                                            class="btn btn-danger btn-sm">Delete</button>
                                </td>
                            </tr>
                        <%
                                }
                            }
                        %>
                    </tbody>
                </table>
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

    <!-- Bootstrap CSS and JS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet"/>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
        function deleteUser(userId) {
            document.getElementById('deleteUserId').value = userId;
            $('#deleteModal').modal('show');
        }
    </script>
</body>
</html> 