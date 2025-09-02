<%@ page import="java.sql.*" %>
<%@ page import="org.spring.library.Controller.ConnectDB" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search Book</title>
    <style>
        body {
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
            color: #f1f1f1;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 40px;
            min-height: 100vh;
        }

        h2 {
            color: #00f5ff;
            text-shadow: 0 0 15px #00f5ff, 0 0 30px #00f5ff;
            animation: fadeIn 1.5s ease;
        }

        form {
            margin: 20px 0;
            animation: slideIn 1s ease;
        }

        input[type="text"] {
            padding: 10px;
            width: 280px;
            border: 2px solid #00f5ff;
            border-radius: 25px;
            outline: none;
            background: rgba(255, 255, 255, 0.05);
            color: #fff;
            font-size: 16px;
            transition: 0.3s;
        }

        input[type="text"]:focus {
            border-color: #ff00ff;
            box-shadow: 0 0 15px #ff00ff;
        }

        input[type="submit"] {
            margin-left: 15px;
            padding: 10px 20px;
            border: none;
            border-radius: 25px;
            font-size: 16px;
            font-weight: bold;
            color: #0f2027;
            background: linear-gradient(90deg, #00f5ff, #ff00ff);
            cursor: pointer;
            transition: transform 0.2s, box-shadow 0.3s;
        }

        input[type="submit"]:hover {
            transform: scale(1.05);
            box-shadow: 0 0 20px #00f5ff, 0 0 40px #ff00ff;
        }

        table {
            width: 80%;
            margin-top: 30px;
            border-collapse: collapse;
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(10px);
            border-radius: 12px;
            overflow: hidden;
            animation: fadeIn 2s ease;
        }

        th, td {
            padding: 12px 15px;
            text-align: center;
        }

        th {
            background: rgba(0, 245, 255, 0.2);
            color: #00f5ff;
            font-weight: bold;
            text-transform: uppercase;
        }

        tr {
            transition: background 0.3s;
        }

        tr:hover {
            background: rgba(255, 255, 255, 0.1);
        }

        p {
            margin-top: 20px;
            font-size: 18px;
            color: #ff8080;
            animation: fadeIn 1.5s ease;
        }

        /* Animations */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes slideIn {
            from { opacity: 0; transform: translateX(-50px); }
            to { opacity: 1; transform: translateX(0); }
        }
    </style>
</head>
<body>
<h2>🔍 Futuristic Book Search</h2>

<form method="get">
    <input type="text" name="query" placeholder="Enter BookId, Title or Author" required />
    <input type="submit" value="Search" />
</form>

<%
    String query = request.getParameter("query");
    if (query != null && !query.trim().isEmpty()) {
        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            connection = ConnectDB.getConnection();
            String sql = "SELECT * FROM books WHERE book_id = ? OR title LIKE ? OR author LIKE ?";
            ps = connection.prepareStatement(sql);

            int bookId = -1;
            try { bookId = Integer.parseInt(query.trim()); } catch (NumberFormatException e) {}

            ps.setInt(1, bookId);
            ps.setString(2, "%" + query + "%");
            ps.setString(3, "%" + query + "%");

            rs = ps.executeQuery();

            if (rs.isBeforeFirst()) {
%>
<table>
    <tr>
        <th>📘 ID</th>
        <th>📖 Title</th>
        <th>✍️ Author</th>
        <th>📦 Available Copies</th>
    </tr>
    <%
        while (rs.next()) {
    %>
    <tr>
        <td><%= rs.getInt("book_id") %></td>
        <td><%= rs.getString("title") %></td>
        <td><%= rs.getString("author") %></td>
        <td><%= rs.getInt("available_copies") %></td>
    </tr>
    <%
        } // end while
    %>
</table>
<%
} else {
%>
<p>No books found for "<%= query %>".</p>
<%
    }
} catch (Exception e) {
%>
<p style="color:#ff4c4c;">Error: <%= e.getMessage() %></p>
<%
        } finally {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (connection != null) connection.close();
        }
    }
%>
</body>
</html>
