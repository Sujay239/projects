<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Library Login</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: radial-gradient(circle at top left, #0f2027, #203a43, #2c5364);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            color: #fff;
        }
        .container {
            background: rgba(255,255,255,0.05);
            border-radius: 15px;
            padding: 40px;
            width: 350px;
            box-shadow: 0 8px 32px 0 rgba(31,38,135,0.37);
            backdrop-filter: blur(6px);
            text-align: center;
            animation: fadeIn 1.2s ease-in-out;
        }
        .container h2 {
            margin-bottom: 20px;
            letter-spacing: 2px;
            color: #00d4ff;
        }
        input {
            width: 90%;
            padding: 12px;
            margin: 10px 0;
            border: none;
            border-radius: 10px;
            background: rgba(255,255,255,0.1);
            color: #fff;
            font-size: 14px;
        }
        input:focus {
            outline: none;
            box-shadow: 0 0 8px #00d4ff;
        }
        button {
            width: 95%;
            padding: 12px;
            border: none;
            border-radius: 10px;
            background: linear-gradient(90deg, #00d4ff, #0077ff);
            color: #fff;
            font-size: 15px;
            font-weight: bold;
            cursor: pointer;
            margin-top: 10px;
            transition: transform 0.2s ease-in-out;
        }
        button:hover {
            transform: scale(1.05);
        }
        .link {
            margin-top: 15px;
            display: block;
            font-size: 14px;
            color: #aaa;
        }
        .link a {
            color: #00d4ff;
            text-decoration: none;
        }
        .link a:hover {
            text-decoration: underline;
        }
        @keyframes fadeIn {
            from {opacity: 0; transform: translateY(-30px);}
            to {opacity: 1; transform: translateY(0);}
        }
    </style>
</head>
<body>
<div class="container">
    <h2>🔐 Login</h2>
    <form action="LoginServlet" method="post">
        <input type="text" name="username" placeholder="Enter Username" required><br>
        <input type="password" name="password" placeholder="Enter Password" required><br>
        <button type="submit">Login</button>
    </form>
    <div class="link">
        Don’t have an account? <a href="register.jsp">Create one</a>
    </div>
</div>
</body>
</html>
