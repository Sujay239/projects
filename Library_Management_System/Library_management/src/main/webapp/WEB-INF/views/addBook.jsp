<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Book</title>
    <style>
        /* Futuristic Background */
        body {
            margin: 0;
            font-family: "Segoe UI", sans-serif;
            background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
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
            background: rgba(0, 255, 255, 0.1);
            animation: float 6s infinite ease-in-out alternate;
        }
        .bg-shape:nth-child(1) {
            width: 200px;
            height: 200px;
            top: 10%;
            left: 10%;
            animation-duration: 7s;
        }
        .bg-shape:nth-child(2) {
            width: 300px;
            height: 300px;
            bottom: 15%;
            right: 15%;
            animation-duration: 10s;
        }
        @keyframes float {
            from { transform: translateY(0) rotate(0deg); }
            to { transform: translateY(-40px) rotate(45deg); }
        }

        /* Form Card */
        .card {
            position: relative;
            background: rgba(0, 0, 0, 0.7);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 0 25px rgba(0, 255, 255, 0.6);
            backdrop-filter: blur(15px);
            width: 400px;
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
            background: linear-gradient(90deg, #00f2fe, #4facfe);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            animation: glow 2s infinite alternate;
        }
        @keyframes glow {
            from { text-shadow: 0 0 10px #00f2fe; }
            to { text-shadow: 0 0 20px #4facfe; }
        }

        /* Inputs */
        .input-group {
            margin-bottom: 20px;
            position: relative;
        }
        .input-group label {
            display: block;
            margin-bottom: 5px;
            font-size: 14px;
            color: #9ae6ff;
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
            background: rgba(0, 255, 255, 0.2);
            box-shadow: 0 0 15px #00f2fe;
        }

        /* Button */
        .btn {
            width: 100%;
            padding: 12px;
            font-size: 16px;
            border: none;
            border-radius: 12px;
            cursor: pointer;
            background: linear-gradient(90deg, #00f2fe, #4facfe);
            color: #000;
            font-weight: bold;
            transition: 0.3s;
        }
        .btn:hover {
            background: linear-gradient(90deg, #4facfe, #00f2fe);
            transform: scale(1.05);
            box-shadow: 0 0 20px #00f2fe;
        }
    </style>
</head>
<body>
<!-- Floating animated elements -->
<div class="bg-shape"></div>
<div class="bg-shape"></div>

<!-- Futuristic Add Book Form -->
<div class="card">
    <h2>➕ Add New Book</h2>
    <form action="addBook" method="post">
        <div class="input-group">
            <label for="title">📖 Book Title</label>
            <input type="text" id="title" name="title" required>
        </div>
        <div class="input-group">
            <label for="author">✍ Author</label>
            <input type="text" id="author" name="author" required>
        </div>
        <div class="input-group">
            <label for="copies">🔢 Available Copies</label>
            <input type="number" id="copies" name="copies" required min="1">
        </div>
        <button type="submit" class="btn">✨ Add Book</button>
    </form>
</div>
</body>
</html>
