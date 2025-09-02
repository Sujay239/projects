<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Activity Log</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: #333;
            min-height: 100vh;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .container {
            width: 100%;
            max-width: 1200px;
            background: rgba(255, 255, 255, 0.95);
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            overflow: hidden;
            margin: 20px;
        }

        header {
            background: linear-gradient(135deg, #5e72e4, #825ee4);
            color: white;
            padding: 25px;
            text-align: center;
        }

        h1 {
            font-size: 2.5rem;
            margin-bottom: 10px;
        }

        .description {
            font-size: 1.1rem;
            opacity: 0.9;
            max-width: 800px;
            margin: 0 auto;
        }

        .content {
            padding: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 25px 0;
            font-size: 1rem;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }

        thead tr {
            background: linear-gradient(135deg, #5e72e4, #825ee4);
            color: white;
            text-align: left;
        }

        th, td {
            padding: 16px 20px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        tbody tr {
            transition: background-color 0.2s;
        }

        tbody tr:nth-of-type(even) {
            background-color: #f8f9fa;
        }

        tbody tr:last-of-type {
            border-bottom: 2px solid #5e72e4;
        }

        tbody tr:hover {
            background-color: #e9ecef;
            transform: translateY(-1px);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .id-column {
            width: 5%;
            text-align: center;
        }

        .user-column {
            color: #5e72e4;
            font-weight: 600;
        }

        .date-column {
            color: #8898aa;
            font-size: 0.9rem;
        }

        .pagination {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .pagination button {
            background: #5e72e4;
            color: white;
            border: none;
            padding: 10px 20px;
            margin: 0 5px;
            border-radius: 5px;
            cursor: pointer;
            transition: background 0.3s;
        }

        .pagination button:hover {
            background: #825ee4;
        }

        footer {
            text-align: center;
            padding: 20px;
            color: white;
            margin-top: auto;
        }

        @media (max-width: 768px) {
            table {
                display: block;
                overflow-x: auto;
            }

            th, td {
                padding: 12px 15px;
            }

            h1 {
                font-size: 2rem;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <header>
        <h1>📊 User Activity Log</h1>
        <p class="description">View all user activities with timestamps and assignment details</p>
    </header>

    <div class="content">
        <table>
            <thead>
            <tr>
                <th class="id-column">ID</th>
                <th class="id-column">Book ID</th>
                <th>Username</th>
                <th>Action Date</th>
                <th>Expiry Date</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="activity" items="${activities}">
                <tr>
                    <td class="id-column">${activity.borrow_id}</td>
                    <td class="id-column">${activity.book_id}</td>
                    <td class="user-column">${activity.username}</td>
                    <td class="date-column">${activity.actionDate}</td>
                    <td class="date-column">${activity.expiryDate}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<footer>
    <p>User Activity Dashboard &copy; 2023</p>
</footer>
</body>
</html>