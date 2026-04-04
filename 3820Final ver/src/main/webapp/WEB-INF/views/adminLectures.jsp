<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Admin - Manage Lectures</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        .form-container { border: 1px solid #ccc; padding: 20px; border-radius: 8px; max-width: 500px; background-color: #f9f9f9; }
        .form-group { margin-bottom: 15px; }
        .form-group label { display: block; font-weight: bold; margin-bottom: 5px; }
        .form-group input, .form-group textarea { width: 100%; padding: 8px; box-sizing: border-box; }
        .form-group textarea { resize: vertical; }
        button { padding: 10px 20px; cursor: pointer; background-color: #007bff; color: white; border: none; border-radius: 4px; }
        button:hover { background-color: #0056b3; }
        ul { list-style: none; padding: 0; }
        li { background: #eee; margin-bottom: 10px; padding: 10px; border-radius: 4px; display: flex; justify-content: space-between; align-items: center; }
        .delete-btn { background-color: #dc3545; padding: 6px 12px; }
        .delete-btn:hover { background-color: #c82333; }
        .lecture-info { display: flex; flex-direction: column; }
        .lecture-summary { font-size: 0.9em; color: #555; margin-top: 4px; }
    </style>
</head>
<body>
<jsp:include page="header.jsp" />

<h2>Admin Dashboard - Lecture Management</h2>

<div class="form-container">
    <h3>Upload New Material</h3>
    <form action="/admin/lectures/add" method="post" enctype="multipart/form-data">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

        <div class="form-group">
            <label>Lecture Title:</label>
            <input type="text" name="title" placeholder="e.g., Chapter 1: Introduction" required>
        </div>

        <div class="form-group">
            <label>Summary:</label>
            <textarea name="summary" rows="3" placeholder="Brief description of the material..."></textarea>
        </div>

        <div class="form-group">
            <label>Upload File:</label>
            <input type="file" name="file" required style="padding: 3px;">
        </div>

        <button type="submit">Upload Material</button>
    </form>
</div>

<hr>

<h3>Course Materials</h3>
<ul>
    <c:forEach var="l" items="${lectures}">
        <li>
            <div class="lecture-info">
                <strong>${l.title}</strong>
                <span class="lecture-summary">${l.summary}</span>
            </div>
            <form action="/admin/lectures/delete/${l.id}" method="post" style="margin: 0; display: flex; align-items: center;">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <button type="submit" class="delete-btn" onclick="return confirm('Are you sure you want to delete this material?')">Delete</button>
            </form>
        </li>
    </c:forEach>
</ul>

<p><a href="/">Back to Home</a></p>
</body>
</html>