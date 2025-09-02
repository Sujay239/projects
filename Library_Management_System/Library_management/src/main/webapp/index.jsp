<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome | Library Management</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: linear-gradient(135deg, #1f1c2c, #928dab);
            color: white;
        }
        .container {
            text-align: center;
            background: rgba(255, 255, 255, 0.1);
            padding: 40px;
            border-radius: 20px;
            backdrop-filter: blur(10px);
            box-shadow: 0 8px 25px rgba(0,0,0,0.3);
            animation: fadeIn 1s ease-in-out;
        }
        h1 {
            margin-bottom: 20px;
            font-size: 2.5em;
            letter-spacing: 2px;
        }
        .btn {
            display: inline-block;
            margin: 15px;
            padding: 15px 40px;
            font-size: 1.2em;
            font-weight: bold;
            color: white;
            background: linear-gradient(135deg, #667eea, #764ba2);
            border: none;
            border-radius: 50px;
            cursor: pointer;
            text-decoration: none;
            transition: transform 0.2s, box-shadow 0.2s;
        }
        .btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(0,0,0,0.3);
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
<div class="container">
    <h1>📚 Library Management System</h1>
    <p>Welcome! Please choose an option below:</p>
    <a href="home.jsp" class="btn">Login</a>
    <a href="register.jsp" class="btn">Register</a>
</div>
</body>
</html>
