<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<style>
    .navbar {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 12px 25px;
        background-color: #ffffff;
        border-bottom: 2px solid #eee;
        font-family: 'Segoe UI', Arial, sans-serif;
        margin-bottom: 30px;
        box-shadow: 0 2px 4px rgba(0,0,0,0.05);
    }

    .brand {
        font-size: 1.4em;
        font-weight: bold;
        color: #007bff;
        text-decoration: none;
        letter-spacing: 0.5px;
    }

    .nav-links {
        display: flex;
        align-items: center;
        gap: 10px;
    }

    .nav-item {
        text-decoration: none;
        color: #444;
        font-weight: 500;
        font-size: 0.95em;
        padding: 8px 15px;
        border-radius: 6px;
        transition: all 0.2s ease;
    }

    .nav-item:hover {
        background-color: #f0f7ff;
        color: #007bff;
    }

    .nav-admin {
        color: #007bff;
        border: 1.5px solid #007bff;
        background-color: transparent;
    }

    .nav-admin:hover {
        background-color: #007bff;
        color: white;
    }

    .logout-btn {
        background: none;
        border: 1px solid transparent;
        color: #dc3545;
        font-weight: 600;
        cursor: pointer;
        padding: 8px 15px;
        border-radius: 6px;
        font-size: 0.95em;
        transition: all 0.2s;
    }

    .logout-btn:hover {
        background-color: #fff5f5;
        border-color: #fabebf;
    }

    .nav-register {
        background-color: #007bff;
        color: white !important;
    }

    .nav-register:hover {
        background-color: #0056b3;
    }
</style>

<nav class="navbar">
    <a href="/" class="brand">Online Course Website</a>

    <div class="nav-links">
        <a href="/" class="nav-item">Home</a>

        <sec:authorize access="isAnonymous()">
            <a href="/login" class="nav-item">Login</a>
            <a href="/register" class="nav-item nav-register">Register</a>
        </sec:authorize>

        <sec:authorize access="isAuthenticated()">
            <a href="/voteHistory" class="nav-item">My Votes</a>
            <a href="/commentHistory" class="nav-item">My Comments</a>

            <a href="/profile" class="nav-item">Profile</a>

            <sec:authorize access="hasRole('TEACHER')">
                <a href="/admin/users" class="nav-item nav-admin">Manage Users</a>
                <a href="/admin/lectures" class="nav-item nav-admin">Manage Lectures</a>
                <a href="/admin/polls" class="nav-item nav-admin">Manage Polls</a>
            </sec:authorize>

            <form action="/logout" method="post" style="margin: 0; display: inline;">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <button type="submit" class="logout-btn">Logout</button>
            </form>
        </sec:authorize>
    </div>
</nav>
