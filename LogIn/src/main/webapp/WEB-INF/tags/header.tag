<%@tag description="Page header template" pageEncoding="UTF-8" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>AMV</title>
    <link rel="stylesheet" href="/amv/static/picnic.css">
    <style>
        body {
            padding-top: 4rem;
        }

        #page-title {
            display: inline;
            padding: 0;
        }

        .actions-container {
            display: flex;
            justify-content: flex-end;
            gap: .5rem;
        }

        .list > .card {
            max-width: 800px;
        }

        .list > .card header {
            display: flex;
            justify-content: space-between;
            align-items: baseline;
        }

        .list > .card header h3 {
            display: inline;
        }

        .list > .card .content {
            padding: 1rem 1rem 0 1rem;
            display: grid;
            gap: .5rem;
            grid-template-columns: auto 1fr;
            align-items: baseline;
        }

        .list > .card footer {
            display: flex;
            justify-content: flex-end;
            gap: .5rem;
        }
    </style>
</head>
<body>
<nav id="page-nav">
    <h1 id="page-title">
        AMV
    </h1>

    <input id="bmenub" type="checkbox" class="show">
    <label for="bmenub" class="burger pseudo button">menu</label>

    <div class="menu">
        <a href="/amv/equipment" class="button pseudo">Equipment</a>
        <a href="/amv/reservations" class="button pseudo">Reservations</a>
        <a href="/amv/leases" class="button pseudo">Leases</a>
        <span>|</span>
        <a href="/amv/admin/equipment" class="button pseudo">Admin/Equipment</a>
        <a href="/amv/admin/reservations" class="button pseudo">Admin/Reservations</a>
        <a href="/amv/admin/settlements" class="button pseudo">Admin/Settlements</a>
        <a href="/amv/admin/users" class="button pseudo">Admin/Users</a>
        <span>|</span>
        <a href="/amv/login?logout" class="button pseudo">Log out</a>
    </div>
</nav>
<script>
    (function () {
        const paths = [
            ["admin/equipment", "Admin/Equipment"],
            ["admin/reservations", "Admin/Reservations"],
            ["admin/settlements", "Admin/Settlements"],
            ["admin/users", "Admin/Users"],
            ["/login", "Login"],
            ["/equipment", "Equipment"],
            ["/reservations", "Reservations"],
            ["/leases", "Leases"],
        ]

        let pageTitle;
        for (const [path, title] of paths) {
            if (location.pathname.toLowerCase().endsWith(path.toLowerCase())) {
                pageTitle = title;
                break;
            }
        }

        pageTitle = "AMV - " + pageTitle;
        document.title = pageTitle;
        document.getElementById("page-title").innerText = pageTitle;
    })();
</script>
