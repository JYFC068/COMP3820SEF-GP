<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>${lecture.title}</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        .lecture-header { background: #f4f4f4; padding: 20px; border-radius: 8px; margin-bottom: 20px; }
        .download-box { margin: 20px 0; }
        .download-btn { background-color: #28a745; color: white; padding: 10px 20px; text-decoration: none; border-radius: 4px; }
        .form-container { border: 1px solid #ccc; padding: 20px; border-radius: 8px; background-color: #f9f9f9; margin-top: 20px; }
        textarea { width: 100%; padding: 8px; box-sizing: border-box; resize: vertical; margin-bottom: 10px; }
        button { padding: 10px 20px; cursor: pointer; background-color: #007bff; color: white; border: none; border-radius: 4px; }
        .delete-btn { background-color: #dc3545; color: white; border: none; padding: 5px 10px; border-radius: 4px; cursor: pointer; }
        .delete-btn:hover { background-color: #c82333; }
        ul { list-style: none; padding: 0; }
        li { background: #eee; margin-bottom: 8px; padding: 12px; border-radius: 4px; }
        .comment-user { font-weight: bold; color: #007bff; }
        .comment-item {
            background: #eee; padding: 12px; margin-bottom: 10px; border-radius: 5px;
            display: flex; justify-content: space-between; align-items: center;
        }
    </style>
</head>
<body>
    <jsp:include page="header.jsp" />

    <div class="lecture-header">
        <h2>${lecture.title}</h2>
        <p>${lecture.summary}</p>
        <div class="download-box">
            <a href="/download/lecture/${lecture.id}" class="download-btn" target="_blank">📥 Download Material (${lecture.fileName})</a>
        </div>
    </div>

    <hr>
    <h3>Discussion</h3>
    <ul>
        <c:forEach var="comment" items="${comments}">
            <li class="comment-item">
                <div>
                    <span class="comment-user">${comment.user.username}:</span>
                    <span>${comment.content}</span>
                </div>

                <sec:authorize access="hasRole('TEACHER')">
                    <form action="/admin/comments/delete/${comment.id}" method="post" style="margin: 0;">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <input type="hidden" name="redirectPath" value="/lecture/${lecture.id}"/>
                        <button type="submit" class="delete-btn" onclick="return confirm('Are you sure?')">Delete</button>
                    </form>
                </sec:authorize>
            </li>
        </c:forEach>
    </ul>

    <sec:authorize access="isAuthenticated()">
        <div class="form-container">
            <h4>Leave a Comment</h4>
            <form action="/lecture/${lecture.id}/comment" method="post">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <textarea name="content" rows="3" required placeholder="What do you think about this lecture?"></textarea>
                <button type="submit" class="submit-btn">Post Comment</button>
            </form>
        </div>
    </sec:authorize>

    <p><a href="/">Back to Home</a></p>
</body>
</html>