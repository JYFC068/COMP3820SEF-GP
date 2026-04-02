<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Admin - Users</title>
</head>
<body>
<h2>Manage Users</h2>
<ul>
    <c:forEach var="user" items="${users}">
        <li>${user.username} (${user.role})
            <form action="/admin/users/delete/${user.id}" method="post" style="display:inline;">
                <button type="submit">Delete</button>
            </form>
        </li>
    </c:forEach>
</ul>
</body>
</html>
