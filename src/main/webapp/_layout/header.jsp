<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 12/6/2024
  Time: 4:02 PM
  To change this template use File | Settings | File Templates.
--%>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
    <a class="navbar-brand" href="#">Info Management</a>
    <button
            class="navbar-toggler"
            type="button"
            data-toggle="collapse"
            data-target="#navbarNav"
            aria-controls="navbarNav"
            aria-expanded="false"
            aria-label="Toggle navigation"
    >
        <span class="navbar-toggler-icon"></span>
    </button>

    <!-- Guest navbar -->
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="./login.jsp">Login</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="./signup.jsp">Signup</a>
            </li>
        </ul>
    </div>
    <!-- Logged in navbar -->
    <ul class="navbar-nav ml-auto">
        <li class="nav-item dropdown">
            <a
                    class="nav-link dropdown-toggle"
                    href="#"
                    id="userMenu"
                    role="button"
                    data-toggle="dropdown"
                    aria-haspopup="true"
                    aria-expanded="false"
            >
                Hello, User
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userMenu">
                <a class="dropdown-item" href="profile.html">Profile</a>
                <a class="dropdown-item" href="settings.jsp">Settings</a>
                <a class="dropdown-item" href="admin/index.jsp">Admin</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="logout.html">Logout</a>
            </div>
        </li>
    </ul>
</nav>

