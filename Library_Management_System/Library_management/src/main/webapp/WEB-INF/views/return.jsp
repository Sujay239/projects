<%@ page import="java.sql.*" %>
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*" %>
<%@ page import="org.spring.library.Controller.ConnectDB" %>
<%
    // Get logged in user (assuming stored in session)
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        conn = ConnectDB.getConnection();

        String query = "SELECT * " +
                "FROM borrowed_books b " +
                "JOIN books bk ON b.book_id = bk.book_id " +
                "WHERE b.username = ?";
        ps = conn.prepareStatement(query);
        ps.setString(1, username);
        rs = ps.executeQuery();
%>

<html>
<head>
    <title>Return Books</title>
</head>
<style>
    /* ==== Futuristic Return Book Page ==== */

    body {
        font-family: 'Poppins', sans-serif;
        background: radial-gradient(circle at top left, #0f2027, #203a43, #2c5364);
        color: #e0e0e0;
        margin: 0;
        padding: 20px;
    }

    h2 {
        text-align: center;
        font-size: 2rem;
        color: #00e6e6;
        margin-bottom: 20px;
        text-shadow: 0 0 10px #00e6e6, 0 0 20px #008080;
        animation: glow 2s infinite alternate;
    }

    @keyframes glow {
        from { text-shadow: 0 0 10px #00e6e6, 0 0 20px #008080; }
        to { text-shadow: 0 0 20px #00ffff, 0 0 30px #00e6e6; }
    }

    table {
        width: 90%;
        margin: 0 auto;
        border-collapse: collapse;
        background: rgba(20, 20, 20, 0.85);
        border-radius: 12px;
        overflow: hidden;
        box-shadow: 0 0 20px rgba(0, 255, 255, 0.2);
    }

    th, td {
        padding: 14px 20px;
        text-align: center;
    }

    th {
        background: linear-gradient(135deg, #00e6e6, #006666);
        color: #fff;
        font-size: 1rem;
        letter-spacing: 1px;
    }

    tr {
        transition: background 0.3s ease;
    }

    tr:nth-child(even) {
        background: rgba(255, 255, 255, 0.05);
    }

    tr:hover {
        background: rgba(0, 230, 230, 0.2);
        cursor: pointer;
    }

    input[type="checkbox"] {
        transform: scale(1.4);
        accent-color: #00e6e6;
        cursor: pointer;
    }

    input[type="submit"] {
        display: block;
        margin: 25px auto;
        padding: 12px 28px;
        font-size: 1rem;
        font-weight: bold;
        color: #111;
        background: linear-gradient(135deg, #00e6e6, #00b3b3);
        border: none;
        border-radius: 30px;
        cursor: pointer;
        box-shadow: 0 0 10px #00e6e6, 0 0 20px #008080;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    input[type="submit"]:hover {
        transform: translateY(-3px) scale(1.05);
        box-shadow: 0 0 20px #00ffff, 0 0 40px #00e6e6;
    }

</style>
<body>
<h2>My Borrowed Books</h2>
<form method="post" action="processReturn">
    <table border="1" cellpadding="8">
        <tr>
            <th>Select</th>
            <th>Book Title</th>
            <th>Borrow Date</th>
            <th>Return Date</th>
        </tr>
        <%
            boolean hasResults = false;
            while (rs.next()) {
                hasResults = true;
        %>
        <tr>
            <td><input type="checkbox" name="bookId" value="<%=rs.getInt("book_id")%>"></td>
            <td><%=rs.getString("title")%></td>
            <td><%=rs.getDate("borrow_date")%></td>
            <td><%=rs.getDate("return_date")%></td>
        </tr>
        <%
            }
            if (!hasResults) {
        %>
        <tr><td colspan="4">You have not borrowed any books.</td></tr>
        <% } %>
    </table>
    <br>
    <input type="submit" value="Return Selected Books">
</form>
</body>
</html>

<%
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (conn != null) conn.close();
    }
%>
