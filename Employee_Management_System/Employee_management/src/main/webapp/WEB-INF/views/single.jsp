<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <title>Employee Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(120deg, #1a1a1a, #4a4a4a);
            color: white;
            text-align: center;
            padding: 40px;
        }
        table {
            margin: auto;
            border-collapse: collapse;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 12px;
            overflow: hidden;
            min-width: 400px;
        }
        th, td {
            padding: 15px 20px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
        }
        th {
            background: #ff6600;
            color: white;
        }
        tr:hover td {
            background: rgba(255, 255, 255, 0.05);
        }
    </style>
</head>
<body>

<h1>Employee Information</h1>

<table>
    <tr>
        <th>ID</th>
        <td>${id}</td>
    </tr>
    <tr>
        <th>Name</th>
        <td>${name}</td>
    </tr>
    <tr>
        <th>Age</th>
        <td>${age}</td>
    </tr>
    <tr>
        <th>Skills</th>
        <td>${skills}</td>
    </tr>
    <tr>
        <th>Salary</th>
        <td>${salary}</td>
    </tr>
</table>

</body>
</html>
