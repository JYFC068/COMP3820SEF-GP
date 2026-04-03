<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Admin - Manage Users</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        .form-container { border: 1px solid #ccc; padding: 20px; border-radius: 8px; max-width: 500px; background-color: #f9f9f9; margin-bottom: 20px; }
        .form-group { margin-bottom: 15px; }
        .form-group label { display: block; font-weight: bold; margin-bottom: 5px; }
        .form-group input, .form-group select { width: 100%; padding: 8px; box-sizing: border-box; }
        button { padding: 10px 20px; cursor: pointer; border: none; border-radius: 4px; color: white; }
        .btn-save { background-color: #007bff; }
        .btn-edit { background-color: #ffc107; color: black; margin-right: 5px; }
        .btn-delete { background-color: #dc3545; }
        ul { list-style: none; padding: 0; }
        li { background: #eee; margin-bottom: 10px; padding: 15px; border-radius: 4px; display: flex; justify-content: space-between; align-items: center; }
    </style>
</head>
<body>
    <jsp:include page="header.jsp" />

    <h2>User Management</h2>

    <div class="form-container">
        <h3 id="form-title">Add / Update User</h3>
        <form id="userForm" action="/admin/update" method="post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <input type="hidden" name="id" id="edit-id">

            <div class="form-group">
                <label>Username:</label>
                <input type="text" name="username" id="edit-username" required>
            </div>

            <div class="form-group">
                <label>Full Name:</label>
                <input type="text" name="fullName" id="edit-fullName" required>
            </div>

            <div class="form-group">
                <label>Email:</label>
                <input type="email" name="email" id="edit-email" required>
            </div>

            <div class="form-group">
                <label>Password:</label>
                <input type="password" name="password" id="edit-password" placeholder="Leave blank if updating">
            </div>

            <div class="form-group">
                <label>Role:</label>
                <select name="role" id="edit-role">
                    <option value="STUDENT">Student</option>
                    <option value="TEACHER">Teacher</option>
                </select>
            </div>

            <button type="submit" class="btn-save" id="save-btn">Save User</button>
            <button type="button" onclick="resetForm()" style="background: #6c757d;">Reset</button>
        </form>
    </div>

    <hr>

    <h3>Registered Users</h3>
    <ul>
        <c:forEach var="u" items="${users}">
            <li>
                <div>
                    <strong>${u.username}</strong> — (${u.role})<br>
                    <small>Name: ${u.fullName} | Email: ${u.email}</small>
                </div>
                <div style="display: flex;">
                    <button type="button" class="btn-edit"
                            onclick="fillEditForm('${u.id}', '${u.username}', '${u.fullName}', '${u.email}', '${u.role}')">
                        Edit
                    </button>

                    <form action="/admin/delete/${u.id}" method="post" style="margin: 0;">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <button type="submit" class="btn-delete" onclick="return confirm('Are you sure?')">Delete</button>
                    </form>
                </div>
            </li>
        </c:forEach>
    </ul>

    <script>
        function fillEditForm(id, username, fullName, email, role) {
            document.getElementById('form-title').innerText = "Update User: " + username;
            document.getElementById('save-btn').innerText = "Update User";
            document.getElementById('edit-id').value = id;
            document.getElementById('edit-username').value = username;
            document.getElementById('edit-fullName').value = fullName;
            document.getElementById('edit-email').value = email;
            document.getElementById('edit-role').value = role;
            document.getElementById('edit-password').required = false;
            window.scrollTo(0, 0);
        }

        function resetForm() {
            document.getElementById('form-title').innerText = "Add / Update User";
            document.getElementById('save-btn').innerText = "Save User";
            document.getElementById('edit-id').value = "";
            document.getElementById('userForm').reset();
            document.getElementById('edit-password').required = true;
        }
    </script>
</body>
</html>