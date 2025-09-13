<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Database Login</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            color: #fff;
        }

        .login-box {
            background: rgba(255, 255, 255, 0.05);
            padding: 40px;
            border-radius: 20px;
            backdrop-filter: blur(10px);
            box-shadow: 0 0 30px rgba(0, 230, 255, 0.3);
            text-align: center;
            animation: fadeIn 1.5s ease-in-out;
        }

        @keyframes fadeIn {
            0% { transform: translateY(-50px); opacity: 0; }
            100% { transform: translateY(0); opacity: 1; }
        }

        h1 {
            margin-bottom: 30px;
            color: #00e6ff;
            text-shadow: 0 0 15px #00e6ff;
            animation: glowText 2s ease-in-out infinite alternate;
        }

        @keyframes glowText {
            from { text-shadow: 0 0 10px #00e6ff; }
            to { text-shadow: 0 0 25px #00ffff; }
        }

        input[type="password"] {
            padding: 12px 20px;
            border-radius: 10px;
            border: none;
            margin-bottom: 20px;
            width: 250px;
            font-size: 16px;
        }

        button {
            padding: 12px 25px;
            border-radius: 50px;
            border: none;
            cursor: pointer;
            font-weight: bold;
            font-size: 16px;
            background: linear-gradient(90deg, #00e6ff, #00ff99);
            color: black;
            box-shadow: 0 0 15px rgba(0, 230, 255, 0.5);
            transition: all 0.3s ease-in-out;
        }

        button:hover {
            background: linear-gradient(90deg, #00ff99, #00e6ff);
            transform: scale(1.05);
            box-shadow: 0 0 25px rgba(0, 255, 200, 0.8);
        }
    </style>
</head>
<body>

<div class="login-box">
    <h1>Enter Database Password</h1>
    <form action="dataEmp" method="post">
        <input type="password" name="dbPassword" placeholder="Database Password" required><br>
        <button type="submit">Connect</button>
    </form>
</div>

</body>
</html>
