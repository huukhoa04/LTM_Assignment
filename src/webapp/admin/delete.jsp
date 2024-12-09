<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 12/6/2024
  Time: 4:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.assignment.model.bean.UserBean" %>

<html>
<head>
  <title>Delete Users</title>
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet"/>
  <script>
    function toggleAllCheckboxes(source) {
      var checkboxes = document.getElementsByName('selectedUser');
      for(var i=0; i<checkboxes.length; i++) {
        checkboxes[i].checked = source.checked;
      }
    }
    
    function validateForm() {
      var checkboxes = document.getElementsByName('selectedUser');
      var checked = false;
      for(var i=0; i<checkboxes.length; i++) {
        if(checkboxes[i].checked) {
          checked = true;
          break;
        }
      }
      if(!checked) {
        alert('Please select at least one user to delete');
        return false;
      }
      if(confirm('Are you sure you want to delete the selected users?')) {
        document.getElementById('deleteForm').submit();
        return true;
      }
      return false;
    }
  </script>
</head>
<body>
<%@include file="../_layout/header.jsp"%>
<div class="container mt-5">
  <h2>Delete Users</h2>
  <form id="deleteForm" action="${pageContext.request.contextPath}/AdminController" method="post" onsubmit="return validateForm()">
    <input type="hidden" name="action" value="deleteuser"/>
    <div class="card">
      <div class="card-body">
        <table class="table table-striped">
          <thead>
            <tr>
              <th>
                <input type="checkbox" onclick="toggleAllCheckboxes(this)" />
              </th>
              <th>User ID</th>
              <th>Username</th>
              <th>Email</th>
              <th>Phone</th>
              <th>Work</th>
            </tr>
          </thead>
          <tbody>
            <% 
              List<UserBean> userList = (List<UserBean>) request.getAttribute("userList");
              if (userList != null && !userList.isEmpty()) {
                for (UserBean user : userList) {
            %>
              <tr>
                <td>
                  <input type="checkbox" name="selectedUser" value="<%= user.getUserId() %>" />
                </td>
                <td><%= user.getUserId() %></td>
                <td><%= user.getUsername() %></td>
                <td><%= user.getEmail() %></td>
                <td><%= user.getPhoneNumber() %></td>
                <td><%= user.getWork() %></td>
              </tr>
            <%
                }
              } else {
            %>
              <tr>
                <td colspan="6" class="text-center">No users found</td>
              </tr>
            <% } %>
          </tbody>
        </table>
      </div>
    </div>
    
    <div class="mt-3">
      <button type="submit" class="btn btn-danger" <%= userList == null || userList.isEmpty() ? "disabled" : "" %>>
        Delete Selected Users
      </button>
      <a href="AdminController?action=listuser" class="btn btn-secondary">Back to List</a>
    </div>
  </form>
</div>
</body>
</html>

