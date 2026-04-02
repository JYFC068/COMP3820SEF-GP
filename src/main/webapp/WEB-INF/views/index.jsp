<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Online Course Portal</title>
</head>
<body>
    <h1>Welcome to Online Course Website</h1>

    <h2>Lectures</h2>
    <ul>
        <c:forEach var="lecture" items="${lectures}">
            <li>
                <strong>${lecture.title}</strong> - ${lecture.summary}
                <a href="${lecture.filePath}">Download</a>
            </li>
        </c:forEach>
    </ul>


    <h2>Poll: ${poll.question}</h2>
    <form action="/vote" method="post">
        <c:forEach var="option" items="${pollOptions}">
            <div>
                <input type="radio" name="optionId" value="${option.id}" />
                ${option.optionText}
            </div>
        </c:forEach>
        <button type="submit">Submit Vote</button>
    </form>
</body>
</html>

