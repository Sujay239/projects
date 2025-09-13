<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee Management - Success</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
            color: white;
            text-align: center;
            padding-top: 100px;
        }

        h1 {
            font-size: 50px;
            color: #00ffcc;
            text-shadow: 0 0 10px #00ffcc, 0 0 20px #00cca3, 0 0 30px #00b38f;
            animation: glow 1.5s ease-in-out infinite alternate;
        }

        p {
            font-size: 20px;
            color: #dddddd;
            margin-top: 20px;
        }

        a {
            color: #ffdd00;
            text-decoration: none;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
        }

        @keyframes glow {
            from {
                text-shadow: 0 0 10px #00ffcc, 0 0 20px #00cca3, 0 0 30px #00b38f;
            }
            to {
                text-shadow: 0 0 20px #33ffd6, 0 0 30px #00ffcc, 0 0 40px #00cca3;
            }
        }

        .btn {
            margin-top: 40px;
            padding: 10px 25px;
            background: #00ffcc;
            color: #000;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 18px;
            transition: background 0.3s ease-in-out;
        }

        .btn:hover {
            background: #00cca3;
        }
    </style>
</head>
<body>

<h1>✅  Successfully!</h1>
<p>The employee record has been altered to the database.</p>
<form action="/Employee_management_war_exploded" method="post">
    <button class="btn">Go Back</button>
</form>

</body>
</html>
