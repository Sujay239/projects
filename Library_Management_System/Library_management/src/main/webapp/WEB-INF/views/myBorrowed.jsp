<%@ page import="java.util.List" %>
<%@ page import="java.sql.*" %>
<%@ page import="org.spring.library.Controller.ConnectDB" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>My Borrowed Books</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #fdfbfb 0%, #ebedee 100%);
            padding: 40px;
            animation: fadeIn 0.6s ease-in-out;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            border-radius: 8px;
            overflow: hidden;
        }
        th, td {
            padding: 12px 15px;
            border-bottom: 1px solid #ddd;
            text-align: center;
        }
        th {
            background: #4CAF50;
            color: white;
            font-weight: 600;
        }
        tr {
            transition: background 0.3s ease;
        }
        tr:hover {
            background: #f1f8f6;
        }
        .btn-back {
            display: inline-block;
            margin: 20px auto;
            text-decoration: none;
            background: #4CAF50;
            color: white;
            padding: 10px 20px;
            border-radius: 6px;
            transition: background 0.3s;
        }
        .btn-back:hover {
            background: #45a049;
        }

        @keyframes fadeIn {
            from {opacity: 0; transform: translateY(20px);}
            to {opacity: 1; transform: translateY(0);}
        }
    </style>
</head>
<body>
<h2>📚 My Borrowed Books</h2>

<%
    String username = (String) session.getAttribute("username"); // logged-in student
    if(username == null) {
%>
<p style="text-align:center; color:red;">⚠️ Please login to view borrowed books.</p>
<%
} else {
    Connection connection = ConnectDB.getConnection();
    String query = "SELECT * FROM borrowed_books b join books bb on b.book_id = bb.book_id where b.username = ?";
    PreparedStatement ps = connection.prepareStatement(query);
    ps.setString(1, username);
    ResultSet rs = ps.executeQuery();

    boolean hasResults = false;
%>
<table>
    <tr>
        <th>Book ID</th>
        <th>Title</th>
        <th>Author</th>
        <th>Borrow Date</th>
        <th>Return Date</th>
    </tr>
    <%
        while(rs.next()) {
            hasResults = true;
    %>
    <tr>
        <td><%= rs.getInt("book_id") %></td>
        <td><%= rs.getString("title") %></td>
        <td><%= rs.getString("author") %></td>
        <td><%= rs.getDate("borrow_date") %></td>
        <td><%= rs.getDate("return_date") %></td>
    </tr>
    <%
        }
        if(!hasResults) {
    %>
    <tr>
        <td colspan="5">No borrowed books found.</td>
    </tr>
    <%
            }
        }
    %>
</table>

<div style="text-align:center;">
    <a class="btn-back" href="index.jsp">⬅ Back to Home</a>
</div>
</body>
</html>
