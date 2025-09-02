<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>Error Occurred</title>
    <style>
        body {
            background: linear-gradient(135deg, #141e30, #243b55);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            color: white;
            overflow: hidden;
        }

        .error-box {
            background: rgba(0, 0, 0, 0.6);
            border: 2px solid #00c6ff;
            border-radius: 15px;
            padding: 40px;
            text-align: center;
            box-shadow: 0px 0px 30px rgba(0, 198, 255, 0.7);
            animation: fadeIn 1.5s ease-in-out;
            max-width: 600px;
        }

        h1 {
            font-size: 3em;
            margin-bottom: 20px;
            color: #ff4b5c;
            text-shadow: 0 0 10px #ff4b5c;
        }

        p {
            font-size: 1.2em;
            margin-bottom: 30px;
        }

        .glow {
            color: #00c6ff;
            text-shadow: 0px 0px 10px #00c6ff, 0px 0px 20px #00c6ff;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .btn {
            background: linear-gradient(135deg, #00c6ff, #0072ff);
            border: none;
            color: white;
            padding: 12px 25px;
            border-radius: 30px;
            font-size: 1.1em;
            cursor: pointer;
            transition: 0.3s ease;
            text-decoration: none;
        }

        .btn:hover {
            background: linear-gradient(135deg, #0072ff, #00c6ff);
            transform: scale(1.05);
        }
    </style>
</head>
<body>
<div class="error-box">
    <h1>⚠️ Error</h1>
    <p><span class="glow">${ex}</span></p>
    <a href="${pageContext.request.contextPath}/" class="btn">⬅ Back to Home</a>
</div>
</body>
</html>
