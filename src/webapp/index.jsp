<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Welcome</title>
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
<%@include file="_layout/header.jsp"%>

<!-- Main Content -->
<div class="container mt-5">
    <h1 class="text-center">Welcome to Info Management Service</h1>
    <form class="form-inline justify-content-center mt-4" action="UserController" method="GET">
        <input type="hidden" name="action" value="search"/>
        <input
                class="form-control mr-sm-2"
                type="search"
                name="searchValue"
                placeholder="Search user"
                aria-label="Search"
        />
        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">
            Search
        </button>
    </form>
</div>

<!-- Footer -->
<footer class="footer mt-auto py-3 bg-light">
    <div class="container text-center">
        <span class="text-muted">© 2023 Info Management Service</span>
    </div>
</footer>

<!-- Bootstrap CSS and JS -->
<link
        href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
        rel="stylesheet"
/>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
