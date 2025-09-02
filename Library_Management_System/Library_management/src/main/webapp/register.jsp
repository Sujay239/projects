<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Library Registration</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #0f0c29, #302b63, #24243e);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            color: #fff;
            overflow: hidden;
        }
        .container {
            background: rgba(255,255,255,0.07);
            border-radius: 20px;
            padding: 40px;
            width: 400px;
            box-shadow: 0 8px 32px rgba(31,38,135,0.37);
            backdrop-filter: blur(8px);
            animation: zoomIn 1s ease;
        }
        .container h2 {
            margin-bottom: 25px;
            text-align: center;
            color: #4efcff;
            letter-spacing: 2px;
        }
        input {
            width: 90%;
            padding: 12px;
            margin: 12px 0;
            border: none;
            border-radius: 10px;
            background: rgba(255,255,255,0.1);
            color: #fff;
            font-size: 14px;
        }
        input:focus {
            outline: none;
            box-shadow: 0 0 8px #4efcff;
        }
        button {
            width: 95%;
            padding: 12px;
            border: none;
            border-radius: 10px;
            background: linear-gradient(90deg, #4efcff, #0077ff);
            color: #fff;
            font-size: 15px;
            font-weight: bold;
            cursor: pointer;
            margin-top: 10px;
            transition: transform 0.2s ease-in-out, background 0.3s ease;
        }
        button:hover {
            transform: scale(1.07);
            background: linear-gradient(90deg, #00ffcc, #00aaff);
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
        @keyframes zoomIn {
            from {transform: scale(0.7); opacity: 0;}
            to {transform: scale(1); opacity: 1;}
        }
    </style>
</head>
<body>
<div class="container">
    <h2>📝 Create Account</h2>
    <form action="RegisterServlet" method="post">
        <input type="text" name="username" placeholder="Enter Username" required><br>
        <input type="email" name="email" placeholder="Enter Email" required><br>
        <input type="password" name="password" placeholder="Enter Password" required><br>
        <input type="password" name="confirmPassword" placeholder="Confirm Password" required><br>
        <button type="submit">Register</button>
    </form>
    <div class="link">
        Already have an account? <a href="index.jsp">Log in</a>
    </div>
</div>
</body>
</html>
