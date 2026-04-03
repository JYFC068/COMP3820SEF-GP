<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>My Vote History</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        ul { list-style: none; padding: 0; }
        li { background: #eee; margin-bottom: 10px; padding: 15px; border-radius: 4px; display: flex; justify-content: space-between; align-items: center; }
        .vote-detail { display: flex; flex-direction: column; }
        .vote-time { font-size: 0.8em; color: #777; margin-top: 5px; }
        .tag-option { background: #007bff; color: white; padding: 2px 8px; border-radius: 12px; font-size: 0.85em; }
    </style>
</head>
<body>
    <jsp:include page="header.jsp" />
    <h2>Your Vote History</h2>
    <ul>
        <c:forEach var="vote" items="${votes}">
            <li>
                <div class="vote-detail">
                    <strong>${vote.pollOption.poll.question}</strong>
                    <span class="vote-time">Voted on: <fmt:formatDate value="${vote.timestamp}" pattern="yyyy-MM-dd HH:mm" /></span>
                </div>
                <span class="tag-option">${vote.pollOption.optionText}</span>
            </li>
        </c:forEach>
    </ul>
</body>
</html>