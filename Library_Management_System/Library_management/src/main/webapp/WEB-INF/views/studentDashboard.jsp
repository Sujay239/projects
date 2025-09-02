<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Student Dashboard</title>
    <style>
        body {
            font-family: "Segoe UI", sans-serif;
            background: linear-gradient(135deg, #232526, #414345);
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
            width: 250px;
            background: #00c6ff;
            color: white;
            border: none;
            border-radius: 12px;
            font-size: 16px;
            cursor: pointer;
            transition: 0.3s;
        }
        .btn:hover {
            background: #0072ff;
            transform: scale(1.05);
        }
    </style>
</head>
<body>
<h1>Welcome, Student 👨‍🎓</h1>

<form action="search_book"><button class="btn" name="action" value="searchBook" >🔍 Search Book</button> </form>

<form action="borrowBook"><button class="btn" name="action" value="borrowBook">📚 Borrow Book</button></form>

<form action="returnABook"><button class="btn" name="action" value="returnBook">↩️ Return Book</button></form>

<form action="myBooks"><button class="btn" name="action" value="myBooks">📖 My Borrowed Books</button></form>

<form action="logout"><button class="btn" name="action" value="logout">🚪 Logout</button></form>

</body>
</html>
