<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>All Users</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #4e54c8, #8f94fb);
            color: #fff;
            text-align: center;
            padding: 20px;
        }
        table {
            margin: auto;
            border-collapse: collapse;
            width: 80%;
            background: rgba(0, 0, 0, 0.3);
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0,0,0,0.5);
        }
        th, td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
        }
        th {
            background: rgba(255,255,255,0.2);
        }
        tr:hover {
            background: rgba(255,255,255,0.1);
            transition: 0.3s ease-in-out;
        }
    </style>
</head>
<body>
<h1>👥 Registered Users</h1>
<table>
    <thead>
    <tr>
        <th>Name</th>
        <th>Password(Encode)</th>
        <th>Email</th>
        <th>Role</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="user" items="${users}">
        <tr>
            <td>${user.userName}</td>
            <td>${user.password}</td>
            <td>${user.email}</td>
            <td>${user.role}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
