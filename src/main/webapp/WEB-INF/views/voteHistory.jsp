<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>Vote History</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        ul { list-style: none; padding: 0; }
        li { background: #fdfdfd; margin-bottom: 12px; padding: 15px; border-radius: 8px;
            display: flex; justify-content: space-between; align-items: center;
            border: 1px solid #eee; box-shadow: 0 2px 4px rgba(0,0,0,0.02); }
        .vote-detail { display: flex; flex-direction: column; }
        .vote-time { font-size: 0.8em; color: #777; margin-top: 5px; }
        .tag-option { background: #007bff; color: white; padding: 2px 10px; border-radius: 12px; font-size: 0.85em; }

        .user-badge {
            background-color: #e7f3ff;
            color: #007bff;
            padding: 2px 8px;
            border-radius: 4px;
            font-weight: 600;
            font-size: 0.9em;
            margin-bottom: 5px;
            display: inline-block;
        }
    </style>
</head>
<body>
    <jsp:include page="header.jsp" />
    <h2>Vote History</h2> <ul>
        <c:forEach var="vote" items="${votes}">
            <li>
                <div class="vote-detail">
                    <span class="user-badge">👤 ${vote.user.username}</span>
                    <strong>${vote.pollOption.poll.question}</strong>
                    <span class="vote-time">Voted on: <fmt:formatDate value="${vote.timestamp}" pattern="yyyy-MM-dd HH:mm" /></span>
                </div>
                <span class="tag-option">${vote.pollOption.optionText}</span>
            </li>
        </c:forEach>
    </ul>
</body>
</html>