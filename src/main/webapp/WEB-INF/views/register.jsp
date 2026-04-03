<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Register</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        .form-container { border: 1px solid #ccc; padding: 25px; border-radius: 8px; max-width: 450px; background-color: #f9f9f9; margin: 20px auto; }
        .form-group { margin-bottom: 15px; }
        .form-group label { display: block; font-weight: bold; margin-bottom: 5px; }
        .form-group input, .form-group select { width: 100%; padding: 8px; box-sizing: border-box; border: 1px solid #ccc; border-radius: 4px; }
        button { width: 100%; padding: 12px; cursor: pointer; background-color: #28a745; color: white; border: none; border-radius: 4px; font-size: 1em; }
        button:hover { background-color: #218838; }
    </style>
</head>
<body>
    <jsp:include page="header.jsp" />

    <div class="form-container">
        <h2 style="text-align: center;">Create Account</h2>
        <form action="/register" method="post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <div class="form-group">
                <label>Username</label>
                <input type="text" name="username" required>
            </div>
            <div class="form-group">
                <label>Password</label>
                <input type="password" name="password" required>
            </div>
            <div class="form-group">
                <label>Full Name</label>
                <input type="text" name="fullName" required>
            </div>
            <div class="form-group">
                <label>Email</label>
                <input type="email" name="email" required>
            </div>
            <div class="form-group">
                <label>Phone</label>
                <input type="text" name="phone" required>
            </div>
            <div class="form-group">
                <label>Role</label>
                <select name="role">
                    <option value="STUDENT">Student</option>
                    <option value="TEACHER">Teacher</option>
                </select>
            </div>
            <button type="submit">Registration</button>
        </form>
    </div>
</body>
</html>