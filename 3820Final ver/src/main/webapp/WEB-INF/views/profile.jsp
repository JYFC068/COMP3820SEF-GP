<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>My Profile - Account Settings</title>
    <style>
        body { font-family: 'Segoe UI', Arial, sans-serif; margin: 20px; background-color: #f8f9fa; color: #333; }
        .container { max-width: 550px; margin: 50px auto; }

        .profile-card {
            border: 1px solid #ddd; padding: 30px; border-radius: 12px;
            background-color: #ffffff; box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }
        h2 { text-align: center; color: #007bff; margin-bottom: 25px; }

        .form-group { margin-bottom: 18px; }
        .form-group label { display: block; font-weight: 600; margin-bottom: 8px; color: #495057; }
        .form-group input {
            width: 100%; padding: 12px; border: 1px solid #ced4da; border-radius: 6px;
            box-sizing: border-box; font-size: 14px;
        }
        .form-group input[readonly] { background-color: #e9ecef; cursor: not-allowed; }

        .btn-update {
            background-color: #007bff; color: white; border: none; padding: 12px;
            border-radius: 6px; cursor: pointer; font-weight: bold; width: 100%; font-size: 16px;
            transition: background 0.2s; margin-top: 10px;
        }
        .btn-update:hover { background-color: #0056b3; }

        .alert-success {
            background-color: #d4edda; color: #155724; padding: 12px;
            border-radius: 6px; margin-bottom: 20px; border: 1px solid #c3e6cb; text-align: center;
        }
        .hint { font-size: 12px; color: #6c757d; margin-top: 4px; }
    </style>
</head>
<body>
<jsp:include page="header.jsp" />

<div class="container">
    <div class="profile-card">
        <h2>Account Settings</h2>

        <c:if test="${param.success != null}">
            <div class="alert-success">
                ✅ Your profile information has been updated!
            </div>
        </c:if>

        <form action="/profile/update" method="post" onsubmit="return confirm('Are you sure you want to update your profile?')">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <div class="form-group">
                <label>Username (System ID):</label>
                <input type="text" value="${user.username}" readonly>
            </div>

            <div class="form-group">
                <label>Full Name:</label>
                <input type="text" name="fullName" value="${user.fullName}" required>
            </div>

            <div class="form-group">
                <label>Email Address:</label>
                <input type="email" name="email" value="${user.email}" required>
            </div>

            <div class="form-group">
                <label>Phone Number:</label>
                <input type="text" name="phone" value="${user.phone}" required>
            </div>

            <div class="form-group">
                <label>New Password (Optional):</label>
                <input type="password" name="password" placeholder="Leave blank to keep current password">
                <p class="hint">Only fill this if you wish to change your password.</p>
            </div>

            <button type="submit" class="btn-update">Update My Information</button>
        </form>
    </div>

    <p style="text-align: center; margin-top: 20px;">
        <a href="/" style="color: #6c757d; text-decoration: none; font-size: 14px;">← Back to Homepage</a>
    </p>
</div>
</body>
</html>