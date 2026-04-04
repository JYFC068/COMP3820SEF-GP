<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Admin - Manage Polls</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        .poll-form { border: 1px solid #ccc; padding: 20px; border-radius: 8px; max-width: 500px; background-color: #f9f9f9; }
        .form-group { margin-bottom: 15px; }
        .form-group label { display: block; font-weight: bold; margin-bottom: 5px; }
        .form-group input { width: 100%; padding: 8px; box-sizing: border-box; }
        .option-input { margin-bottom: 5px; }
        button { padding: 10px 20px; cursor: pointer; background-color: #007bff; color: white; border: none; border-radius: 4px; }
        button:hover { background-color: #0056b3; }
        ul { list-style: none; padding: 0; }
        li { background: #eee; margin-bottom: 10px; padding: 10px; border-radius: 4px; display: flex; justify-content: space-between; }
        .delete-btn { background-color: #dc3545; }
    </style>
</head>
<body>
    <jsp:include page="header.jsp" />

    <h2>Admin Dashboard - Poll Management</h2>

    <div class="poll-form">
        <h3>Add New Poll (Exactly 5 Options)</h3>
        <form action="/admin/polls/add" method="post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <div class="form-group">
                <label>Poll Question:</label>
                <input type="text" name="question" placeholder="e.g., What is your favorite color?" required>
            </div>

            <div class="form-group">
                <label>Options (Please fill in all 5):</label>
                <input type="text" name="options" class="option-input" placeholder="Option 1" required>
                <input type="text" name="options" class="option-input" placeholder="Option 2" required>
                <input type="text" name="options" class="option-input" placeholder="Option 3" required>
                <input type="text" name="options" class="option-input" placeholder="Option 4" required>
                <input type="text" name="options" class="option-input" placeholder="Option 5" required>
            </div>

            <button type="submit">Create Poll</button>
        </form>
    </div>

    <hr>

    <h3>Current Polls</h3>
    <ul>
        <c:forEach var="poll" items="${polls}">
            <li>
                <span><strong>${poll.question}</strong></span>
                <form action="/admin/polls/delete/${poll.id}" method="post" style="margin: 0;">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <button type="submit" class="delete-btn" onclick="return confirm('Are you sure?')">Delete</button>
                </form>
            </li>
        </c:forEach>
    </ul>

    <p><a href="/">Back to Home</a></p>
</body>
</html>