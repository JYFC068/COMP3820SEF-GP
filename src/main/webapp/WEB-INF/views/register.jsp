<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Register</title>
</head>
<body>
<h2>Register</h2>
<form action="/register" method="post">
    <label>Username:</label>
    <input type="text" name="username" required><br>

    <label>Password:</label>
    <input type="password" name="password" required><br>

    <label>Full Name:</label>
    <input type="text" name="fullName" required><br>

    <label>Email:</label>
    <input type="email" name="email" required><br>

    <label>Phone:</label>
    <input type="text" name="phone" required><br>

    <label>Role:</label>
    <select name="role">
        <option value="STUDENT">Student</option>
        <option value="TEACHER">Teacher</option>
    </select><br>

    <button type="submit">Register</button>
</form>
</body>
</html>
