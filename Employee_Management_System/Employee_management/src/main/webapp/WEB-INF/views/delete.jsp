<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Delete Employee</title>
    <style>
        :root{
            --bg1:#0f2027; --bg2:#203a43; --bg3:#2c5364;
            --neon:#00f2fe; --neon2:#4facfe; --danger:#ff4d4d;
        }
        *{box-sizing:border-box}
        body{
            margin:0; height:100vh; display:flex; justify-content:center; align-items:center;
            background:linear-gradient(135deg,var(--bg1),var(--bg2),var(--bg3)); color:#fff;
            font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; overflow:hidden;
        }
        .card{
            position:relative; width:360px; padding:28px 26px 26px;
            background:rgba(255,255,255,.06); border-radius:20px; backdrop-filter:blur(10px);
            box-shadow:0 0 24px rgba(0,255,255,.25); animation:pop 600ms ease;
        }
        @keyframes pop{from{opacity:0; transform:translateY(16px)} to{opacity:1; transform:translateY(0)}}

        h2{
            margin:0 0 12px; text-align:center; font-size:1.6rem; letter-spacing:.5px;
            background:linear-gradient(90deg,var(--neon),var(--neon2)); -webkit-background-clip:text; -webkit-text-fill-color:transparent;
        }
        p.sub{margin:0 0 18px; text-align:center; opacity:.8; font-size:.93rem}

        label{display:block; margin:10px 0 8px; font-weight:600; color:#bfefff}
        .input{
            width:100%; padding:12px 14px; border:none; border-radius:12px; outline:0;
            background:rgba(255,255,255,.15); color:#fff; font-size:1rem;
            box-shadow:inset 0 0 0 1px rgba(255,255,255,.08);
            transition:box-shadow .25s, background .25s;
        }
        .input:focus{background:rgba(255,255,255,.22); box-shadow:0 0 12px rgba(0,242,254,.45)}

        .actions{margin-top:16px; display:flex; gap:10px}
        .btn{
            flex:1; padding:12px 14px; border:0; border-radius:12px; cursor:pointer; font-weight:700;
            transition:transform .15s ease, box-shadow .25s ease, filter .25s ease;
        }
        .btn-delete{
            background:linear-gradient(90deg,#ff758c,#ff7eb3); color:#1b1b1b;
            box-shadow:0 0 14px rgba(255,117,140,.45);
        }
        .btn-delete:hover{transform:translateY(-2px); box-shadow:0 0 22px rgba(255,117,140,.7)}
        .btn-cancel{
            background:linear-gradient(90deg,var(--neon),var(--neon2)); color:#081018;
            box-shadow:0 0 12px rgba(0,242,254,.35);
        }
        .btn-cancel:hover{transform:translateY(-2px); box-shadow:0 0 20px rgba(0,242,254,.6)}

        /* subtle animated grid */
        .grid{
            position:absolute; inset:-50px; z-index:-1; background:
                radial-gradient(transparent 58%, rgba(0,242,254,.08) 60%) 0 0/24px 24px,
                linear-gradient(90deg, rgba(0,242,254,.06) 1px, transparent 1px) 0 0/24px 24px,
                linear-gradient(0deg, rgba(0,242,254,.06) 1px, transparent 1px) 0 0/24px 24px;
            filter:blur(2px); animation:pan 14s linear infinite;
        }
        @keyframes pan{to{transform:translate3d(-24px,-24px,0)}}

        .hint{margin-top:8px; font-size:.85rem; opacity:.8}
    </style>
</head>
<body>
<div class="card">
    <div class="grid"></div>

    <h2>Delete Employee</h2>
    <p class="sub">Enter the <b>ID</b> of the employee you want to remove.</p>

    <form method="post" action="deleted" id="deleteForm">
        <label for="empId">Employee ID</label>
        <input class="input" type="number" id="empId" name="id" placeholder="e.g. 1024" min="1" required />
        <div class="hint">This action is irreversible.</div>

        <div class="actions">
            <button type="submit" class="btn btn-delete">Delete</button>
            <button type="button" class="btn btn-cancel" onclick="history.back()">Cancel</button>
        </div>
    </form>
</div>

<script>
    // confirm before submit + basic validation
    document.getElementById('deleteForm').addEventListener('submit', function (e) {
        const id = document.getElementById('empId').value.trim();
        if (!id || Number(id) <= 0) {
            e.preventDefault();
            alert('Please enter a valid positive ID.');
            return;
        }
        if (!confirm('Are you sure you want to delete employee with ID ' + id + ' ?')) {
            e.preventDefault();
        }
    });
</script>
</body>
</html>
