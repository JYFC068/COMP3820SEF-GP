<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Online Course Portal</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        h2 { border-bottom: 2px solid #007bff; padding-bottom: 5px; margin-top: 30px; }
        ul { list-style: none; padding: 0; }
        li { background: #eee; margin-bottom: 10px; padding: 15px; border-radius: 4px; display: flex; justify-content: space-between; align-items: center; }
        .item-info { display: flex; flex-direction: column; }
        .item-summary { font-size: 0.9em; color: #555; margin-top: 4px; }
        .btn-action { padding: 8px 15px; background-color: #007bff; color: white; text-decoration: none; border-radius: 4px; font-size: 0.9em; }
        .btn-action:hover { background-color: #0056b3; }
    </style>
</head>
<body>
    <jsp:include page="header.jsp" />

    <h1>Web Application Development</h1>
    <h3>This course aims to enable students to develop web applications based on the three-tier architecture. </h3>

        <h2>Lectures</h2>
    <ul>
        <c:forEach var="lecture" items="${lectures}">
            <li>
                <div class="item-info">
                    <strong>${lecture.title}</strong>
                    <span class="item-summary">${lecture.summary}</span>
                </div>
                <a href="/lecture/${lecture.id}" class="btn-action">View & Download</a>
            </li>
        </c:forEach>
    </ul>

    <h2>Available Polls</h2>
    <ul>
        <c:forEach var="poll" items="${polls}">
            <li>
                <div class="item-info">
                    <strong>Question: ${poll.question}</strong>
                </div>
                <a href="/poll/${poll.id}" class="btn-action">Vote Now</a>
            </li>
        </c:forEach>
    </ul>
</body>
</html>