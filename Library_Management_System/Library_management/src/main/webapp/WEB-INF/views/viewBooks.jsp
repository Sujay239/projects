<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View All Books</title>
    <style>
        body {
            margin: 0;
            font-family: "Segoe UI", sans-serif;
            background: linear-gradient(135deg, #1f1c2c, #928DAB);
            color: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            overflow: auto;
        }

        /* Floating shapes */
        .bg-shape {
            position: absolute;
            border-radius: 50%;
            background: rgba(0, 150, 255, 0.12);
            animation: float 6s infinite ease-in-out alternate;
        }
        .bg-shape:nth-child(1) {
            width: 220px;
            height: 220px;
            top: 15%;
            left: 12%;
            animation-duration: 8s;
        }
        .bg-shape:nth-child(2) {
            width: 300px;
            height: 300px;
            bottom: 15%;
            right: 15%;
            animation-duration: 11s;
        }
        @keyframes float {
            from { transform: translateY(0) rotate(0deg); }
            to { transform: translateY(-40px) rotate(30deg); }
        }

        /* Card */
        .card {
            position: relative;
            background: rgba(0, 0, 0, 0.75);
            padding: 30px;
            border-radius: 20px;
            box-shadow: 0 0 30px rgba(0, 150, 255, 0.7);
            backdrop-filter: blur(15px);
            width: 90%;
            max-width: 950px;
            z-index: 1;
            animation: fadeIn 1s ease-in-out;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(50px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* Title */
        .card h2 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 28px;
            background: linear-gradient(90deg, #00f2fe, #0072ff);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            animation: glow 2s infinite alternate;
        }
        @keyframes glow {
            from { text-shadow: 0 0 10px #00f2fe; }
            to { text-shadow: 0 0 20px #0072ff; }
        }

        /* Table */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
            font-size: 16px;
            text-align: center;
            overflow: hidden;
            border-radius: 15px;
        }
        table thead {
            background: linear-gradient(90deg, #0072ff, #00f2fe);
            color: #000;
        }
        table th, table td {
            padding: 14px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }
        table tbody tr {
            transition: 0.3s;
        }
        table tbody tr:hover {
            background: rgba(0, 150, 255, 0.2);
            box-shadow: 0 0 15px #00f2fe;
            transform: scale(1.01);
        }

        /* Button */
        .btn {
            margin-top: 20px;
            padding: 12px 25px;
            font-size: 16px;
            border: none;
            border-radius: 12px;
            cursor: pointer;
            background: linear-gradient(90deg, #00f2fe, #0072ff);
            color: #000;
            font-weight: bold;
            transition: 0.3s;
            display: block;
            margin-left: auto;
            margin-right: auto;
        }
        .btn:hover {
            background: linear-gradient(90deg, #0072ff, #00f2fe);
            transform: scale(1.05);
            box-shadow: 0 0 20px #00f2fe;
        }
    </style>
</head>
<body>
<!-- Floating Background -->
<div class="bg-shape"></div>
<div class="bg-shape"></div>

<!-- Books Table -->
<div class="card">
    <h2>📚 Available Books</h2>
    <table>
        <thead>
        <tr>
            <th>🆔 Book ID</th>
            <th>📖 Title</th>
            <th>✍ Author</th>
            <th>🔢 Copies</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="book" items="${books}">
            <tr>
                <td>${book.bookId}</td>
                <td>${book.title}</td>
                <td>${book.author}</td>
                <td>${book.availableCopies}</td>
            </tr>
        </c:forEach>
        <c:if test="${empty books}">
            <tr>
                <td colspan="4">⚠ No books found in the library</td>
            </tr>
        </c:if>
        </tbody>
    </table>

    <form action="admin" method="post">
        <button type="submit" class="btn" name="action" value="addBook">➕ Add New Book</button>
    </form>
</div>
</body>
</html>
