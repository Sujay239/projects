<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee Management - Error</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #1f1f1f, #000000);
            color: white;
            text-align: center;
            padding-top: 100px;
        }

        h1 {
            font-size: 50px;
            color: #ff4d4d;
            text-shadow: 0 0 10px #ff4d4d, 0 0 20px #ff1a1a, 0 0 30px #ff0000;
            animation: glow 1.5s ease-in-out infinite alternate;
        }

        p {
            font-size: 20px;
            color: #dddddd;
            margin-top: 20px;
        }

        a {
            color: #00ffcc;
            text-decoration: none;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
        }

        @keyframes glow {
            from {
                text-shadow: 0 0 10px #ff4d4d, 0 0 20px #ff1a1a, 0 0 30px #ff0000;
            }
            to {
                text-shadow: 0 0 20px #ff6666, 0 0 30px #ff4d4d, 0 0 40px #ff1a1a;
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

<h1>⚠ Error Occurred</h1>
<p>Something went wrong while altering the employees table. Please try again.</p>
<form action="/Employee_management_war_exploded" method="post">
    <button class="btn">Go Back</button>
</form>

</body>
</html>
