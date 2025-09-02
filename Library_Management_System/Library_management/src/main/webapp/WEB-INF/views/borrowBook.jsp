<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Borrow Book</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f4f6f9; padding: 40px; }
        h2 { color: #333; }
        form { background: #fff; padding: 20px; border-radius: 10px; box-shadow: 0px 4px 8px rgba(0,0,0,0.1); width: 350px; }
        input, button {
            width: 100%; padding: 10px; margin: 8px 0;
            border: 1px solid #ccc; border-radius: 6px;
        }
        button {
            background: #4CAF50; color: white; border: none; cursor: pointer;
            transition: 0.3s;
        }
        button:hover { background: #45a049; transform: scale(1.05); }
    </style>
</head>
<body>
<h2>Borrow a Book</h2>

<form action="BorrowBookServlet" method="post">
    <label>Book ID:</label>
    <input type="number" name="bookId" required />

    <button type="submit">📚 Borrow</button>
</form>

<% if (request.getAttribute("message") != null) { %>
<p style="color: green; font-weight: bold;">
    <%= request.getAttribute("message") %>
</p>
<% } %>

</body>
</html>
