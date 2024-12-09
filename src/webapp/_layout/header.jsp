<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.assignment.model.bean.AdminBean" %>
<%@ page import="com.assignment.model.bean.UserBean" %>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp">Info Management Service</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <% 
                    AdminBean admin = (AdminBean) session.getAttribute("admin");
                    UserBean user = (UserBean) session.getAttribute("user");
                    
                    if (admin != null) { 
                %>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="adminDropdown" role="button" 
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Admin Menu
                        </a>
                        <div class="dropdown-menu" aria-labelledby="adminDropdown">
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/dashboard.jsp">Dashboard</a>
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/AdminController?action=listuser">Manage Users</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/UserController?action=logout">Logout</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <span class="nav-link">Hello, Admin</span>
                    </li>
                <% } else if (user != null) { %>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" 
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                           Hello, <%= user.getUsername() %>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="userDropdown">
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/UserController?action=profile">Profile</a>
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/UserController?action=settings">Settings</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/UserController?action=logout">Logout</a>
                        </div>
                    </li>
                <% } else { %>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/login.jsp">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/signup.jsp">Sign Up</a>
                    </li>
                <% } %>
            </ul>
        </div>
    </div>
</nav>

