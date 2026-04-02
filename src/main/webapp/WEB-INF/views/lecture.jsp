<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>${lecture.title}</title>
</head>
<body>
<h2>${lecture.title}</h2>
<p>${lecture.summary}</p>
<a href="${lecture.filePath}">Download Lecture File</a>

<h3>Comments</h3>
<ul>
    <c:forEach var="comment" items="${comments}">
        <li>${comment.user.username}: ${comment.content}</li>
    </c:forEach>
</ul>

<form action="/lecture/${lecture.id}/comment" method="post">
    <textarea name="content" required></textarea><br>
    <button type="submit">Add Comment</button>
</form>
</body>
</html>
