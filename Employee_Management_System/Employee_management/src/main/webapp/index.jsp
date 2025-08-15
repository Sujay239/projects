<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Student Management</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
            color: #fff;
            display: flex;
            flex-direction: column;
            align-items: center;
            height: 100vh;
        }

        header {
            text-align: center;
            margin-top: 40px;
            animation: fadeInDown 1s ease-out;
        }

        header h1 {
            font-size: 3rem;
            letter-spacing: 2px;
            background: linear-gradient(90deg, #00c6ff, #0072ff);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .btn-container {
            margin-top: 50px;
            display: flex;
            gap: 30px;
            flex-wrap: wrap;
            justify-content: center;
            animation: fadeInUp 1s ease-out;
        }

        .btn {
            padding: 15px 30px;
            border: none;
            border-radius: 50px;
            font-size: 1.1rem;
            font-weight: bold;
            color: #fff;
            background: linear-gradient(90deg, #ff6a00, #ee0979);
            cursor: pointer;
            box-shadow: 0 4px 15px rgba(255, 105, 135, 0.3);
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .btn::before {
            content: "";
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: rgba(255, 255, 255, 0.2);
            transform: skewX(-25deg);
            transition: left 0.5s ease;
        }

        .btn:hover::before {
            left: 150%;
        }

        .btn:hover {
            transform: translateY(-5px) scale(1.05);
            box-shadow: 0 6px 20px rgba(255, 105, 135, 0.5);
        }

        @keyframes fadeInDown {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
<header>
    <h1>Employee Management</h1>
    <p>Manage your Employees with AI precision 🚀</p>
</header>

<div class="btn-container">
    <form action="add" method="post">
        <button class="btn">➕ Add Employee</button>
    </form>

    <form action="del" method="post">
        <button class="btn">🗑️ Delete Employee</button>
    </form>

    <form action="viewSingle" method="post">
        <button class="btn">🔍 View Single Employee</button>
    </form>

    <form action="askPassword" method="post">
        <button class="btn">📋 View All Employees</button>
    </form>
</div>
</body>
</html>
