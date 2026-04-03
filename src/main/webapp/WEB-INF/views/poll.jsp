<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Poll Details - ${poll.question}</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; line-height: 1.6; }
        .poll-container { padding: 20px; border: 1px solid #ddd; border-radius: 8px; background: #f9f9f9; }
        .comment-section { margin-top: 30px; }
        .comment-item {
            background: #eee; padding: 12px; margin-bottom: 10px; border-radius: 5px;
            display: flex; justify-content: space-between; align-items: center;
        }
        .delete-btn { background-color: #dc3545; color: white; border: none; padding: 5px 10px; border-radius: 4px; cursor: pointer; }
        .delete-btn:hover { background-color: #c82333; }
        textarea { width: 100%; margin-top: 10px; border-radius: 4px; border: 1px solid #ccc; padding: 10px; }
        .submit-btn { background-color: #007bff; color: white; border: none; padding: 10px 20px; border-radius: 4px; cursor: pointer; margin-top: 5px; }
    </style>
</head>
<body>
    <jsp:include page="header.jsp" />

    <div class="poll-container">
        <h2>${poll.question}</h2>
        <form action="/poll/${poll.id}/vote" method="post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <ul>
                <c:forEach var="option" items="${poll.options}">
                    <li>
                        <label>
                            <input type="radio" name="optionId" value="${option.id}"
                                   <c:if test="${userCurrentVote != null && userCurrentVote.pollOption.id == option.id}">checked</c:if> required>
                                ${option.optionText} — <strong>(${option.voteCount} votes)</strong>
                        </label>
                    </li>
                </c:forEach>
            </ul>
            <sec:authorize access="isAuthenticated()">
                <button type="submit" class="submit-btn">Submit / Update My Vote</button>
            </sec:authorize>
        </form>
    </div>

    <div class="comment-section">
        <h3>Comments</h3>
        <ul>
            <c:forEach var="comment" items="${comments}">
                <li class="comment-item">
                    <div>
                        <strong>${comment.user.username}:</strong> ${comment.content}
                    </div>

                    <sec:authorize access="hasRole('TEACHER')">
                        <form action="/admin/comments/delete/${comment.id}" method="post" style="margin: 0;">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <input type="hidden" name="redirectPath" value="/poll/${poll.id}"/>
                            <button type="submit" class="delete-btn" onclick="return confirm('Delete this comment?')">Delete</button>
                        </form>
                    </sec:authorize>
                </li>
            </c:forEach>
        </ul>

        <sec:authorize access="isAuthenticated()">
            <form action="/poll/${poll.id}/comment" method="post">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <textarea name="content" rows="3" required placeholder="Discuss this poll..."></textarea><br>
                <button type="submit" class="submit-btn">Add Comment</button>
            </form>
        </sec:authorize>
    </div>
</body>
</html>