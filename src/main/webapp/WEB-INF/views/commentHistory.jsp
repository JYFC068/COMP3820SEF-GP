<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Comment History</title>
</head>
<body>
<h2>Your Comment History</h2>
<ul>
    <c:forEach var="comment" items="${comments}">
        <li>${comment.user.username} → ${comment.content}
            <c:if test="${comment.lecture != null}">(Lecture: ${comment.lecture.title})</c:if>
            <c:if test="${comment.poll != null}">(Poll: ${comment.poll.question})</c:if>
        </li>
    </c:forEach>
</ul>
</body>
</html>
