<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Employee</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: #0f2027;
            color: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            overflow: hidden;
            position: relative;
        }

        /* Canvas background for particles */
        #particles {
            position: absolute;
            top: 0;
            left: 0;
            z-index: 0;
        }

        form {
            position: relative;
            z-index: 1;
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(10px);
            padding: 30px;
            border-radius: 20px;
            width: 350px;
            box-shadow: 0 0 20px rgba(0,255,255,0.4);
            animation: fadeIn 1s ease-in-out;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 1.8em;
            letter-spacing: 1px;
            background: linear-gradient(90deg, #00f2fe, #4facfe);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-bottom: 18px;
            border: none;
            border-radius: 10px;
            outline: none;
            background: rgba(255, 255, 255, 0.15);
            color: #fff;
            transition: 0.3s;
        }

        input::placeholder {
            color: rgba(255, 255, 255, 0.6);
        }

        input:focus {
            background: rgba(255, 255, 255, 0.25);
            box-shadow: 0 0 10px #00f2fe;
        }

        button {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 10px;
            background: linear-gradient(90deg, #00f2fe, #4facfe);
            color: white;
            font-size: 1em;
            cursor: pointer;
            transition: 0.3s;
        }

        button:hover {
            box-shadow: 0 0 15px #00f2fe;
            transform: scale(1.05);
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
<canvas id="particles"></canvas>

<form method="post" action="added">
    <h2>Add Employee</h2>
    <label>Name:</label>
    <input type="text" name="name" placeholder="Enter employee name" required>

    <label>Age:</label>
    <input type="number" name="age" placeholder="Enter employee age" required>

    <label>Skill Set:</label>
    <input type="text" name="skill" placeholder="Enter employee skills, comma separated" required>

    <label>Salary:</label>
    <input type="number" name="salary" placeholder="Enter employee salary per month" required>

    <button type="submit" id="sub">Add Employee</button>
</form>

<script>
    const canvas = document.getElementById('particles');
    const ctx = canvas.getContext('2d');
    let particles = [];

    canvas.width = window.innerWidth;
    canvas.height = window.innerHeight;

    class Particle {
        constructor() {
            this.x = Math.random() * canvas.width;
            this.y = Math.random() * canvas.height;
            this.size = Math.random() * 3 + 1;
            this.speedX = Math.random() * 1 - 0.5;
            this.speedY = Math.random() * 1 - 0.5;
        }
        update() {
            this.x += this.speedX;
            this.y += this.speedY;

            if (this.x < 0 || this.x > canvas.width) this.speedX *= -1;
            if (this.y < 0 || this.y > canvas.height) this.speedY *= -1;
        }
        draw() {
            ctx.fillStyle = 'rgba(0,255,255,0.7)';
            ctx.beginPath();
            ctx.arc(this.x, this.y, this.size, 0, Math.PI * 2);
            ctx.fill();
        }
    }

    function init() {
        particles = [];
        for (let i = 0; i < 100; i++) {
            particles.push(new Particle());
        }
    }

    function connect() {
        for (let a = 0; a < particles.length; a++) {
            for (let b = a; b < particles.length; b++) {
                let dx = particles[a].x - particles[b].x;
                let dy = particles[a].y - particles[b].y;
                let distance = Math.sqrt(dx * dx + dy * dy);
                if (distance < 100) {
                    ctx.strokeStyle = 'rgba(0,255,255,0.1)';
                    ctx.lineWidth = 1;
                    ctx.beginPath();
                    ctx.moveTo(particles[a].x, particles[a].y);
                    ctx.lineTo(particles[b].x, particles[b].y);
                    ctx.stroke();
                }
            }
        }
    }

    function animate() {
        ctx.clearRect(0, 0, canvas.width, canvas.height);
        for (let i = 0; i < particles.length; i++) {
            particles[i].update();
            particles[i].draw();
        }
        connect();
        requestAnimationFrame(animate);
    }

    window.addEventListener('resize', () => {
        canvas.width = window.innerWidth;
        canvas.height = window.innerHeight;
        init();
    });
    init();
    animate();

    // document.getElementById("sub").addEventListener("click", function () {
    //     alert("Employee added successfully. Check your database.");
    // });


</script>
</body>
</html>
