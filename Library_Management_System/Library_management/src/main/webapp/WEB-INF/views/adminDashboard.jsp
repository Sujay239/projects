<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: "Segoe UI", sans-serif;
            background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
            color: white;
            text-align: center;
            padding: 40px;
        }
        h1 {
            margin-bottom: 30px;
        }
        .btn {
            display: block;
            margin: 15px auto;
            padding: 15px 30px;
            width: 280px;
            background: #ff512f;
            color: white;
            border: none;
            border-radius: 12px;
            font-size: 16px;
            cursor: pointer;
            transition: 0.3s;
        }
        .btn:hover {
            background: #dd2476;
            transform: scale(1.05);
        }
    </style>
</head>
<body>
<h1>Welcome, Admin 👨‍💼</h1>
<form action="AdminController" method="post">
    <button class="btn" name="action" value="addBook">➕ Add Book</button>
    <button class="btn" name="action" value="removeBook">❌ Remove Book</button>
</form>

<form action="viewAllBooks">
<button class="btn" name="action" value="viewBooks">📚 View All Books</button>
</form>
<form action="viewAllUsers">
<button class="btn" name="action" value="viewUsers">👥 View All Students</button>
</form>
<form action="viewBorrows">
    <button class="btn" name="action" value="viewUsers">👥 View All Borrowed Details</button>
</form>
<form action="logout">
<button class="btn" name="action" value="logout">🚪 Logout</button>
</form>
</body>
</html>
