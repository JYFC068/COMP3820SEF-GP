<%--
  Created by IntelliJ IDEA.
  User: stephanie chan
  Date: 4/4/2026
  Time: 17:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<h2>Update Personal Information</h2>
<form action="/profile/update" method="post">
    <div class="form-group">
        <label>Username (Cannot be changed):</label>
        <input type="text" class="form-control" value="${user.username}" readonly>
    </div>

    <div class="form-group">
        <label>Full Name:</label>
        <input type="text" name="fullName" class="form-control" value="${user.fullName}" required>
    </div>

    <div class="form-group">
        <label>Email Address:</label>
        <input type="email" name="email" class="form-control" value="${user.email}" required>
    </div>

    <div class="form-group">
        <label>Phone Number:</label>
        <input type="text" name="phone" class="form-control" value="${user.phone}" required>
    </div>

    <button type="submit" class="btn btn-primary mt-3">Update Information</button>
</form>
