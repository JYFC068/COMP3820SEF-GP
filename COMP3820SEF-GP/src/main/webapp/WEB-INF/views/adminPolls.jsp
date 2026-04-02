<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Admin - Polls</title>
</head>
<body>
<h2>Manage Polls</h2>
<form action="/admin/polls/add" method="post">
    <input type="text" name="question" placeholder="Poll Question" required>
    <button type="submit">Add Poll</button>
</form>

<ul>
    <c:forEach var="poll" items="${polls}">
        <li>${poll.question}
            <form action="/admin/polls/delete/${poll.id}" method="post" style="display:inline;">
                <button type="submit">Delete</button>
            </form>
        </li>
    </c:forEach>
</ul>
</body>
</html>
