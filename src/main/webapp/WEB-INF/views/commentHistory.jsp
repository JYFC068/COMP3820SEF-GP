<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Comment History</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        ul { list-style: none; padding: 0; }
        li { background: #f9f9f9; margin-bottom: 15px; padding: 15px; border-radius: 8px;
            border-left: 5px solid #007bff; box-shadow: 0 2px 5px rgba(0,0,0,0.05); }
        .comment-header { display: flex; align-items: center; gap: 10px; margin-bottom: 8px; }
        .comment-source { font-size: 0.85em; color: #666; font-style: italic; }
        .comment-text { font-size: 1.05em; color: #333; padding-left: 5px; }

        .user-badge {
            background-color: #e7f3ff;
            color: #007bff;
            padding: 2px 8px;
            border-radius: 4px;
            font-weight: 600;
            font-size: 0.85em;
        }
    </style>
</head>
<body>
    <jsp:include page="header.jsp" />
    <h2>Comment History</h2> <ul>
        <c:forEach var="comment" items="${comments}">
            <li>
                <div class="comment-header">
                    <span class="user-badge">👤 ${comment.user.username}</span>
                    <span class="comment-source">
                            <c:if test="${comment.lecture != null}">On Lecture: ${comment.lecture.title}</c:if>
                            <c:if test="${comment.poll != null}">On Poll: ${comment.poll.question}</c:if>
                        </span>
                </div>
                <div class="comment-text">"${comment.content}"</div>
            </li>
        </c:forEach>
    </ul>
</body>
</html>