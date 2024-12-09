<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Dashboard</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
    <div class="container mt-5">
        <h1>Admin Dashboard</h1>
        <div class="mt-3">
            <p>Welcome, Admin!</p>
        </div>
        
        <a href="${pageContext.request.contextPath}/login.jsp" class="btn btn-danger">Logout</a>
    </div>
</body>
</html> 