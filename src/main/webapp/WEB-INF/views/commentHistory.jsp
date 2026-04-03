<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Comment History</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        ul { list-style: none; padding: 0; }
        li { background: #eee; margin-bottom: 10px; padding: 15px; border-radius: 4px; border-left: 5px solid #007bff; }
        .comment-source { font-size: 0.85em; color: #666; font-style: italic; margin-bottom: 5px; display: block; }
        .comment-text { font-size: 1.05em; color: #333; }
    </style>
</head>
<body>
    <jsp:include page="header.jsp" />
    <h2>Your Comment History</h2>
    <ul>
        <c:forEach var="comment" items="${comments}">
            <li>
                    <span class="comment-source">
                        <c:if test="${comment.lecture != null}">On Lecture: ${comment.lecture.title}</c:if>
                        <c:if test="${comment.poll != null}">On Poll: ${comment.poll.question}</c:if>
                    </span>
                <div class="comment-text">"${comment.content}"</div>
            </li>
        </c:forEach>
    </ul>
</body>
</html>