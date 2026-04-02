<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Vote History</title>
</head>
<body>
<h2>Your Vote History</h2>
<ul>
    <c:forEach var="vote" items="${votes}">
        <li>Poll: ${vote.poll.question} → Option: ${vote.option.optionText}</li>
    </c:forEach>
</ul>
</body>
</html>
