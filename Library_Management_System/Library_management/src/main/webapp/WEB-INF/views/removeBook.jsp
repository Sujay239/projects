<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Remove Book</title>
    <style>
        body {
            margin: 0;
            font-family: "Segoe UI", sans-serif;
            background: linear-gradient(135deg, #0f0c29, #302b63, #24243e);
            color: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            overflow: hidden;
        }

        /* Floating animated background shapes */
        .bg-shape {
            position: absolute;
            border-radius: 50%;
            background: rgba(255, 0, 150, 0.1);
            animation: float 6s infinite ease-in-out alternate;
        }
        .bg-shape:nth-child(1) {
            width: 220px;
            height: 220px;
            top: 12%;
            left: 18%;
            animation-duration: 7s;
        }
        .bg-shape:nth-child(2) {
            width: 280px;
            height: 280px;
            bottom: 18%;
            right: 18%;
            animation-duration: 10s;
        }
        @keyframes float {
            from { transform: translateY(0) rotate(0deg); }
            to { transform: translateY(-40px) rotate(45deg); }
        }

        /* Card */
        .card {
            position: relative;
            background: rgba(0, 0, 0, 0.75);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 0 25px rgba(255, 0, 150, 0.6);
            backdrop-filter: blur(15px);
            width: 420px;
            z-index: 1;
            animation: fadeIn 1s ease-in-out;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(40px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* Title */
        .card h2 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 26px;
            background: linear-gradient(90deg, #ff0080, #ff416c);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            animation: glow 2s infinite alternate;
        }
        @keyframes glow {
            from { text-shadow: 0 0 10px #ff0080; }
            to { text-shadow: 0 0 20px #ff416c; }
        }

        /* Inputs */
        .input-group {
            margin-bottom: 20px;
        }
        .input-group label {
            display: block;
            margin-bottom: 5px;
            font-size: 14px;
            color: #fca6d1;
        }
        .input-group input {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 12px;
            outline: none;
            background: rgba(255, 255, 255, 0.1);
            color: #fff;
            font-size: 16px;
            transition: 0.3s;
        }
        .input-group input:focus {
            background: rgba(255, 0, 150, 0.2);
            box-shadow: 0 0 15px #ff0080;
        }

        /* Button */
        .btn {
            width: 100%;
            padding: 12px;
            font-size: 16px;
            border: none;
            border-radius: 12px;
            cursor: pointer;
            background: linear-gradient(90deg, #ff0080, #ff416c);
            color: #fff;
            font-weight: bold;
            transition: 0.3s;
        }
        .btn:hover {
            background: linear-gradient(90deg, #ff416c, #ff0080);
            transform: scale(1.05);
            box-shadow: 0 0 20px #ff0080;
        }
    </style>
</head>
<body>
<!-- Floating animated shapes -->
<div class="bg-shape"></div>
<div class="bg-shape"></div>

<!-- Remove Book Form -->
<div class="card">
    <h2>❌ Remove Book</h2>
    <form action="removeBook" method="post">
        <div class="input-group">
            <label for="bookId">🔑 Book ID</label>
            <input type="number" id="bookId" name="bookId" required>
        </div>
        <button type="submit" class="btn">🚮 Remove Book</button>
    </form>
</div>
</body>
</html>
