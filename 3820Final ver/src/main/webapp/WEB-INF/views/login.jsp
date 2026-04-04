<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Login</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        .form-container { border: 1px solid #ccc; padding: 20px; border-radius: 8px; max-width: 400px; background-color: #f9f9f9; margin: 50px auto; }
        .form-group { margin-bottom: 15px; }
        .form-group label { display: block; font-weight: bold; margin-bottom: 5px; }
        .form-group input { width: 100%; padding: 10px; box-sizing: border-box; border: 1px solid #ccc; border-radius: 4px; }
        button { width: 100%; padding: 10px; cursor: pointer; background-color: #007bff; color: white; border: none; border-radius: 4px; font-size: 1em; }
        button:hover { background-color: #0056b3; }
        .link-footer { text-align: center; margin-top: 15px; font-size: 0.9em; }
    </style>
</head>
<body>
    <jsp:include page="header.jsp" />

    <div class="form-container">
        <h2 style="text-align: center;">Login</h2>
        <form action="/login" method="post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <div class="form-group">
                <label>Username</label>
                <input type="text" name="username" required>
            </div>
            <div class="form-group">
                <label>Password</label>
                <input type="password" name="password" required>
            </div>
            <button type="submit">Login</button>
        </form>
        <div class="link-footer">
            Don't have an account? <a href="/register">Register here</a>
        </div>
    </div>
</body>
</html>