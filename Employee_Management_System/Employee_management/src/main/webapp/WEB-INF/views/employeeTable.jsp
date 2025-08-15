<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Employee Details</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
            color: white;
            padding: 40px;
            text-align: center;
        }

        h1 {
            text-shadow: 0px 0px 15px #00e6ff;
            animation: glowText 2s ease-in-out infinite alternate;
        }

        @keyframes glowText {
            from { text-shadow: 0px 0px 10px #00e6ff; }
            to { text-shadow: 0px 0px 25px #00ffff; }
        }

        table {
            margin: auto;
            border-collapse: collapse;
            border-radius: 15px;
            overflow: hidden;
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(10px);
            box-shadow: 0px 0px 30px rgba(0, 230, 255, 0.2);
            animation: fadeIn 1.5s ease-in-out;
        }

        @keyframes fadeIn {
            0% { transform: translateY(50px); opacity: 0; }
            100% { transform: translateY(0); opacity: 1; }
        }

        th, td {
            padding: 15px 20px;
            text-align: center;
        }

        th {
            background: rgba(0, 230, 255, 0.2);
        }

        tr {
            transition: all 0.3s ease-in-out;
        }

        tr:hover {
            background: rgba(0, 230, 255, 0.1);
            transform: scale(1.02);
            box-shadow: 0px 0px 15px rgba(0, 230, 255, 0.3);
        }

        .export-btn {
            display: flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(90deg, #00e6ff, #00ff99);
            color: black;
            font-weight: bold;
            padding: 12px 25px;
            margin: 20px auto;
            border: none;
            border-radius: 50px;
            cursor: pointer;
            font-size: 16px;
            box-shadow: 0px 0px 15px rgba(0, 230, 255, 0.5);
            transition: all 0.3s ease-in-out;
        }

        .export-btn:hover {
            background: linear-gradient(90deg, #00ff99, #00e6ff);
            transform: scale(1.05);
            box-shadow: 0px 0px 25px rgba(0, 255, 200, 0.8);
        }
    </style>
</head>
<body>

<h1>Employee Details</h1>
<table>
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Age</th>
        <th>Skills</th>
        <th>Salary</th>
    </tr>

    <%
        List<Map<String, Object>> employees = (List<Map<String, Object>>) request.getAttribute("dataset");
        for (Map<String, Object> emp : employees) {
    %>
    <tr>
        <td><%= emp.get("id") %></td>
        <td><%= emp.get("name") %></td>
        <td><%= emp.get("age") %></td>
        <td><%= emp.get("skills") %></td>
        <td><%= emp.get("salary") %></td>
    </tr>
    <%
        }
    %>
</table>


</body>
</html>
