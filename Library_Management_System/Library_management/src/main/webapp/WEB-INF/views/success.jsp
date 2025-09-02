<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Success</title>
    <style>
        body {
            margin: 0;
            font-family: "Segoe UI", sans-serif;
            background: linear-gradient(135deg, #141e30, #243b55);
            color: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            overflow: hidden;
        }

        /* Floating animated shapes */
        .bg-shape {
            position: absolute;
            border-radius: 50%;
            background: rgba(0, 255, 150, 0.1);
            animation: float 6s infinite ease-in-out alternate;
        }
        .bg-shape:nth-child(1) {
            width: 200px;
            height: 200px;
            top: 15%;
            left: 20%;
            animation-duration: 7s;
        }
        .bg-shape:nth-child(2) {
            width: 300px;
            height: 300px;
            bottom: 20%;
            right: 20%;
            animation-duration: 10s;
        }
        @keyframes float {
            from { transform: translateY(0) rotate(0deg); }
            to { transform: translateY(-40px) rotate(45deg); }
        }

        /* Success Card */
        .card {
            position: relative;
            background: rgba(0, 0, 0, 0.7);
            padding: 40px;
            border-radius: 20px;
            text-align: center;
            box-shadow: 0 0 30px rgba(0, 255, 150, 0.7);
            backdrop-filter: blur(15px);
            width: 450px;
            z-index: 1;
            animation: fadeIn 1s ease-in-out;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(50px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* Success Icon */
        .checkmark {
            font-size: 60px;
            color: #00ff99;
            text-shadow: 0 0 20px #00ff99, 0 0 40px #00ff99;
            animation: pulse 1.5s infinite;
        }
        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.2); }
            100% { transform: scale(1); }
        }

        /* Title */
        .card h2 {
            margin: 20px 0;
            font-size: 28px;
            background: linear-gradient(90deg, #00ff99, #00f2fe);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            animation: glow 2s infinite alternate;
        }
        @keyframes glow {
            from { text-shadow: 0 0 10px #00ff99; }
            to { text-shadow: 0 0 20px #00f2fe; }
        }

        /* Button */
        .btn {
            margin-top: 20px;
            padding: 12px 25px;
            font-size: 16px;
            border: none;
            border-radius: 12px;
            cursor: pointer;
            background: linear-gradient(90deg, #00ff99, #00f2fe);
            color: #000;
            font-weight: bold;
            transition: 0.3s;
        }
        .btn:hover {
            background: linear-gradient(90deg, #00f2fe, #00ff99);
            transform: scale(1.05);
            box-shadow: 0 0 20px #00ff99;
        }
    </style>
</head>
<body>
<!-- Floating Background -->
<div class="bg-shape"></div>
<div class="bg-shape"></div>

<!-- Success Card -->
<div class="card">
    <div class="checkmark">✔</div>
    <h2>Action Completed Successfully!</h2>
    <p>Your request has been processed without any issues 🎉</p>
    <form action="admin" method="post">
        <button type="submit" class="btn" name="action" value="viewBooks">📚 Back to Library</button>
    </form>
</div>
</body>
</html>
