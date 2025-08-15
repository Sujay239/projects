<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search Employee</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(120deg, #1a1a1a, #4a4a4a);
            color: #fff;
            text-align: center;
            padding: 50px;
        }
        form {
            background: rgba(255, 255, 255, 0.1);
            padding: 20px;
            border-radius: 12px;
            display: inline-block;
        }
        input[type="number"] {
            padding: 10px;
            width: 200px;
            border-radius: 8px;
            border: none;
            outline: none;
        }
        input[type="submit"] {
            padding: 10px 20px;
            border: none;
            background: #ff6600;
            color: white;
            border-radius: 8px;
            cursor: pointer;
            margin-left: 10px;
        }
        input[type="submit"]:hover {
            background: #ff8533;
        }
    </style>
</head>
<body>

<h1>Search Employee by ID</h1>
<form method="post" action="viewsingle">
    <label for="empId">Employee ID:</label>
    <input type="number" name="id" placeholder="Enter Employee ID" required>
    <input type="submit" value="Search">
</form>

</body>
</html>
