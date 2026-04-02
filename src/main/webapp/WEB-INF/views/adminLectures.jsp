<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Admin - Lectures</title>
</head>
<body>
<h2>Manage Lectures</h2>
<form action="/admin/lectures/add" method="post">
    <input type="text" name="title" placeholder="Title" required>
    <input type="text" name="summary" placeholder="Summary" required>
    <input type="text" name="filePath" placeholder="File Path" required>
    <button type="submit">Add Lecture</button>
</form>

<ul>
    <c:forEach var="lecture" items="${lectures}">
        <li>${lecture.title}
            <form action="/admin/lectures/delete/${lecture.id}" method="post" style="display:inline;">
                <button type="submit">Delete</button>
            </form>
        </li>
    </c:forEach>
</ul>
</body>
</html>
